<?php

namespace App\Http\Controllers;

use App\Models\Land;
use App\Models\View;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $land = new Land();
        $arrWhere = [];
        $arrSort = [
            [
                "column" => "view",
                "value"  => "DESC",
            ],
        ];
        $limit = 10;
        $listTopView = $land->getDatas($arrWhere, $limit, $arrSort, false);
        $listProduct = $land->select(["view", "name"])->get();

        return view('admin.dashboard.index', ['listTop' => $listTopView, 'listProduct' => $listProduct]);
    }

    public function getDataView(Request $request)
    {
        $type = $request->get('type');
        $firstDate = $request->get('firstDate');
        $lastDate = $request->get('lastDate');
        $listView = new View();
        $listView =  $listView->select(['created_at', 'id']);
        $dataChart = array();
        switch ($type) {
            case 'search_date':
                $listView = $listView->whereDate("created_at", ">=", $firstDate);
                $listView = $listView->whereDate("created_at", "<=", $lastDate);
                $listView = $listView->get()->toArray();
                $arrCoutView = [];
                $lengedChart = [];
                foreach ($listView as $item) {
                    $dateInMonth = (new DateTime(date($item['created_at'])))->format('Y-m-d');
                    if (empty($arrCoutView[$dateInMonth])) {
                        $arrCoutView[$dateInMonth] = 1;
                    } else {
                        $arrCoutView[$dateInMonth] = $arrCoutView[$dateInMonth] + 1;
                    }
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key;
                    $dataChart[] = $item;
                }
                $flgDate = $firstDate . " - " . $lastDate;
                break;
                break;
            case 'day':
                $dayNow = date("Y-m-d");
                $listView = $listView->whereDate("created_at", $dayNow);
                $listView = $listView->get()->toArray();
                $arrCoutView = [];
                $lengedChart = [];
                for ($hour = 0; $hour < 24; $hour++) {
                    if ($hour < 10) {
                        $key = '0' . $hour;
                    } else {
                        $key = $hour;
                    }
                    $arrCoutView[trim($key)] = 0;
                }
                foreach ($listView as $item) {
                    $hourView = (new DateTime(date($item['created_at'])))->format('H');
                    $arrCoutView[$hourView] = $arrCoutView[$hourView] + 1;
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key . ":00";
                    $dataChart[] = $item;
                }
                $flgDate = $dayNow;
                break;
            case 'week':
                $now = Carbon::now();
                $weekStartDate = $now->startOfWeek()->format('Y-m-d');
                $weekEndDate = $now->endOfWeek()->format('Y-m-d');
                $listView = $listView->whereDate("created_at", ">=", $weekStartDate);
                $listView = $listView->whereDate("created_at", "<=", $weekEndDate);
                $listView = $listView->get()->toArray();
                $arrCoutView = [];
                $lengedChart = [];
                foreach ($listView as $item) {
                    $dateInMonth = (new DateTime(date($item['created_at'])))->format('Y-m-d');
                    if (empty($arrCoutView[$dateInMonth])) {
                        $arrCoutView[$dateInMonth] = 1;
                    } else {
                        $arrCoutView[$dateInMonth] = $arrCoutView[$dateInMonth] + 1;
                    }
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key;
                    $dataChart[] = $item;
                }
                $flgDate = $weekStartDate . " - " . $weekEndDate;
                break;
            case 'month':
                $firstMonthNow = date("Y-m-01");
                $lastMonthNow = (new DateTime(date("Y-m-01")))->modify('last day of this month');
                $listView = $listView->whereDate("created_at", ">=", $firstMonthNow);
                $listView = $listView->whereDate("created_at", "<=", $lastMonthNow);
                $listView = $listView->get()->toArray();
                $dateLastMonthNow = (new DateTime(date("Y-m-01")))->modify('last day of this month')->format('d');
                $arrCoutView = [];
                $lengedChart = [];
                for ($date = 1; $date <= $dateLastMonthNow; $date++) {
                    if ($date < 10) {
                        $key =  date("Y-m") . '-0' . $date;
                    } else {
                        $key = date("Y-m") . "-" . $date;
                    }
                    $arrCoutView[trim($key)] = 0;
                }
                foreach ($listView as $item) {
                    $dateInMonth = (new DateTime(date($item['created_at'])))->format('Y-m-d');
                    $arrCoutView[$dateInMonth] = $arrCoutView[$dateInMonth] + 1;
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key;
                    $dataChart[] = $item;
                }
                $flgDate = date("Y-m");
                break;
            case 'year':
                $yearNow = date("Y");
                $listView = $listView->whereYear("created_at", $yearNow);
                $listView = $listView->get()->toArray();
                $arrCoutView = [];
                $lengedChart = [];
                for ($month = 1; $month <= 12; $month++) {
                    if ($month < 10) {
                        $key =  date("Y") . '-0' . $month;
                    } else {
                        $key = date("Y") . "-" . $month;
                    }
                    $arrCoutView[trim($key)] = 0;
                }
                foreach ($listView as $item) {
                    $dateInMonth = (new DateTime(date($item['created_at'])))->format('Y-m');
                    $arrCoutView[$dateInMonth] = $arrCoutView[$dateInMonth] + 1;
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key;
                    $dataChart[] = $item;
                }
                $flgDate = $yearNow;
                break;
            default:
                $listView = $listView->get()->toArray();
                $arrCoutView = [];
                $lengedChart = [];
                foreach ($listView as $item) {
                    $dateInMonth = (new DateTime(date($item['created_at'])))->format('Y-m');
                    if (empty($arrCoutView[$dateInMonth])) {
                        $arrCoutView[$dateInMonth] = 1;
                    } else {
                        $arrCoutView[$dateInMonth] = $arrCoutView[$dateInMonth] + 1;
                    }
                }
                ksort($arrCoutView);
                foreach ($arrCoutView as $key => $item) {
                    $lengedChart[] = $key;
                    $dataChart[] = $item;
                }
                $flgDate = '';
                break;
        }
        // dd($request->all());
        return response()->json(['dataChart' => $dataChart, 'lengedChart' => $lengedChart, 'flgDate' => $flgDate]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
