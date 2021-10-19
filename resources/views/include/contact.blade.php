<div class="popup popup-contact">
    <div class="popup-info">
        <div class="popup-title">
            <h1>Contact</h1>
        </div>
        <div class="popup-form-contact">
            <form method="POST">
                <div class="main-form">
                    <dl class="form-group ms-order-1">
                        <dt>
                            <label for="name">Name<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="name" id="name" placeholder="Name" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-4">
                        <dt>
                            <label for="company_type">Company type<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="company_type" id="company_type">
                                <option value="1">Manufacturer</option>
                                <option value="2">Consulting company</option>
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-2">
                        <dt>
                            <label for="phone">Phone<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="phone" id="phone" placeholder="Phone" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-5">
                        <dt>
                            <label for="company_name">Company name:</label>
                        </dt>
                        <dd>
                            <input type="text" name="company_name" id="company_name" placeholder="Company name" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-3">
                        <dt>
                            <label for="email">Email<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <input type="text" name="email" id="email" placeholder="Email" autocomplete="off">
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
                            <label>Inquiry<sup>*</sup>:</label>
                        </dt>
                        <dd class="w-100">
                            <label class="enquiry clear-pd d-flex align-items-start justify-content-between">
                                <div class="enquiry_name">
                                    Land for lease
                                    <span class="enquiry_note">Min 10.000m2</span>
                                </div>
                                <input type="checkbox" name="enquiry[]" value="1">
                            </label>
                            <label class="enquiry clear-pd d-flex align-items-start justify-content-between">
                                <div class="enquiry_name">
                                    Workshop for lease
                                    <span class="enquiry_note">(min 2.500m2)</span>
                                </div>
                                <input type="checkbox" name="enquiry[]" value="2">
                            </label>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-7">
                        <dt>
                            <label for="area">Area:</label>
                        </dt>
                        <dd>
                            <input type="text" name="area" id="area" placeholder="Area" autocomplete="off">
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-8">
                        <dt>
                            <label for="company_nationality">Company nationality<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="company_nationality" id="company_nationality">
                                <option value="2">Viet Nam</option>
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group ms-order-9">
                        <dt>
                            <label for="business">Business<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <select name="business" id="business">
                                <option value="1">Business 1</option>
                            </select>
                        </dd>
                    </dl>
                    <dl class="form-group w-100 ms-order-10 placeholderCT textarea-cs">
                        <dt>
                            <label for="note">Note<sup>*</sup>:</label>
                        </dt>
                        <dd>
                            <textarea name="note" id="note" placeholder="" class=""></textarea>
                            <ul class="placeholder">
                                <li>Information</li>
                                <li>Visit</li>
                                <li>Other</li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="form-group text-center padding-top-10">
                    <button type="submit" class="btn btn-submit">Submit</button>
                    <button type="reset" class="btn btn-clear">Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>
