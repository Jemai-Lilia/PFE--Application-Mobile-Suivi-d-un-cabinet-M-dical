<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ResponseRequest;
use App\Models\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class ResponseController extends Controller
{
    public function index() {
        // return response()->json("function index works");
        return Response::with('user', 'question', 'medic')->get();;
    }

    public function show(Response $response) {
        $response->load('user', 'question', 'medic');
        return $response;
    }

    public function store(ResponseRequest $request) {

        Response::create($request->validated());
        return response()->json("Response was created successfuly!!");
    }

    public function update(ResponseRequest $request, Response $response) {

        $response->update($request->validated());
        return response()->json("Response was updated successfuly!!");
    }

    public function destroy(Response $response) {
        $response->delete();
        return response()->json("Response was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Response::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('responses');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }

}
