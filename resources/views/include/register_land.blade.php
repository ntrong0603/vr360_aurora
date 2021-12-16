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
                            <label>{{getTitle('mdsd')}}:</label>
                        </dt>
                        <dd>
                            <select name="muc_dich_su_dung" id="muc_dich_su_dung">
                                <option value="">{{getTitle('c')}}</</option>
                                @foreach (getLandUse() as $landUse)
                                <option value="{{$landUse['id']}}">{{$landUse['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-7">
                        <dt>
                            <label for="muc_dich_su_dung_khac">{{getTitle('k')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="muc_dich_su_dung_khac" id="muc_dich_su_dung_khac" placeholder="{{getTitle('k')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="san_pham_quan_tam">{{getTitle('spqt')}}:</label>
                        </dt>
                        <dd>
                            <select name="san_pham_quan_tam" id="san_pham_quan_tam">
                                <option value="">{{getTitle('c')}}</</option>
                                @foreach (getLand() as $land)
                                <option value="{{$land['id']}}">{{$land['name']}}</option>
                                @endforeach
                            </select>
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
