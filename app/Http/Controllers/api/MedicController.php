<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MedicRequest;
use App\Models\Medic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class MedicController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Medic::with('user', 'spec')->get();
    }

    public function show(Medic $medic)
    {
        $medic->load('user', 'spec');
        return $medic;
    }

    public function findByUserId($user_id)
    {
        $medic = Medic::where('user_id', $user_id)->first();
        if (!$medic) {
            return response()->json([
                'status' => false,
                'message' => 'Medicin doesnt exist.',
            ], 401);
        }
        $medic->load('user', 'spec');
        return $medic;
    }

    public function store(MedicRequest $request)
    {

        Medic::create($request->validated());
        return response()->json("Medic was created successfuly!!");
    }

    public function update(MedicRequest $request, Medic $medic)
    {

        $medic->update($request->validated());
        return response()->json("Medic was updated successfuly!!");
    }

    public function destroy(Medic $medic)
    {
        $medic->delete();
        return response()->json("Medic was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Medic::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('medics');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();
        $results->load('user', 'spec');
        return response()->json($results);
    }
}
