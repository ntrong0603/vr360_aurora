<?php

namespace App\Http\Controllers;

use App\Models\Business;
use App\Models\Contact;
use App\Models\Country;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMail;
use App\Models\BusinessStyle;
use App\Models\Enquiry;
use App\Models\Land;
use App\Models\LandUse;
use App\Models\Reservation;
use App\Models\ReservationRegister;
use App\Models\Visiting;
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
    public function edit(Contact $contact)
    {
        $data = [
            'contact' => $contact,
        ];
        $contact->fill(['status' => 1]);
        $contact->save();
        return view('admin.contact.edit', $data);
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
            $visitModel = new Visiting();
            $visiting = '';
            if (!empty($request->muc_dich_tham_quan)) {
                $countVisiting = count($request->muc_dich_tham_quan);
                foreach ($request->muc_dich_tham_quan as $key => $mucDich) {
                    $visiting = $visiting . ($visitModel->find((int)$mucDich))->name;
                    if ($key + 1 < $countVisiting) {
                        $visiting = $visiting . ', ';
                    }
                }
            }
            $details['muc_dich_tham_quan'] = $visiting;
            try {
                $contact                             = new Reservation();
                $contact->ten_dk                     = $request->ten_dk;
                $contact->sdt                        = $request->sdt;
                $contact->email                      = $request->email;
                $contact->ten_doanh_nghiep           = $request->ten_doanh_nghiep;
                $contact->country_id                 = $request->quoc_gia;
                $contact->business_id                = $request->nganh_nghe;
                $contact->visiting                   = $visiting;
                $contact->muc_dich_tham_quan_khac    = $request->muc_dich_tham_quan_khac;
                $contact->so_nguoi_tham_quan         = $request->so_nguoi_tham_quan;
                $contact->tham_quan_tu_ngay          = (!empty($request->tham_quan_tu_ngay)) ? date_format(date_create($request->tham_quan_tu_ngay), "Y-m-d") : null;
                $contact->tham_quan_den_ngay         = (!empty($request->tham_quan_den_ngay)) ? date_format(date_create($request->tham_quan_den_ngay), "Y-m-d") : null;
                $contact->content                    = $request->content;
                $contact->loai                       = 2;

                $contact->save();
                $result = Mail::to($email)->send(new ContactMail($details));
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

    public function reservationLand(Request $request)
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
            $details["template"] = 'mail.reservation';
            $details["subject"] = '[Đăng ký đặt giữ chỗ] Liên hệ từ khách hàng';
            // if (!empty($details["nganh_nghe"])) {
            //     $details["nganh_nghe"] = ((new Business())
            //         ->select(['name'])
            //         ->where('id', $details["nganh_nghe"])
            //         ->first())['name'] ?? '';
            // } else {
            $details["nganh_nghe"] = $request->nganh_nghe;
            // }
            if (!empty($details["quoc_gia"])) {
                $details["quoc_gia"] = ((new Country())
                    ->select(['name'])
                    ->where('id', $details["quoc_gia"])
                    ->first())['name'] ?? '';
            } else {
                $details["quoc_gia"] = '';
            }
            $landUseModel = new LandUse();
            $details["muc_dich_su_dung_name"] = '';
            $details["muc_dich_su_dung_id"] = '';
            if (!empty($details["muc_dich_su_dung"])) {
                $countlandUse = count($request->muc_dich_su_dung);
                foreach ($request->muc_dich_su_dung as $key => $mucDich) {
                    $details["muc_dich_su_dung_name"] .= ($landUseModel->find((int)$mucDich))->name;
                    $details["muc_dich_su_dung_id"] .= $mucDich;
                    if ($key + 1 < $countlandUse) {
                        $details["muc_dich_su_dung_name"] .= ', ';
                        $details["muc_dich_su_dung_id"] .= ', ';
                    }
                }
            }

            $details["land_name"] = '';
            $details["land_id_group"] = '';
            if (!empty($details["land_id"])) {
                foreach ($details["land_id"] as $key => $idLand) {
                    $details["land_name"] .= ((new Land())
                        ->select(['name'])
                        ->where('id', $idLand)
                        ->first())['name'] ?? '';
                    $details["land_id_group"] .= $idLand;
                    if ($key + 1 < count($details["land_id"])) {
                        $details["land_name"] .= ", ";
                        $details["land_id_group"] .= ", ";
                    }
                }
            }
            try {
                $contact                             = new ReservationRegister();
                $contact->ten_dk                     = $request->ten_dk;
                $contact->sdt                        = $request->sdt;
                $contact->email                      = $request->email;
                $contact->ten_doanh_nghiep           = $request->ten_doanh_nghiep;
                $contact->country_id                 = $request->quoc_gia;
                $contact->business                   = $request->nganh_nghe;
                $contact->land_use_id                = $details["muc_dich_su_dung_id"];
                $contact->land_use_name              = $details["muc_dich_su_dung_name"];
                $contact->muc_dich_su_dung_khac      = $request->muc_dich_su_dung_khac;
                $contact->land_id                    = $details["land_id_group"];
                $contact->land_name                    = $details["land_name"];
                $contact->content                    = $request->content;

                $contact->save();
                $result = Mail::to($email)->send(new ContactMail($details));
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

    public function processContact(Request $request)
    {
        $result = [];
        $companyName = getSetting("company_name") ?? "Tour VR 360";
        $email = getSetting("to_email");
        if (empty($email)) {
            $result = [
                "error" => 1,
                "Messager" => "Not found email send to",
            ];
        } else {
            $rule = [
                'name'         => 'required',
                'phone'        => 'required',
                'email'        => 'required|email',
                'company_type' => 'required',
                // 'enquiry'      => 'required',
                'business'     => 'required',
                'company_nationality'  => 'required',
                // 'profection' => 'required|min:5|max:50',/
                // 'note'       => 'required',
            ];
            $mesRule = [
                'name.required' => getTitle('vldtt'),
                'phone.required' => getTitle('vldtt'),
                'email.required' => getTitle('vldtt'),
                'email.email' => getTitle('dcemkhl'),
                // 'enquiry.required' => getTitle('vldtt'),
                'business.required' => getTitle('vldtt'),
                'company_type.required' => getTitle('vldtt'),
            ];
            $request->validate($rule, $mesRule);
            $mBus = new Business();
            $mCom = new BusinessStyle();
            $mComNa = new Country();
            // $mEn  = new Enquiry();

            $details                = $request->all();
            $companyTypeName        = ($mCom->find($request->company_type))->name;
            $companyNationalityName = ($mComNa->find($request->company_nationality))->name;
            // $businessName           = ($mBus->find($request->business))->name;
            $details["companyName"]            = $companyName;
            $details["companyTypeName"]        = $companyTypeName;
            $details["companyNationalityName"] = $companyNationalityName;
            // $details["businessName"]           = $businessName;
            $details["enquiryName"]            = [];
            // foreach ($request->enquiry as $id) {
            //     $enquiryName            = ($mEn->find($id))->name;
            //     $details["enquiryName"][] = $enquiryName;
            // }

            try {
                $contact                           = new Contact();
                $contact->name                     = $request->name;
                $contact->phone                    = $request->phone;
                $contact->email                    = $request->email;
                $contact->company_type             = $request->company_type;
                $contact->company_type_name        = $companyTypeName;
                $contact->company_nationality      = $request->company_nationality;
                $contact->company_nationality_name = $companyNationalityName;
                $contact->company_name             = $request->company_name;
                // $contact->enquiry                  = json_encode($request->enquiry, JSON_UNESCAPED_UNICODE);
                // $contact->enquiry_name             = json_encode($details["enquiryName"], JSON_UNESCAPED_UNICODE);
                $contact->enquiry_name             = $request->nc;
                $contact->area                     = $request->area;
                $contact->nationality              = $request->nationality;
                $contact->business                 = $request->business;
                // $contact->business_name            = $businessName;
                $contact->note                     = $request->note;
                $contact->save();
                $result = Mail::to($email)->send(new ContactMail($details));
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
}
