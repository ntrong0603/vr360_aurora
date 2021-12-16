<?php

namespace App\Http\Controllers;

use App\Models\ReservationRegister;
use Illuminate\Http\Request;

class ReservationRegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new ReservationRegister())->getDatas($request->all());
        return view('admin.reservation_2.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ReservationRegister $reservationRegister
     * @return \Illuminate\Http\Response
     */
    public function edit(ReservationRegister $reservationRegister)
    {
        $data = [
            'reservationRegister' => $reservationRegister,
        ];
        $reservationRegister->fill(['new' => 1]);
        $reservationRegister->save();
        return view('admin.reservation_2.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Reservation $reservation
     * @return \Illuminate\Http\Response
     */
    public function destroy(ReservationRegister $reservationRegister)
    {
        if (!empty($reservationRegister)) {
            $reservationRegister->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
