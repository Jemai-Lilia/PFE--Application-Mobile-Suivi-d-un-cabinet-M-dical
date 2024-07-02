<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CommentRequest;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class CommentController extends Controller
{
    public function index() {
        // return response()->json("function index works");
        return Comment::with('user', 'post')->get();
    }

    public function show(Comment $comment) {
        $comment->load('user', 'post');
        return $comment;
    }

    public function store(CommentRequest $request) {

        Comment::create($request->validated());
        return response()->json("Comment was created successfuly!!");
    }

    public function update(CommentRequest $request, Comment $comment) {

        $comment->update($request->validated());
        return response()->json("Comment was updated successfuly!!");
    }

    public function destroy(Comment $comment) {
        $comment->delete();
        return response()->json("Comment was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Comment::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('comments');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }

}
