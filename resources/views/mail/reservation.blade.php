<!DOCTYPE html>
<html>

<head>
    <title>{{ $details['companyName'] }}</title>
    <style>
        #wrap {
            border: 5px solid #982628;
            max-width: 500px;
            border-radius: 5px;
            padding: 15px;
            margin: auto;
        }

        #wrap h1 {
            text-align: center;
            text-transform: uppercase;
        }

        dd {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div id="wrap">
        <h1>Đăng ký đặt giữ chổ</h1>
        <div>
            <dl>
                <dt>
                    Tên doanh nghiệp:
                </dt>
                <dd>
                    {{ $details['ten_doanh_nghiep'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Họ tên khách hàng:
                </dt>
                <dd>
                    {{ $details['ten_dk'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Số điện thoại:
                </dt>
                <dd>
                    {{ $details['sdt'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Email:
                </dt>
                <dd>
                    {{ $details['email'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Quốc gia:
                </dt>
                <dd>
                    {{ $details['quoc_gia'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Ngành nghề:
                </dt>
                <dd>
                    {{ $details['nganh_nghe'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Sản phẩm quan tâm:
                </dt>
                <dd>
                    {{ $details['land_name'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Mục đích sử dụng:
                </dt>
                <dd>
                    {{ $details['muc_dich_su_dung_khac'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Nội dung:
                </dt>
                <dd>
                    {{ $details['content'] }}
                </dd>
            </dl>
        </div>
    </div>
</body>
