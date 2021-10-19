<div class="top-right">
    <div id="map">
        <img src="{{asset('frontend/images/masterplan.png')}}" alt="" srcset="">
    </div>
    <div id="language">
        <ul>
            @foreach (getLanguage() as $lang)
            <li class="{{ \Session::get('website_language') == $lang->code ? 'active' : '' }}">
                <a href="{{route('changeLanguage', ['language' => $lang->code])}}">
                    {{-- <img src="{{asset('storage/language_image/'.$lang->photo)}}" alt="" srcset=""> --}}
                    {{$lang->code}}
                </a>
            </li>
            @endforeach

        </ul>
    </div>
</div>
