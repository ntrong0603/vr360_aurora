<div class="top-right">
    <div id="map">
        <img src="{{asset('frontend/images/masterplan.png')}}" alt="" srcset="">
    </div>
    <div id="language">
        <ul>
            @foreach (getLanguage() as $lang)
            <li class="{{ \Session::get('website_language') == $lang->code ? 'active' : '' }}">
                <a href="{{route('changeLanguage', ['language' => $lang->code])}}">
                    @if (!empty($lang->photo) && Storage::disk('language_image')->has($lang->photo))
                    <img src="{{asset('storage/language_image/'.$lang->photo)}}" alt="" srcset="">
                    @else
                    {{$lang->code}}
                    @endif
                </a>
            </li>
            @endforeach

        </ul>
    </div>
</div>
