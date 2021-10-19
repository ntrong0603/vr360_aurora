@extends('admin.layout')
@section('title', 'Xem thông tin đăng ký')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Quản lý đăng ký</a></li>
                        <li class="breadcrumb-item active">Xem thông tin</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title title-custom">XEM THÔNG TIN ĐĂNG KÝ</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tên khách hàng:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->ten_dk}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Số điện thoại:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->sdt}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Email:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->email}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tên doanh nghiệp:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->ten_doanh_nghiep}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Ngành nghề kinh doanh:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->business->name ?? ''}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Quốc gia:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->country->name ?? ''}}" readonly>
                            </div>
                        </div>
                        @if($reservation->loai == 1)
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Mục đích sử dụng:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="
                                @if($reservation->muc_dich_tham_quan == 1)
                                'Mở rộng sản xuất'
                                @elseif($reservation->muc_dich_tham_quan == 2)
                                'Thành lập doanh nghiệp mới'
                                @endif
                                " readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Múc đích sử dụng khác:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->muc_dich_su_dung_khac}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Sản phẩm quan tâm:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->datChoThue->name ?? ''}}, {{$reservation->nhaXuongChoThue->name ?? ''}}" readonly>
                            </div>
                        </div>
                        @endif

                        @if($reservation->loai == 2)
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Mục đích tham quan:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->visiting ?? ''}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Múc đích tham quan khác:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->muc_dich_tham_quan_khac}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Số người tham quan:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->so_nguoi_tham_quan}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tham quan từ ngày:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->tham_quan_tu_ngay}}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tham quan đến ngày:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" value="{{$reservation->tham_quan_den_ngay}}" readonly>
                            </div>
                        </div>
                        @endif
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Nội dung:</label>
                            <div class="col-sm-4">
                                <textarea class="form-control" readonly>{{$reservation->content}}</textarea>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <a href="{{ route('reservation.index') }}" class="btn btn-info">Quay lại</a>
                    </div>
                </form>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@push('styles')

<style>
    .field-name {
        padding-right: 10px;
    }

    .select2-container--default .select2-dropdown .select2-search__field:focus,
    .select2-container--default .select2-search--inline .select2-search__field:focus {
        border: none !important;
    }
</style>
@endpush

@push('scripts')
<script src="{{ asset('plugins/ckeditor/ckeditor.js') }}"></script>
<script>
    $( document ).ready(function() {
            $(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox({
                    alwaysShowClose: true
                });
            });
            $( ".btn-submit" ).click(function( event ) {
                event.preventDefault();
                confirm.fire({
                    title: 'Bạn chắc chắn muốn thêm dữ liệu?',
                    icon: 'warning',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('.form-brand').submit();
                    }
                })
            });
        });
</script>
@endpush
