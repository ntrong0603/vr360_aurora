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
                    Mục đích tham quan:
                </dt>
                <dd>
                    {{  (!empty($details['muc_dich_tham_quan'])) ? implode(", ", $details['muc_dich_tham_quan']) : ''}}
                </dd>
            </dl>
            <dl>
                <dt>
                    Mục đích tham quan khác:
                </dt>
                <dd>
                    {{ $details['muc_dich_tham_quan_khac'] }}
                </dd>
            </dl>
            <dl>
                <dt>
                    Số người tham quan:
                </dt>
                <dd>
                    {{ $details['so_nguoi_tham_quan']}}
                </dd>
            </dl>
            <dl>
                <dt>
                    Tham quan từ ngày:
                </dt>
                <dd>
                    {{ $details['tham_quan_tu_ngay']}}
                </dd>
            </dl>
            <dl>
                <dt>
                    Tham quan đến ngày:
                </dt>
                <dd>
                    {{ $details['tham_quan_den_ngay']}}
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
