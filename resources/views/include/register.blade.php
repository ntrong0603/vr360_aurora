<div class="popup popup-register">
    <div class="popup-info">
        <a class="btn-close-popup">x</a>
        <div class="popup-title">
            <h1>{{getTitle('dktq')}}</h1>
        </div>
        <div class="popup-form-register">
            <form method="POST">
                <div class="main-form">
                    <dl class="form-group">
                        <dt>
                            <label for="ten_doanh_nghiep">{{getTitle('tdn')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_doanh_nghiep" id="ten_doanh_nghiep" placeholder="{{getTitle('tdn')}} (*)" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="ten_dk">{{getTitle('ht')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_dk" id="ten_dk" placeholder="{{getTitle('ht')}} (*)" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="email">{{getTitle('e')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="email" name="email" id="email" placeholder="{{getTitle('e')}} (*)" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="sdt">{{getTitle('sdt')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="sdt" id="sdt" placeholder="{{getTitle('sdt')}} (*)" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="nganh_nghe">{{getTitle('nnkd')}}:</label>
                        </dt>
                        <dd>
                            <select name="nganh_nghe" id="nganh_nghe" class="select-box">
                                @foreach (getBusiness() as $business)
                                <option value="{{$business['id']}}">{{$business['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="quoc_gia">{{getTitle('dntqg')}}:</label>
                        </dt>
                        <dd>
                            <select name="quoc_gia" id="quoc_gia" class="select-box">
                                @foreach (getCountry() as $country)
                                <option value="{{$country['id']}}">{{$country['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="so_nguoi_tham_quan">{{getTitle('sntq')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="so_nguoi_tham_quan" id="so_nguoi_tham_quan" placeholder="{{getTitle('sntq')}} (*)" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="tham_quan_tu_ngay">{{getTitle('tgdktq')}}:</label>
                        </dt>
                        <dd style="display: flex; align-items: center; justify-content: space-between; padding-top: 4px;">
                            <div class="flex-center-between" style="width: 49%;">
                                <label for="tham_quan_tu_ngay" style="padding: 0; margin-bottom: -4px;">{{getTitle('t')}}: </label>
                                <input type="text" name="tham_quan_tu_ngay" id="tham_quan_tu_ngay" placeholder="" autocomplete="off" style="padding-bottom: 0">
                                <label for="tham_quan_tu_ngay" class="c-calendar">
                                    <img src="{{asset('frontend/images/calendar-alt-regular.svg')}}" alt="">
                                </label>
                            </div>
                            <div class="flex-center-between" style="width: 49%;">
                                <label for="tham_quan_den_ngay" style="padding: 0; margin-bottom: -4px;">{{getTitle('d')}}: </label>
                                <input type="text" name="tham_quan_den_ngay" id="tham_quan_den_ngay" placeholder="" autocomplete="off" style="padding-bottom: 0">
                                <label for="tham_quan_den_ngay" class="c-calendar">
                                    <img src="{{asset('frontend/images/calendar-alt-regular.svg')}}" alt="">
                                </label>
                            </div>
                        </dd>
                    </dl>
                    <dl class="form-group checkbox-inline">
                        <dt>
                            <label>{{getTitle('mdtq')}}:</label>
                        </dt>
                        <dd>
                            @foreach (getVisiting() as $visiting)
                            <input type="checkbox" name="muc_dich_tham_quan[]" id="muc_dich_tham_quan_{{$visiting['id']}}" value="{{$visiting['id']}}">
                            <label for="muc_dich_tham_quan_{{$visiting['id']}}">
                                {{$visiting['name']}}
                            </label>
                            @endforeach
                            <input type="checkbox" name="muc_dich_tham_quan_khac_checkbox" id="muc_dich_tham_quan_khac_checkbox" value="0">
                            <label for="muc_dich_tham_quan_khac_checkbox">
                                {{getTitle('k')}}
                            </label>
                        </dd>
                    </dl>
                    <dl class="form-group">
                        <dt>
                            <label for="muc_dich_tham_quan_khac" style="visibility: hidden">{{getTitle('k')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="muc_dich_tham_quan_khac" id="muc_dich_tham_quan_khac" placeholder="{{getTitle('k')}}" autocomplete="off" readonly>
                        </dd>
                    </dl>
                    <dl class="form-group w-100 placeholderCT textarea-cs">
                        <dt>
                            <label for="content">{{getTitle('nd')}}:</label>
                        </dt>
                        <dd>
                            <textarea name="content" id="content" placeholder="{{getTitle('nd')}} (*)" class=""></textarea>
                        </dd>
                    </dl>
                </div>
                <div class="form-group text-center padding-top-10">
                    <button type="submit" class="btn btn-submit">{{getTitle('dk')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>
