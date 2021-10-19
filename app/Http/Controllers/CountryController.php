<?php

namespace App\Http\Controllers;

use App\Models\CountryLanguage;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items = (new Country())->getDatas($request->all());
        return view('admin.country.index', ['datas' => $items]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $languages = getLanguage();
        return view('admin.country.create', ['languages' => $languages]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('country.create'))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataCountry = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $country = Country::create($dataCountry);
        foreach ($languages as $language) {
            $name = "";
            if (empty($request['name_' . $language->code])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $language->code];
            }

            $dataCountryLang = [
                'name' => $name,
                'country_id' => $country->id,
                'lang' => $language->code
            ];

            CountryLanguage::create($dataCountryLang);
        }
        return redirect(route('country.index'));
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
     * @param  App\Models\Country $country
     * @return \Illuminate\Http\Response
     */
    public function edit(Country $country)
    {
        $languages = getLanguage();
        $data = [
            'country' => $country,
            'languages' => $languages,
        ];
        return view('admin.country.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Models\Country $country
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Country $country, Request $request)
    {
        $languages = getLanguage();
        $validator = Validator::make($request->all(), [
            'name_' . $languages[0]->code => 'required'
        ], [
            'name_' . $languages[0]->code . '.required' => "Tên không được trống"
        ]);
        if ($validator->fails()) {
            return redirect(route('country.edit', ['country' => $country->id]))->with(['data' => []])
                ->withErrors($validator)
                ->withInput();
        }
        $dataCountry = [
            'name' => $request['name_' . $languages[0]->code],
            'status' => !empty($request['status']) ? $request->status : 0,
        ];
        $country->fill($dataCountry);
        $country->save();
        $arrLang = [];
        foreach ($country->countryLanguages as $countryLanguage) {
            $arrLang[] = $countryLanguage->lang;
            $name = "";
            if (empty($request['name_' . $countryLanguage->lang])) {
                $name = $request['name_' . $languages[0]->code];
            } else {
                $name = $request['name_' . $countryLanguage->lang];
            }

            $dataCountryLang = [
                'name' => $name
            ];

            $countryLanguage->fill($dataCountryLang);
            $countryLanguage->save();
        }
        // created
        if (count($languages) != count($arrLang)) {
            foreach ($languages as $language) {
                $isNewLang = true;
                foreach ($arrLang as $lang) {
                    if ($language->code == $lang) {
                        $isNewLang = false;
                    }
                }
                if ($isNewLang) {
                    $name = "";
                    if (empty($request['name_' . $language->code])) {
                        $name = $request['name_' . $languages[0]->code];
                    } else {
                        $name = $request['name_' . $language->code];
                    }

                    $dataCountryLang = [
                        'name' => $name,
                        'country_id' => $country->id,
                        'lang' => $language->code
                    ];

                    CountryLanguage::create($dataCountryLang);
                }
            }
        }
        return redirect(route('country.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Country $country
     * @return \Illuminate\Http\Response
     */
    public function destroy(Country $country)
    {
        if (!empty($country)) {
            CountryLanguage::where('country_id', $country->id)->delete();
            $country->delete();
            return response()->json([
                'status' => 1
            ]);
        }
        return response()->json([
            'status' => 0
        ]);
    }
}
