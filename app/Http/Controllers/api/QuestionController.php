<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\QuestionRequest;
use App\Models\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class QuestionController extends Controller
{
    public function index() {
        // return response()->json("function index works");
        return Question::with('user', 'medic')->get();
    }

    public function show(Question $question) {
        $question->load('user', 'medic');
        return $question;
    }

    public function store(QuestionRequest $request) {

        Question::create($request->validated());
        return response()->json("Question was created successfuly!!");
    }

    public function update(QuestionRequest $request, Question $question) {

        $question->update($request->validated());
        return response()->json("Question was updated successfuly!!");
    }

    public function destroy(Question $question) {
        $question->delete();
        return response()->json("Question was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Question::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('questions');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }

}
