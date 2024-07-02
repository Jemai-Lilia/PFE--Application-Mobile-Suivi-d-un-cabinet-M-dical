<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MedicamentRequest;
use App\Models\Medicament;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Schema;

class MedicamentController extends Controller
{

    public function index()
    {
        // return response()->json("function index works");
        return Medicament::with('dossier')->get();
    }

    public function show(Medicament $medicament)
    {
        $medicament->load('dossier');
        return $medicament;
    }

    public function store(MedicamentRequest $request)
    {
        $date = Carbon::now();
        $formattedDate = $date->format('d-m-Y');

        $medicament = new Medicament();
        $medicament->nom = $request->nom;
        $medicament->period = $request->period;
        $medicament->date = $formattedDate;
        $medicament->save();

        // Medicament::create($request->validated());
        return response()->json("Medicament was created successfuly!!");
    }

    public function update(MedicamentRequest $request, Medicament $medicament)
    {

        $medicament->update($request->validated());
        return response()->json("Medicament was updated successfuly!!");
    }

    public function destroy(Medicament $medicament)
    {
        $medicament->delete();
        return response()->json("Medicament was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Medicament::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('medicaments');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }
}
