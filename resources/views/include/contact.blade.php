<div class="popup popup-contact active">
    <div class="popup-info">
        <div class="popup-title">
            <h1>Contact</h1>
        </div>
        <div class="popup-form-contact">
            <form method="POST">
                <div class="main-form">
                    <dl class="form-group ms-order-1">
                        <dt>
                            <label for="name">{{getTitle('ht')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="name" id="name" placeholder="{{getTitle('ht')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-4">
                        <dt>
                            <label for="company_type">{{getTitle('ldn')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="company_type" id="company_type">

                                @foreach (getBusinessStyle() as $businessStyle)
                                <option value="{{$businessStyle['id']}}">{{$businessStyle['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-2">
                        <dt>
                            <label for="phone">{{getTitle('sdt')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="phone" id="phone" placeholder="{{getTitle('sdt')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-5">
                        <dt>
                            <label for="company_name">{{getTitle('tdn')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="company_name" id="company_name" placeholder="{{getTitle('tdn')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="email">{{getTitle('e')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="email" id="email" placeholder="{{getTitle('e')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-d-none " style="visibility: hidden;">
                        <dt>
                            <label for="company_name">Company name:</label>
                        </dt>
                        <dd>
                            <input type="text" name="" id="" placeholder="Company name" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group d-flex ms-order-6">
                        <dt>
                            <label style="white-space: nowrap;">{{getTitle('nc')}}<sup>*</sup>:</label>
                        </dt>
                        <dd class="w-100">
                            @foreach (getEnquiry() as $enquiry)
                            <label class="enquiry clear-pd d-flex align-items-start justify-content-between">
                                <div class="enquiry_name">
                                    {{$enquiry['name']}}
                                    <span class="enquiry_note">{{$enquiry['note']}}</span>
                                </div>
                                <input type="checkbox" name="enquiry[]" value="{{$enquiry['id']}}">
                            </label>
                            @endforeach
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-7">
                        <dt>
                            <label for="area">{{getTitle('dt')}}:</label>
                        </dt>
                        <dd>
                            <input type="text" name="area" id="area" placeholder="{{getTitle('nc')}}" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-8">
                        <dt>
                            <label for="company_nationality">{{getTitle('dntqg')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="company_nationality" id="company_nationality">
                                @foreach (getCountry() as $country)
                                <option value="{{$country['id']}}">{{$country['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-9">
                        <dt>
                            <label for="business">{{getTitle('nnkd')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="business" id="business">
                                @foreach (getBusiness() as $business)
                                <option value="{{$business['id']}}">{{$business['name']}}</option>
                                @endforeach
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group w-100 ms-order-10 placeholderCT textarea-cs">
                        <dt>
                            <label for="note">{{getTitle('gc')}}<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <textarea name="note" id="note" placeholder="" class=""></textarea>
                        </dd>
                    </dl>
                </div>
                <div class="form-group text-center padding-top-10">
                    <button type="submit" class="btn btn-submit">{{getTitle('g')}}</button>
                    <button type="reset" class="btn btn-clear">{{getTitle('ll')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>
