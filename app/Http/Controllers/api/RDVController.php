<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RDVRequest;
use App\http\Resources\RDVRecource;
use App\Models\rdv;
use Illuminate\Http\Request;

class RDVController extends Controller
{
    public function index() {
        // return response()->json("function index works");
        return RDVRecource::collection(RDV::all());
    }

    public function show(RDV $rdv) {
        return new RDVRecource($rdv);
    }

    public function store(RDVRequest $request) {

        rdv::create($request->validated());
        return response()->json("RDV was created successfuly!!");
    }

    public function update(RDVRequest $request, RDV $rdv) {

        $rdv->update($request->validated());
        return response()->json("RDV was updated successfuly!!");
    }

    public function destroy(RDV $rdv) {
        $rdv->delete();
        return response()->json("RDV was deleted successfuly!!");
    }


}
