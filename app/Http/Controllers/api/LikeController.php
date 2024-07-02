<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LikeRequest;
use App\Models\Like;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Like::with('user', 'post')->get();
    }

    public function show(Like $like)
    {
        $like->load('user', 'post');
        return $like;
    }

    public function store(LikeRequest $request)
    {

        Like::create($request->validated());
        return response()->json("Like was created successfuly!!");
    }

    public function update(LikeRequest $request, Like $like)
    {

        $like->update($request->validated());
        return response()->json("Like was updated successfuly!!");
    }

    public function destroy(Like $like)
    {
        $like->delete();
        return response()->json("Like was deleted successfuly!!");
    }
}
