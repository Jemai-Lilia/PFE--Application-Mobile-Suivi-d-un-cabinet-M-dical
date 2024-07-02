<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostRequest;
use App\Models\Post;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function Index()
    {
        return Post::with('user')->get();
    }

    public function show(Post $post)
    {
        $post->load('user');
        return $post;
    }

    public function store(PostRequest $request)
    {

        try {
            $imageName = Str::random(32) . "." . $request->image->getClientOriginalExtension();

            Post::create([
                'image' => $imageName,
                'title' => $request->title,
                'type' => $request->type,
                'description' => $request->description,
                'user_id' => Auth::id(),
            ]);

            Storage::disk('public')->put($imageName, file_get_contents($request->image));

            return response()->json([
                'status' => true,
                'message' => 'Post Created In Successfully',

            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function update(PostRequest $request, Post $post)
    {

        $post->update($request->validated());
        return response()->json('updated successfully');
    }

    public function destroy(Post $post)
    {
        $post->delete();
        return response()->json('ticketdeleted succefully');
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Post::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('posts');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }
}
