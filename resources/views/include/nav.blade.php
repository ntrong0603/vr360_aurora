<nav class="fix-left">
    <button id="btn-nav-bar">
        <img id="img-open-nav" src="{{asset('frontend/images/bars-solid.svg')}}" alt="">
        <img id="img-close-nav" src="{{asset('frontend/images/times-circle-regular.svg')}}" alt="">
    </button>
    <div class="logo-nav">
        <a href="https://auroraip.vn/"><img src="{{asset('storage/setting_image/'.getSetting('logo'))}}" alt=""></a>
    </div>
    <ul class="nav-main">
        @foreach (getCategory() as $key => $category)
        <li class="dropdown active">
            <a class="nav-group">{{$category['name']}}</a>
            @if (!empty($category['child']))
            <ul>
                @foreach ($category['child'] as $key2 => $child)
                @if($child['style_event'] == 1)
                <li class="@if($key == 0 && $key2 == 0) active @endif" data-scene="{{$child['name_scene']}}" data-view="{{$child['name_hotspot']}}">
                    {{$child['name']}}
                </li>
                @endif
                @if($child['style_event'] == 2)
                <li class="@if($key == 0 && $key2 == 0) active @endif" data-content="{!!$child['content']!!}">
                    {{$child['name']}}
                </li>
                @endif
                @if($child['style_event'] == 3)
                <li class="@if($key == 0 && $key2 == 0) active @endif">
                    <a href="{{$child['link']}}" target="_blank">{{$child['name']}}</a>
                </li>
                @endif
                @endforeach
            </ul>
            @endif
        </li>
        @endforeach
    </ul>
</nav>

<div class="popup popup-dark popup-content-nav">
    <div class="popup-info">
        <a class="btn-close-popup">x</a>
        <div class="content">
        </div>
    </div>
</div>

