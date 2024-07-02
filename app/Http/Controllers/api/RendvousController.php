<?php

namespace App\Http\Controllers\api;

use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Http\Requests\RendvousRequest;
use App\Models\Patient;
use App\Models\Rendvous;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;


class RendvousController extends Controller
{
    public function index()
    {
        // return response()->json("function index works");
        return Rendvous::with('medic', 'patient')->get();
    }

    public function show(Rendvous $rendvous)
    {
        $rendvous->load('medic', 'patient');
        return $rendvous;
    }

    // public function store(RendvousRequest $request)
    // {

    //     // $date = Carbon::now();
    //     // $formattedDate = $date->format('Y-m-d');
    //     return response()->json("Rendvous was created successfuly!!");
    // }

    // Validate the request and create the rendezvous
    public function store(RendvousRequest $request)
    {
        $validatedData = $request->validated();
        $rendezvous = Rendvous::create($validatedData);

        // Get the patient associated with the rendezvous
        $patient = Patient::find($validatedData['patient_id']);

        if ($patient) {
            // Send notification to the patient
            try {
                // Set the FCM token of the patient (assuming you have stored it in the patient model)
                $FcmToken = $patient->fcm_token;

                $serverKey = 'AAAAfeM_j6A:APA91bHU1kg1FaNdxN-XMHOTpbsnnzRksLNVEus7iF_fhN0BJK2I2McK7-xQkBHLGh0Fdq6FiEXMpnFBbregKpKTnQZaR9Uc_QUUof8-S2TpsFRB69dAg6GulW78dTPkvvDWLIJkPO3Q'; // ADD SERVER KEY HERE PROVIDED BY FCM

                $data = [
                    "registration_ids" => $FcmToken,
                    "notification" => [
                        "title" => $request->title,
                        "body" => $request->body,
                    ],
                    "data" => [ // Additional data to send
                        "time" => $request->time,
                        "date" => $request->date
                    ]
                ];

                $headers = [
                    'Authorization: key=' . $serverKey,
                    'Content-Type: application/json',
                ];

                $ch = curl_init();

                curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
                curl_setopt($ch, CURLOPT_POST, true);
                curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
                curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
                // Disabling SSL Certificate support temporarily
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

                // Execute post
                $result = curl_exec($ch);
                if ($result === FALSE) {
                    die('Curl failed: ' . curl_error($ch));
                }

                // Close connection
                curl_close($ch);

                // FCM response
                dd($result);
            } catch (\Throwable $e) {
                return response()->json([
                    'status' => false,
                    'message' => 'Failed to send notification to the patient.',
                    'error' => $e->getMessage()
                ], 500);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Patient not found.'
            ], 404);
        }
    }

    public function update(RendvousRequest $request, Rendvous $rendvous)
    {

        $rendvous->update($request->validated());
        return response()->json("Rendvous was updated successfuly!!");
    }

    public function destroy(Rendvous $rendvous)
    {
        $rendvous->delete();
        return response()->json("Rendvous was deleted successfuly!!");
    }

    public function search(Request $request)
    {
        $searchTerm = $request->input('search');

        $results = Rendvous::where(function ($query) use ($searchTerm) {
            $columns = Schema::getColumnListing('rendvouses');
            foreach ($columns as $column) {
                $query->orWhere($column, 'LIKE', '%' . $searchTerm . '%');
            }
        })->get();

        return response()->json($results);
    }


}
