$(function ()
{
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});

var krpano = document.getElementById("krpanoSWFObject");
let checkMobile = false;
var loading = $(".loading");

if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
{
    checkMobile = true;
} else
{
    checkMobile = false;
}

$("#tham_quan_tu_ngay").datepicker();
$("#tham_quan_den_ngay").datepicker();

function alretCustom(icon, title)
{
    Swal.fire({
        position: 'center-center',
        icon: icon,
        title: title,
        showConfirmButton: false,
        timer: 1500
    })
}

$(".popup-form-register form").submit(function (e)
{
    e.preventDefault();
    e.stopPropagation();
    $(".form-group").removeClass("errors");
    $(".errors-desc").remove();
    loading.css("display", "flex");
    var muc_dich_tham_quan = [];
    $(".popup-form-register input[name='muc_dich_tham_quan[]']:checked").each(function (e)
    {
        muc_dich_tham_quan.push($(this).val());
    })
    var data = {
        ten_dk: $(".popup-form-register input[name='ten_dk']").val(),
        sdt: $(".popup-form-register input[name='sdt']").val(),
        email: $(".popup-form-register input[name='email']").val(),

        ten_doanh_nghiep: $(".popup-form-register input[name='ten_doanh_nghiep']").val(),
        nganh_nghe: $(".popup-form-register select[name='nganh_nghe']").val(),
        quoc_gia: $(".popup-form-register select[name='quoc_gia']").val(),
        muc_dich_tham_quan: muc_dich_tham_quan,
        muc_dich_tham_quan_khac: $(".popup-form-register input[name='muc_dich_tham_quan_khac']").val(),
        so_nguoi_tham_quan: $(".popup-form-register input[name='so_nguoi_tham_quan']").val(),
        tham_quan_tu_ngay: $(".popup-form-register input[name='tham_quan_tu_ngay']").val(),
        tham_quan_den_ngay: $(".popup-form-register input[name='tham_quan_den_ngay']").val(),

        content: $(".popup-form-register textarea[name='content']").val(),
    }
    $.ajax({
        url: urlReservationContact,
        type: 'POST',
        data: data,
        success: function (result)
        {
            if (result.error == 1)
            {
                alretCustom("error", result.Messager);
            } else
            {
                alretCustom("success", "Gửi thông tin thành công");
            }
            loading.css("display", "none");
        },
        statusCode: {
            422: function (e)
            {
                $(".form-group").removeClass("errors");
                $(".errors-desc").remove();
                //errors
                //<span class="errors-desc"></span>
                $.each(e.responseJSON.errors, function (i, item)
                {
                    var iName = $("input[name='" + i + "']");
                    var parent = iName.parent().parent();
                    parent.removeClass("errors");
                    parent.addClass("errors");
                    for (var i = 0; i < item.length; i++)
                    {
                        iName.after('<span class="errors-desc">' + item[i] + '</span>');
                    }
                });
                loading.css("display", "none");
            }
        }
    });
});