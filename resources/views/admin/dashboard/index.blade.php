@extends('admin.layout')
@section('title', 'Quản lý thống kê')
@push('styles')
<link rel="stylesheet" href="{{asset('plugins/css/daterangepicker.css')}}">
<style>
</style>
@endpush
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Main row -->
            <div class="row">

                <div class="col-md-12">
                    <!-- LINE CHART -->
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Biểu đồ lượi truy cập <span id="line-time"></span></h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-9">
                                    <button type="button" class="btn btn-info js-btn-select-range-time" data-range-time="all">
                                        Tất cả
                                    </button>
                                    <button type="button" class="btn btn-default js-btn-select-range-time" data-range-time="day">
                                        Ngày
                                    </button>
                                    <button type="button" class="btn btn-default js-btn-select-range-time" data-range-time="week">
                                        Tuần
                                    </button>
                                    <button type="button" class="btn btn-default js-btn-select-range-time" data-range-time="month">
                                        Tháng
                                    </button>
                                    <button type="button" class="btn btn-default js-btn-select-range-time" data-range-time="year">
                                        Năm
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="datefilter">
                                        <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-body chart-responsive">
                            <div class="chart">
                                <canvas id="lineChart" height='400px'></canvas>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Biểu đồ lượt xem lô đất</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- ./chart-responsive -->
                                    <div id="canvas-holder">
                                        <div class="chartjs-size-monitor">
                                            <div class="chartjs-size-monitor-expand">
                                                <div class=""></div>
                                            </div>
                                            <div class="chartjs-size-monitor-shrink">
                                                <div class=""></div>
                                            </div>
                                        </div>
                                        <canvas id="chart-area" class="chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
                <div class="col-md-6">

                    <!-- TABLE: LATEST ORDERS -->
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách lô đất</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table no-margin">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($listTop as $item)
                                        <tr>
                                            <td><a href="{{route('land.edit', ['land' => $item->id])}}">{{$item->name}}</a>
                                            </td>
                                            <td>{{$item->view}}</td>
                                        </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.box-body -->
                        <div class="card-footer clearfix">
                            <a href="{{route('land.index')}}" class="btn btn-sm btn-default btn-flat pull-right">View All
                                Orders</a>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
@push('scripts')
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="{{asset('plugins/chart.js/Chart.min.js')}}"></script>
<script src="{{asset('plugins/js/moment.min.js')}}"></script>
<script src="{{asset('plugins/js/daterangepicker.js')}}"></script>
<!-- AdminLTE for demo purposes -->
<script>
    function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        var config = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [
                        @foreach($listProduct as $item)
                        {{$item->view}},
                        @endforeach
                    ],
                    backgroundColor: [
                        @foreach($listProduct as $item)
                        @if(!empty($item->color_chart))
                        "{{$item->color_chart}}",
                        @else
                        getRandomColor(),
                        @endif
                        @endforeach
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    @foreach($listProduct as $item)
                    '{{$item->name}}',
                    @endforeach
                ]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'right',
                },
                title: {
                    display: false,
                    text: 'Chart.js Doughnut Chart'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };

        window.onload = function() {
            var ctx = document.getElementById('chart-area').getContext('2d');
            window.myDoughnut = new Chart(ctx, config);
        };

        /**
        {y: '2011 Q1', item1: 2666},
                {y: '2011 Q2', item1: 2778},
                {y: '2011 Q3', item1: 4912},
                {y: '2011 Q4', item1: 3767},
                {y: '2012 Q1', item1: 6810},
                {y: '2012 Q2', item1: 5670},
                {y: '2012 Q3', item1: 4820},
                {y: '2012 Q4', item1: 15073},
                {y: '2013 Q1', item1: 10687},
                {y: '2013 Q2', item1: 8432}
                */
        let typeGetView = "all";
        $(".js-btn-select-range-time").on("click", function(e) {
            typeGetView = $(this).data('range-time');
            $(".js-btn-select-range-time").removeClass('btn-info');
            $(".js-btn-select-range-time").removeClass('btn-default');
            $(".js-btn-select-range-time").addClass('btn-default');
            $(this).removeClass('btn-default');
            $(this).addClass('btn-info');
            getDataChart();
            //btn-info
        });
        getDataChart();
        function getDataChart(firstDate = '', lastDate = '') {
            $.ajax({
                url: "{{route('dashboard.getDataView')}}",
                type: 'GET',
                data: {
                    type: typeGetView,
                    firstDate: firstDate,
                    lastDate: lastDate,
                },
                success: function (result)
                {
                    $("#line-time").text(result.flgDate);
                    drawChartView(result.dataChart, result.lengedChart);
                },
                statusCode: {
                }
            });
        }
        function drawChartView(dataChart = [], lengedChart = []) {
            if(window.chartView) {
                window.chartView.destroy();
            }
            document.getElementById('lineChart').style.height = "250px";
            var config2 = {
                type: 'line',
                data: {
                    datasets: [{
                        data: dataChart,
                        backgroundColor: '#3c8dbc',
                        borderColor: 'rgb(255, 99, 132)',
                        label: 'Total'
                    }],
                    labels: lengedChart,
                },
                options: {
                    responsive: true,
                maintainAspectRatio: false,
                    aspectRatio: 1,
                    legend: {
                        display: false,
                        position: 'right',
                    },
                    title: {
                        display: false,
                        text: 'Chart.js Doughnut Chart'
                    },
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    },
                    tooltips: {
                        callbacks: {
                            labelColor: function(tooltipItem, chart) {
                                return {
                                    borderColor: '#3c8dbc',
                                    backgroundColor: '#3c8dbc'
                                };
                            },
                            label: function(tooltipItem, data) {
                                var label = data.datasets[tooltipItem.datasetIndex].label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                                return label;
                            }
                        }
                    }
                }
            };
            var ctx2 = document.getElementById('lineChart').getContext('2d');
            window.chartView = new Chart(ctx2, config2);
        }
        drawChartView();
        $('input[name="datefilter"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
            typeGetView = "search_date";
            getDataChart(picker.startDate.format('YYYY-MM-DD'), picker.endDate.format('YYYY-MM-DD'));
        });

        $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });
</script>
@endpush
