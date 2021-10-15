function checkboxOnChange(target, type) {
    var value = 0
    if ($(target).is(':checked')) {
        value = 1;
    }
    $('.loading').show();
    $.ajax({
        url: $(target).data('href'),
        type: 'POST',
        data: {'type': type, 'value': value},
        dataType: 'json', // added data type
        success: function(res) {
            $('.loading').hide();
            location.reload();
        },
        error: function(xhr) {
            $('.loading').hide();
            location.reload();
        }
    });
};
$( document ).ready(function() {
    $("#province_id").change(function() {
        var provinceId = $(this).val();
        $("#district_id").empty();
        $("#ward_id").empty();
        $("#district_id").append('<option value=" ">----</option>');
        $("#ward_id").append('<option value=" ">----</option>');
        $.ajax({
            url: urlGetDistricts,
            type: 'POST',
            data: {province_id:provinceId},
            dataType: 'json',
            success: function(res) {
                $.each(res.districts,function(key,value){
                    $('#district_id').append($("<option/>", {
                    value: value.id,
                    text: value.name
                    }));
                });
            }
        });
    });
    $("#district_id").change(function() {
        var districtId = $(this).val();
        $("#ward_id").empty();
        $("#ward_id").append('<option value=" ">----</option>');
        $.ajax({
            url: urlGetWards,
            type: 'POST',
            data: {district_id:districtId},
            dataType: 'json',
            success: function(res) {
                $.each(res.wards,function(key,value){
                    $('#ward_id').append($("<option/>", {
                    value: value.id,
                    text: value.name
                    }));
                });
            }
        });
    });
    $(".parent-id").change(function() {
        var parentId = $(this).val();
        var id = i = $(this).data('id');
        var exists = true;
        while (exists) {
            i++;
            var childId = '#parent_id_' + i;
            if ($(childId).length) {
                $(childId).empty();
                $(childId).append('<option value="">-----</option>');
            } else {
                exists = false;
            }
        }
        if (parentId == '') return;
        var nextId = '#parent_id_' + (id + 1);
        $.ajax({
            url: urlParent,
            type: 'POST',
            data: {id:parentId},
            dataType: 'json',
            success: function(res) {
                $.each(res.parents,function(key,value){
                    $(nextId).append($("<option/>", {
                    value: value.id,
                    text: value.name
                    }));
                });
            }
        });
    });
});
$(function () {
    bsCustomFileInput.init();
});
