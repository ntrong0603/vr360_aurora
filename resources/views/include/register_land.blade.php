<div class="popup popup-register-land">
    <div class="popup-info">
        <a class="btn-close-popup">x</a>
        <div class="popup-title">
            <h1>{{getTitle('dkdgc')}}</h1>
        </div>
        <div class="popup-form-register-land">
            <form method="POST">
                <div class="main-form">
                    <dl class="form-group ms-order-1">
                        <dt>
                            <label for="ten_dk_register">{{getTitle('ht')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_dk_register" id="ten_dk_register" placeholder="{{getTitle('ht')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-4">
                        <dt>
                            <label for="sdt_register">{{getTitle('sdt')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="sdt_register" id="sdt_register" placeholder="{{getTitle('sdt')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-2">
                        <dt>
                            <label for="email_register">{{getTitle('e')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="email" name="email_register" id="email_register" placeholder="{{getTitle('e')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-5">
                        <dt>
                            <label for="ten_doanh_nghiep_register">{{getTitle('tdn')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_doanh_nghiep_register" id="ten_doanh_nghiep_register" placeholder="{{getTitle('tdn')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="nganh_nghe_register">{{getTitle('nnkd')}}:</label>
                        </dt>
                        <dd>
                            {{-- <select name="nganh_nghe_register" id="nganh_nghe_register">
                                @foreach (getBusiness() as $business)
                                <option value="{{$business['id']}}">{{$business['name']}}</option>
                                @endforeach
                            </select> --}}
                            <input type="text" name="nganh_nghe_register" id="nganh_nghe_register" placeholder="{{getTitle('nnkd')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="quoc_gia_register">{{getTitle('dntqg')}}:</label>
                        </dt>
                        <dd>
                            <select name="quoc_gia_register" id="quoc_gia_register">
                                @foreach (getCountry() as $country)
                                <option value="{{$country['id']}}">{{$country['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    {{-- <dl class="form-group ms-order-6">
                        <dt>
                            <label>{{getTitle('mdsd')}}:</label>
                        </dt>
                        <dd>
                            <select name="muc_dich_su_dung_register" id="muc_dich_su_dung_register">
                                <option value="">{{getTitle('c')}}</</option>
                                @foreach (getLandUse() as $landUse)
                                <option value="{{$landUse['id']}}">{{$landUse['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl> --}}
                    <dl class="form-group ms-order-7">
                        <dt>
                            <label for="muc_dich_su_dung_khac_register">{{getTitle('mdsd')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="muc_dich_su_dung_khac_register" id="muc_dich_su_dung_khac_register" placeholder="{{getTitle('mdsd')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="land_id_register">{{getTitle('spqt')}}:</label>
                        </dt>
                        <dd>
                            <select name="land_id_register" id="land_id_register">
                                <option value="">{{getTitle('c')}}</</option>
                                @foreach (getLand() as $land)
                                <option value="{{$land['id']}}">{{$land['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group w-100 ms-order-10 placeholderCT textarea-cs">
                        <dt>
                            <label for="content_register">{{getTitle('nd')}}:</label>
                        </dt>
                        <dd>
                            <textarea name="content_register" id="content_register" placeholder="" class=""></textarea>
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
