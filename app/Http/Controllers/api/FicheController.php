<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\FicheRequest;
use App\Models\Fiche;
use Illuminate\Http\Request;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;

class FicheController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Fiche::with('dossier')->get();
    }

    public function show(Fiche $fiche)
    {
        $fiche->load('dossier');
        return $fiche;
    }

    public function store(FicheRequest $request)
    {
        try {
            $imageName = Str::random(32) . "." . $request->image->getClientOriginalExtension();

            Fiche::create([
                'image' => $imageName,
                'note' => $request->note,
                'dossier_id' => $request->dossier_id,
            ]);

            Storage::disk('public')->put($imageName, file_get_contents($request->image));

            return response()->json([
                'status' => true,
                'message' => 'Fiche added Successfully',

            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }

        // Fiche::create($request->validated());
        // return response()->json("Fiche was created successfuly!!");
    }

    public function update(FicheRequest $request, Fiche $fiche)
    {

        $fiche->update($request->validated());
        return response()->json("Fiche was updated successfuly!!");
    }

    public function destroy(Fiche $fiche)
    {
        $fiche->delete();
        return response()->json("Fiche was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Fiche::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('fiches');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }
}
