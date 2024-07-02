<?php

namespace App\Http\Controllers;

use App\Http\Requests\PatientRequest;
use App\Models\Patient;
use App\Models\User;
use Illuminate\Http\Request;

class PatientController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Patient::with('user', 'medic')->get();
    }

    public function show(Patient $patient)
    {
        $patient->load('user', 'medic');
        return $patient;
    }

    public function findByUserId($user_id)
    {
        $patient = Patient::where('user_id', $user_id)->first();
        if (!$patient) {
            return response()->json([
                'status' => false,
                'message' => 'Patient doesnt exist.',
            ], 401);
        }
        $patient->load('user', 'medic');
        return $patient;
    }

    public function store(PatientRequest $request)
    {

        Patient::create($request->validated());
        return response()->json("Patient was created successfuly!!");
    }

    public function update(PatientRequest $request, Patient $patient)
    {

        $patient->update($request->validated());
        return response()->json("Patient was updated successfuly!!");
    }

    public function destroy(Patient $patient)
    {
        $patient->delete();
        return response()->json("Patient was deleted successfuly!!");
    }
}
