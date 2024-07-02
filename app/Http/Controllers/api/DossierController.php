<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\DossierRequest;
use App\Models\Dossier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class DossierController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Dossier::with('medic')->get();
    }

    public function show(Dossier $dossier)
    {
        $dossier->load('medic');
        return $dossier;
    }

    public function store(DossierRequest $request)
    {

        Dossier::create($request->validated());
        return response()->json("Dossier was created successfuly!!");
    }

    public function update(DossierRequest $request, Dossier $dossier)
    {

        $dossier->update($request->validated());
        return response()->json("Dossier was updated successfuly!!");
    }

    public function destroy(Dossier $dossier)
    {
        $dossier->delete();
        return response()->json("Dossier was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Dossier::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('dossiers');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }
}
