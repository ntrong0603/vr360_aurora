$(function ()
{
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});

const krpano = document.getElementById("krpanoSWFObject");
const elMasterPlan = $(".master-plan");
const viewVIP = ['scene_view_1', 'scene_view_2', 'scene_view_3', 'scene_view_4', 'scene_view_5', 'scene_view_6'];
let checkMobile = false;
let loading = $(".loading");
let check = false;

window.mobileCheck = function ()
{
    let check = false;
    (function (a) { if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true; })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
};

$('#map').on('click', function (e)
{
    // krpano.call('openmap();');
    if (elMasterPlan.hasClass("active"))
    {
        elMasterPlan.removeClass("active");
    } else
    {
        elMasterPlan.addClass("active");
        $('nav').removeClass('open-nav');
    }
});
$(".btn-close-masterplan").on('click', function (e)
{
    elMasterPlan.removeClass("active");
});
$('#btn-info-view').on('click', function (e)
{
    let popup = $(".popup-content-view");
    if (popup.hasClass('active'))
    {
        popup.removeClass('active');
    } else
    {
        popup.addClass('active');
        $('nav').removeClass('open-nav');
    }
});
function loadSceneMenu(scene)
{
    krpano.call("loadscene(" + scene + ",null,MERGE,OPENBLEND(1.0, -0.5, 0.3, 0.8, linear))");
}
function lookAt(name)
{
    krpano.call("looktohotspot(" + name + ", 40)");
}
$(".nav-group").on("click", function (e)
{
    let el = $(this);
    let parent = el.parent();
    if (parent.hasClass("active"))
    {
        parent.removeClass("active");
    } else
    {
        parent.addClass("active");
    }
});

$(".dropdown li").click(function (e)
{
    e.stopPropagation();
    $(".dropdown li").removeClass("active");
    $(this).addClass("active");
    if ($(this).data('scene'))
    {
        loadSceneMenu($(this).data('scene'));
        if ($(this).data('view'))
        {
            lookAt($(this).data('view'));
        }
    }

    if ($(this).data('content'))
    {
        $('.popup-content-nav .popup-info .content').html($(this).data('content'));
        $('.popup-content-nav').addClass('active');
    }
    $("#btn-nav").removeClass("show");
});
function updateInfoScene()
{
    var sceneName = krpano.get("scene[get(xml.scene)].name");
    for (let index = 0; index < scenes.length; index++)
    {
        let scene = scenes[index];
        krpano.call(`set(hotspot['${scene['nameScene']}'].onhover, showtext('${scene['name']}',hotspottextstyle))`);
        krpano.call(`set(layer['${scene['nameScene']}'].onhover, showtext('${scene['name']}',hotspottextstyle))`);
        krpano.call(`set(layer['${scene['nameScene']}'].title, '${scene['name']}'] + "')`);
        if (viewVIP.includes(scene['nameScene']))
        {
            krpano.call(`set(scene['${scene['nameScene']}'].title, '${scene['name']} (${arrText.pc3dmh})')`);
        } else
        {
            krpano.call(`set(scene['${scene['nameScene']}'].title, '${scene['name']}')`);
        }

        if (sceneName == scene['nameScene'])
        {
            if (scene['content'] != '' && scene['content'] != null)
            {
                $('#btn-info-view').addClass('show');
                $('nav').removeClass('open-nav');
                $('.popup-content-view .popup-info .content').html(scene['content']);
            } else
            {
                $('#btn-info-view').removeClass('show');
                $('.popup-content-view .popup-info .content').html('');
            }
        }
    }
}

function updateInfoUtilities()
{
    for (let index = 0; index < utilities.length; index++)
    {
        let util = utilities[index];
        if (util['photo'] == '')
        {
            krpano.call(`set(hotspot['${util['nameHotspot']}'].onhover, showtext('${util['name']}',hotspottextstyle))`);
        } else
        {
            krpano.call(`set(hotspot['${util['nameHotspot']}'].onhover, showimage('${util['photo']}',hotspottextstyle))`);
        }
        krpano.call(`set(hotspot['${util['nameHotspot']}'].onclick, js(showInfoUtil(${util['id']})))`);
    }
}

function showInfoUtil(id)
{
    for (let index = 0; index < utilities.length; index++)
    {
        let util = utilities[index];
        if (parseInt(util['id']) == parseInt(id))
        {
            if (util['content'] != '' && util['content'] != null)
            {
                $('.popup-content-land .content').html(util['content']);
                $('.popup-content-land').addClass('active');
                $('nav').removeClass('open-nav');
            }
            break;
        }
    }
}

function updateInfoLand()
{
    for (let index = 0; index < lands.length; index++)
    {
        let land = lands[index];
        let color = '0x00cc66';
        if (land['status'] == 2)
        {
            color = '0xff6600';
        }
        if (land['status'] == 3)
        {
            color = '0xff0000';
        }
        krpano.call(`set(hotspot['${land['nameLand']}'].onhover, showtext('${land['name']}',hotspottextstyle))`);
        krpano.call(`set(hotspot['${land['nameLand']}'].onclick, js(showInfoLand(${land['id']})))`);
        krpano.call(`set(hotspot['${land['nameLand']}'].fillcolor, '${color}')`);
        krpano.call(`set(hotspot['${land['nameLand']}'].bordercolor, '${color}')`);
    }
}

function showInfoLand(id)
{
    for (let index = 0; index < lands.length; index++)
    {
        let land = lands[index];
        if (parseInt(land['id']) == parseInt(id))
        {
            if (land['content'] != '' && land['content'] != null)
            {
                $('.popup-content-land .content').html(land['content']);
                $('.popup-content-land').addClass('active');
                $('nav').removeClass('open-nav');
            }
            break;
        }
    }
}

function eventVR()
{
    updateInfoScene();
    updateInfoUtilities();
    updateInfoLand();
}
$("#tham_quan_tu_ngay").datepicker();
$("#tham_quan_den_ngay").datepicker();
$("#btn-nav-bar").click(function (e)
{
    const isMobile = window.mobileCheck();
    const elNav = $(this).parent();
    if (isMobile)
    {
        if (elNav.hasClass("open-nav"))
        {
            elNav.removeClass("open-nav")
        } else
        {
            elNav.addClass("open-nav")
        }
    }
})
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

$(".popup").click(function ()
{
    $(this).removeClass("active");
})
$(".popup-info").click(function (e)
{
    e.stopPropagation();
});
$(".popup-btn-close, .btn-close-popup").click(function ()
{
    $(".popup").removeClass("active");
});
$(".chat").click(function ()
{
    let popup = $(".popup-contact");
    if (popup.hasClass("active"))
    {
        popup.removeClass("active");
    } else
    {
        $(".popup").removeClass("active");
        popup.addClass("active");
        $('nav').removeClass('open-nav');
    }
});

$(".popup-form-contact form").submit(function (e)
{
    e.preventDefault();
    e.stopPropagation();
    $(".form-group").removeClass("errors");
    $(".errors-desc").remove();
    loading.css("display", "flex");
    var data = $(".popup-form-contact form").serialize();
    $.ajax({
        url: urlContact,
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
                $(".popup").removeClass("active");
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
                    let iName = $("input[name='" + i + "']");
                    let iName2 = $("textarea[name='" + i + "']");
                    let iName3 = $("input[name='" + i + "[]']");
                    if (typeof iName != 'undefined')
                    {
                        let parent = iName.parent().parent();
                        parent.removeClass("errors");
                        parent.addClass("errors");
                        // for (let i = 0; i < item.length; i++)
                        // {
                        //     iName.after('<span class="errors-desc">' + item[i] + '</span>');
                        // }
                    }
                    if (typeof iName2 != 'undefined')
                    {
                        let parent = iName2.parent().parent();
                        parent.removeClass("errors");
                        parent.addClass("errors");
                        // for (let i = 0; i < item.length; i++)
                        // {
                        //     iName2.after('<span class="errors-desc">' + item[i] + '</span>');
                        // }
                    }
                    if (typeof iName3 != 'undefined')
                    {
                        let parent = iName3.parent().parent().parent();
                        parent.removeClass("errors");
                        parent.addClass("errors");

                    }
                });
                loading.css("display", "none");
            }
        }
    });
});
$(".popup-form-contact form").on('reset', function (e)
{
    $(".form-group").removeClass("errors");
    $(".errors-desc").remove();
})
// register form
$("#btn-reservation-contact").click(function ()
{
    let popup = $(".popup-register");
    if (popup.hasClass("active"))
    {
        popup.removeClass("active");
    } else
    {
        $(".popup").removeClass("active");
        popup.addClass("active");
    }
    // let popup = $(".popup-contact");
    // if (popup.hasClass("active"))
    // {
    //     popup.removeClass("active");
    // } else
    // {
    //     $(".popup").removeClass("active");
    //     popup.addClass("active");
    //     $('nav').removeClass('open-nav');
    // }
});
$(".popup-form-register form").submit(function (e)
{
    e.preventDefault();
    e.stopPropagation();
    $(".form-group").removeClass("errors");
    $(".errors-desc").remove();
    loading.css("display", "flex");
    // var muc_dich_tham_quan = [];
    // $(".popup-form-register input[name='muc_dich_tham_quan[]']:checked").each(function (e)
    // {
    //     muc_dich_tham_quan.push($(this).val());
    // })
    var data = {
        ten_dk: $(".popup-form-register input[name='ten_dk']").val(),
        sdt: $(".popup-form-register input[name='sdt']").val(),
        email: $(".popup-form-register input[name='email']").val(),

        ten_doanh_nghiep: $(".popup-form-register input[name='ten_doanh_nghiep']").val(),
        nganh_nghe: $(".popup-form-register input[name='nganh_nghe']").val(),
        quoc_gia: $(".popup-form-register select[name='quoc_gia']").val(),
        // muc_dich_tham_quan: muc_dich_tham_quan,
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
// register land
$("#btn-register-land").click(function ()
{
    let popup = $(".popup-register-land");
    if (popup.hasClass("active"))
    {
        popup.removeClass("active");
    } else
    {
        $(".popup").removeClass("active");
        popup.addClass("active");
        $('nav').removeClass('open-nav');
    }
});
$(".popup-form-register-land form").submit(function (e)
{
    e.preventDefault();
    e.stopPropagation();
    $(".form-group").removeClass("errors");
    $(".errors-desc").remove();
    loading.css("display", "flex");
    var data = {
        ten_dk: $(".popup-form-register-land input[name='ten_dk_register']").val(),
        sdt: $(".popup-form-register-land input[name='sdt_register']").val(),
        email: $(".popup-form-register-land input[name='email_register']").val(),
        ten_doanh_nghiep: $(".popup-form-register-land input[name='ten_doanh_nghiep_register']").val(),
        nganh_nghe: $(".popup-form-register-land input[name='nganh_nghe_register']").val(),
        quoc_gia: $(".popup-form-register-land select[name='quoc_gia_register']").val(),
        // muc_dich_su_dung: $(".popup-form-register-land select[name='muc_dich_su_dung_register']").val(),
        muc_dich_su_dung_khac: $(".popup-form-register-land input[name='muc_dich_su_dung_khac_register']").val(),
        land_id: $(".popup-form-register-land select[name='land_id_register']").val(),
        content: $(".popup-form-register-land textarea[name='content_register']").val(),
    }
    $.ajax({
        url: urlReservationLandContact,
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
//Zoom image
var wzoom;
document.addEventListener('DOMContentLoaded', function ()
{
    if (window.mobileCheck)
    {
        wzoom = WZoom.create('#img-zoom', {
            maxScale: 5,
            minScale: 1,
            width: 4000,
            height: 2000,
            zoomOnClick: true,
            dragScrollableOptions: {
                onGrab: function ()
                {
                    document.getElementById('img-masterplan').style.cursor = 'grabbing';
                },
                onDrop: function ()
                {
                    document.getElementById('img-masterplan').style.cursor = 'grab';
                }
            }
        });
    } else
    {
        wzoom = WZoom.create('#img-zoom', {
            maxScale: 5,
            minScale: 0.35,
            width: 2000,
            height: 1000,
            zoomOnClick: false,
            dragScrollableOptions: {
                onGrab: function ()
                {
                    document.getElementById('img-masterplan').style.cursor = 'grabbing';
                },
                onDrop: function ()
                {
                    document.getElementById('img-masterplan').style.cursor = 'grab';
                }
            }
        });
    }

    window.addEventListener('resize', function ()
    {
        wzoom.prepare();
    });
});
$("#img-open-nav, #img-close-nav").on('click', function (e)
{
    var menu = $(this).parent().parent();
    if (menu.hasClass('open-nav'))
    {
        menu.removeClass('open-nav');
    } else
    {
        menu.addClass('open-nav');
    }
});
$(document).ready(function ()
{
    if (!window.mobileCheck)
    {
        var fixLeftMenu = $(".fix-left");
        fixLeftMenu.css('left', '-' + fixLeftMenu.width() + 'px');
    }
})
