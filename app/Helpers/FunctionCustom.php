<?php

use App\Models\Business;
use App\Models\BusinessLanguage;
use App\Models\BusinessStyle;
use App\Models\BusinessStyleLanguage;
use App\Models\Category;
use App\Models\CategoryLanguage;
use App\Models\Contact;
use App\Models\Country;
use App\Models\CountryLanguage;
use App\Models\Enquiry;
use App\Models\EnquiryLanguage;
use App\Models\Land;
use App\Models\LandLanguage;
use App\Models\Language;
use App\Models\Reservation;
use App\Models\Scene;
use App\Models\SceneLanguage;
use App\Models\Setting;
use App\Models\Text;
use App\Models\Utilities;
use App\Models\UtilitiesLanguage;
use App\Models\Visiting;
use App\Models\VisitingLanguage;

if (!function_exists('getSetting')) {
    function getSetting($code)
    {
        $value = (new Setting())->where("code_setting", $code)->first();
        if (!empty($value)) {
            return $value->value;
        }
        return null;
    }
}

if (!function_exists('saveSetting')) {
    function saveSetting($where, $data)
    {
        $value = (new Setting())->createdOrUpdate($where, $data);
        return $value;
    }
}

if (!function_exists('getLanguage')) {
    function getLanguage()
    {
        $value = (new Language())->where("status", 1)->get();
        return $value;
    }
}

if (!function_exists('getTitle')) {
    function getTitle($code)
    {

        $name = '';
        $text = (new Text())->where("code", $code)->first();
        $textLanguages = $text->textLanguages ?? [];

        foreach ($textLanguages as $textLanguage) {
            if (\Session::get('website_language') == $textLanguage->lang) {
                $name = $textLanguage->name;
                $find = true;
                break;
            }
        }
        return $name;
    }
}

if (!function_exists('getCountry')) {
    function getCountry()
    {
        $countryLanguageModel = new CountryLanguage();
        $data = [];
        $countries = (new Country())->where('status', 1)->get();
        foreach ($countries as $country) {
            $id = $country->id;
            $name = $country->name;
            $countryLanguage = $countryLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('country_id', $country->id)->first();
            if (!empty($countryLanguage)) {
                $name = $countryLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('getBusiness')) {
    function getBusiness()
    {
        $businessLanguageModel = new BusinessLanguage();
        $data = [];
        $businesses = (new Business())->where('status', 1)->get();
        foreach ($businesses as $business) {
            $id = $business->id;
            $name = $business->name;
            $businessLanguage = $businessLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('business_id', $business->id)->first();
            if (!empty($businessLanguage)) {
                $name = $businessLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('getBusinessStyle')) {
    function getBusinessStyle()
    {
        $businessLanguageModel = new BusinessStyleLanguage();
        $data = [];
        $businessesStyle = (new BusinessStyle())->where('status', 1)->get();
        foreach ($businessesStyle as $business) {
            $id = $business->id;
            $name = $business->name;
            $businessLanguage = $businessLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('business_style_id', $business->id)->first();
            if (!empty($businessLanguage)) {
                $name = $businessLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('getEnquiry')) {
    function getEnquiry()
    {
        $enquiryLanguageModel = new EnquiryLanguage();
        $data = [];
        $enquiries = (new Enquiry())->where('status', 1)->get();
        foreach ($enquiries as $enquiry) {
            $id = $enquiry->id;
            $name = $enquiry->name;
            $note = '';
            $enquiryLanguage = $enquiryLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('enquiry_id', $enquiry->id)->first();
            if (!empty($enquiryLanguage)) {
                $name = $enquiryLanguage->name;
                $note = $enquiryLanguage->note;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
                'note' => $note,
            ];
        }
        return $data;
    }
}

if (!function_exists('getVisiting')) {
    function getVisiting()
    {
        $visitingLanguageModel = new VisitingLanguage();
        $data = [];
        $visitings = (new Visiting())->where('status', 1)->get();
        foreach ($visitings as $visiting) {
            $id = $visiting->id;
            $name = $visiting->name;
            $visitingLanguage = $visitingLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('visiting_id', $visiting->id)->first();
            if (!empty($visitingLanguage)) {
                $name = $visitingLanguage->name;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
            ];
        }
        return $data;
    }
}

if (!function_exists('countNewContact')) {
    function countNewContact()
    {
        $count = (new Contact())->where('status', 0)->count();
        return $count;
    }
}

if (!function_exists('countVisit')) {
    function countVisit()
    {
        $count = (new Reservation())->where('new', 0)->where('loai', 2)->count();
        return $count;
    }
}

if (!function_exists('getScene')) {
    function getScene()
    {
        $sceneLanguageModel = new SceneLanguage();
        $data = [];
        $scenes = (new Scene())->get();
        foreach ($scenes as $scene) {
            $id = $scene->id;
            $nameScene = $scene->name_scene;
            $name = $scene->name;
            $content = $scene->name;
            $sceneLanguage = $sceneLanguageModel
                ->where('lang', \Session::get('website_language'))
                ->where('scene_id', $scene->id)->first();
            if (!empty($sceneLanguage)) {
                $name = $sceneLanguage->name;
                $content = $sceneLanguage->content;
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
                'content' => $content,
                'nameScene' => $nameScene
            ];
        }
        return $data;
    }
}

if (!function_exists('getUtilities')) {
    function getUtilities()
    {
        $model = new UtilitiesLanguage();
        $data = [];
        $list = (new Utilities())->get();
        foreach ($list as $item) {
            $id = $item->id;
            $name = $item->name;
            $nameHotspot = $item->name_hotspot;
            $photo = '';
            $utilitiesLanguage = $model
                ->where('lang', \Session::get('website_language'))
                ->where('utilities_id', $item->id)->first();
            if (!empty($utilitiesLanguage)) {
                $name = $utilitiesLanguage->name;
                if (!empty($utilitiesLanguage->photo)) {
                    $photo =  asset('storage/utilities_image/') . $utilitiesLanguage->photo;
                }
            }
            $data[] = [
                'id' => $id,
                'name' => $name,
                'photo' => $photo,
                'nameHotspot' => $nameHotspot
            ];
        }
        return $data;
    }
}

if (!function_exists('getCategory')) {
    function getCategory()
    {
        $model = new CategoryLanguage();
        $data = [];
        $list = (new Category())->where('category_id', 0)->where('status', 1)->get();
        foreach ($list as $item) {
            $name = $item->name;
            $language = $model
                ->where('lang', \Session::get('website_language'))
                ->where('category_id', $item->id)->first();
            if (!empty($language)) {
                $name = $language->name;
            }
            $childData = [];
            $listChild = (new Category())->where('category_id', $item->id)->where('status', 1)->get();
            foreach ($listChild as $child) {
                $nameChild = $child->name;
                $content = '';
                $childLanguage = $model
                    ->where('lang', \Session::get('website_language'))
                    ->where('category_id', $child->id)->first();
                if (!empty($childLanguage)) {
                    $nameChild = $childLanguage->name;
                    $content = $childLanguage->content;
                }
                $childData[] = [
                    'id' => $child->id,
                    'name' => $nameChild,
                    'link' => $child->link,
                    'style_event' => $child->style_event,
                    'name_scene' => $child->name_scene,
                    'content' =>  $content
                ];
            }
            $data[] = [
                'id' => $item->id,
                'name' => $name,
                'child' => $childData,
            ];
        }
        return $data;
    }
}

if (!function_exists('getLand')) {

    function getLand()
    {
        $model = new LandLanguage();
        $data = [];
        $list = (new Land())->get();
        foreach ($list as $item) {
            $name = $item->name;
            $content = '';
            $landLanguage = $model
                ->where('lang', \Session::get('website_language'))
                ->where('land_id', $item->id)->first();
            if (!empty($landLanguage)) {
                $name = $landLanguage->name;
                $name = $landLanguage->content;
            }
            $data[] = [
                'id' => $item->id,
                'name' => $name,
                'content' => $content,
                'nameLand' => $item->name_land,
                'status' => $item->status
            ];
        }
        return $data;
    }
}
