<?php

namespace App\Http\Controllers;

use App\Models\Business;
use App\Models\Contact;
use App\Models\Country;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMail;
use App\Models\Reservation;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Contact())->getDatas($request->all());
        return view('admin.contact.index', ['datas' => $items]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    public function reservationContact(Request $request)
    {
        $result = [];
        $companyName = getSetting("company_name") ?? "Khu công nghiệp Aurora";
        $email = getSetting("to_email");
        if (empty($email)) {
            $result = [
                "error" => 1,
                "Messager" => "Not found email send to",
            ];
        } else {
            $rule = [
                'ten_dk'           => 'required',
                'ten_doanh_nghiep' => 'required',
                'email'            => 'required|email',
                'sdt'              => 'required|regex:/^([0-9\s\-\+\(\)]*)$/',
            ];
            $mesRule = [
                'ten_dk.required' => getTitle('vldtt'),
                'ten_doanh_nghiep.required' => getTitle('vldtt'),
                'email.required' => getTitle('vldtt'),
                'email.email' => getTitle('dcemkhl'),
                'sdt.required' => getTitle('vldtt'),
                'sdt.regex' => getTitle('sdtkhl'),
            ];
            $request->validate($rule, $mesRule);
            $details = $request->all();
            $details["companyName"] = $companyName;
            $details["template"] = 'mail.visit';
            $details["subject"] = '[Đăng ký tham quan] Liên hệ từ khách hàng';
            if (!empty($details["nganh_nghe"])) {
                $details["nganh_nghe"] = ((new Business())
                    ->select(['name'])
                    ->where('id', $details["nganh_nghe"])
                    ->first())['name'] ?? '';
            } else {
                $details["nganh_nghe"] = '';
            }
            if (!empty($details["quoc_gia"])) {
                $details["quoc_gia"] = ((new Country())
                    ->select(['name'])
                    ->where('id', $details["quoc_gia"])
                    ->first())['name'] ?? '';
            } else {
                $details["quoc_gia"] = '';
            }

            try {
                $contact                             = new Reservation();
                $contact->ten_dk                     = $request->ten_dk;
                $contact->sdt                        = $request->sdt;
                $contact->email                      = $request->email;
                $contact->ten_doanh_nghiep           = $request->ten_doanh_nghiep;
                $contact->country_id                 = $request->quoc_gia;
                $contact->business_id                = $request->nganh_nghe;
                $contact->visiting_id                =  (!empty($request->muc_dich_tham_quan)) ? implode(", ", $request->muc_dich_tham_quan) : null;
                $contact->muc_dich_tham_quan_khac    = $request->muc_dich_tham_quan_khac;
                $contact->so_nguoi_tham_quan         = $request->so_nguoi_tham_quan;
                $contact->tham_quan_tu_ngay          = (!empty($request->tham_quan_tu_ngay)) ? date_format(date_create($request->tham_quan_tu_ngay), "Y-m-d") : null;
                $contact->tham_quan_den_ngay         = (!empty($request->tham_quan_den_ngay)) ? date_format(date_create($request->tham_quan_den_ngay), "Y-m-d") : null;
                $contact->content                    = $request->content;
                $contact->loai                       = 2;

                $contact->save();
                // $result = Mail::to($email)->send(new ContactMail($details));
                $result = [
                    "error" => 0,
                    "Messager" => "Gửi thông tin thành cồng",
                ];
            } catch (\Exception $e) {
                $result = [
                    "error" => 1,
                    "Messager" => $e->getLine() . ": " . $e->getMessage(),
                ];
            }
        }
        return response()->json($result);
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
     * @param  \App\Models\Contact $contact
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contact $contact)
    {
        if (!empty($contact)) {
            $contact->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
