<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <title>{{getSetting("title")}}</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, viewport-fit=cover" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta name="description" content="{{getSetting(" keywork")}}">
    <meta name="keywords" content="{{getSetting(" description")}}" />
    <link rel="shortcut icon" type="{{ asset('upload/images/'. getSetting(" logo"))}}" />
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('frontend/css/select2.min.css')}}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/jquery-ui.css')}}">
    <link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">
</head>

<body>

    <script src="{{asset('tour/tour.js')}}"></script>

    <div id="pano" style="width:100%;height:100%;">
        <noscript>
            <table style="width:100%;height:100%;">
                <tr style="vertical-align:middle;">
                    <td>
                        <div style="text-align:center;">ERROR:<br /><br />Javascript not activated<br /><br /></div>
                    </td>
                </tr>
            </table>
        </noscript>
        <script>
            embedpano({swf:"{{asset('tour/tour.swf')}}", xml:"{{asset('tour/tour.xml')}}", target:"pano", html5:"auto", mobilescale:1.0, passQueryParameters:true});
        </script>
    </div>
    <div class="loading">
        <div class="loader">
        </div>
    </div>
    <a class="chat" data-tooltip="{{ getTitle('lh') }}">
        <div class="btn-chat">
            <img src="{{ asset('frontend/images/envelope-regular.svg')}}" alt="btn contact">
        </div>
    </a>
    <div class="master-plan">
        <a class="btn-close-masterplan"></a>
        <div id="img-masterplan">
            <img id="img-zoom" src="{{asset('tour/images/map.png')}}" alt="masterplan">
        </div>
    </div>
    <!-- -->
    <!-- -->
    @include('include.nav')
    @include('include.language')
    <!-- popup -->
    @include('include.content')
    @include('include.land_content')
    @include('include.contact')
    @include('include.register')
    <!-- -->
    <script>
        var urlReservationContact="{{route('reservationContact')}}" ;
        var urlContact="{{route('contact')}}" ;
        var urlViewLand="{{route('updateView')}}" ;

    </script>
    @include('include.scene_info')
    @include('include.utilities_info')
    @include('include.land_info')
    <script src="{{ asset('frontend/js/jquery-3.4.1.min.js')}}"></script>
    <script src="{{ asset('frontend/js/jquery-ui.js')}}"></script>
    <script src="{{ asset('frontend/js/sweetalert2.all.min.js')}}"></script>
    <script src="{{ asset('frontend/js/select2.min.js')}}"></script>
    <script src="{{ asset('frontend/js/wheel-zoom.min.js')}}"></script>
    <script src="{{asset('frontend/js/script.js')}}"></script>
</body>

</html>
