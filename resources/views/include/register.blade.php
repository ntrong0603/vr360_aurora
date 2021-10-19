<div class="popup popup-register">
    <div class="popup-info">
        <div class="popup-title">
            <h1>đăng ký tham quan</h1>
        </div>
        <div class="popup-form-register">
            <form method="POST">
                <div class="main-form">
                    <dl class="form-group ms-order-1">
                        <dt>
                            <label for="ten_dk">{{getTitle('ht')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_dk" id="ten_dk" placeholder="{{getTitle('ht')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-4">
                        <dt>
                            <label for="sdt">{{getTitle('sdt')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="sdt" id="sdt" placeholder="{{getTitle('sdt')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-2">
                        <dt>
                            <label for="email">{{getTitle('e')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="email" name="email" id="email" placeholder="{{getTitle('e')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-5">
                        <dt>
                            <label for="ten_doanh_nghiep">{{getTitle('tdn')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="ten_doanh_nghiep" id="ten_doanh_nghiep" placeholder="{{getTitle('tdn')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="nganh_nghe">{{getTitle('nnkd')}}:</label>
                        </dt>
                        <dd>
                            <select name="nganh_nghe" id="nganh_nghe">
                                @foreach (getBusiness() as $business)
                                <option value="{{$business['id']}}">{{$business['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="quoc_gia">{{getTitle('dntqg')}}:</label>
                        </dt>
                        <dd>
                            <select name="quoc_gia" id="quoc_gia">
                                @foreach (getCountry() as $country)
                                <option value="{{$country['id']}}">{{$country['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-6">
                        <dt>
                            <label>{{getTitle('mdtq')}}:</label>
                        </dt>
                        <dd>
                            @foreach (getVisiting() as $visiting)
                            <label class="enquiry clear-pd d-flex align-items-start justify-content-between">
                                <div class="enquiry_name">
                                    {{$visiting['name']}}
                                </div>
                                <input type="checkbox" name="muc_dich_tham_quan[]" value="{{$visiting['id']}}">
                            </label>
                            @endforeach
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-7">
                        <dt>
                            <label for="muc_dich_tham_quan_khac">{{getTitle('k')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="muc_dich_tham_quan_khac" id="muc_dich_tham_quan_khac" placeholder="{{getTitle('k')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-8">
                        <dt>
                            <label for="so_nguoi_tham_quan">{{getTitle('sntq')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="so_nguoi_tham_quan" id="so_nguoi_tham_quan" placeholder="{{getTitle('sntg')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-9">
                        <dt>
                            <label for="tham_quan_tu_ngay">{{getTitle('tgdktq')}}:</label>
                        </dt>
                        <dd>
                            <div class="flex-center-between" style="margin-bottom: 10px">
                                <label for="tham_quan_tu_ngay" style="width: 70px">{{getTitle('t')}}</label>
                                <input type="text" name="tham_quan_tu_ngay" id="tham_quan_tu_ngay" placeholder="{{getTitle('cn')}}" autocomplete="off">
                                <label for="tham_quan_tu_ngay" class="c-calendar">
                                    <img src="{{asset('frontend/images/calendar-alt-regular.svg')}}" alt="">
                                </label>
                            </div>
                            <div class="flex-center-between">
                                <label for="tham_quan_den_ngay" style="width: 70px">{{getTitle('d')}}</label>
                                <input type="text" name="tham_quan_den_ngay" id="tham_quan_den_ngay" placeholder="{{getTitle('cn')}}" autocomplete="off">
                                <label for="tham_quan_den_ngay" class="c-calendar">
                                    <img src="{{asset('frontend/images/calendar-alt-regular.svg')}}" alt="">
                                </label>
                            </div>
                        </dd>
                    </dl>
                    <dl class="form-group w-100 ms-order-10 placeholderCT textarea-cs">
                        <dt>
                            <label for="content">{{getTitle('nd')}}:</label>
                        </dt>
                        <dd>
                            <textarea name="content" id="content" placeholder="" class=""></textarea>
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
