<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Report;

class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('ReportCreate');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)  //儲存檢舉資訊
    {
        $validated = $request->validate([
            'Acc_Name' => 'required|string|max:255', //被檢舉者id
            'Reason' => 'required|string|max:255',
        ]);

        $AccMember = User::Where('name','=',$validated['Acc_Name'])->first();

        if($AccMember){
            $report = new Report();
            $report->Com_id = Auth::user()->id;
            $report->Reason = $validated['Reason'];
            $report->Acc_id = $AccMember->id;
            $report->is_handle = false;

            $report->save();
            session()->flash('success', '舉發成功');

            return redirect(route('dashboard'));
        }
        else{
            return redirect(route('Report.create'));
        }


    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
