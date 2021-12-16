@extends('admin.layout')
@section('title', 'Quản lý đăng ký đặt giữ chỗ')
@push('styles')
<style>
    .new {
        color: #fff;
        background-color: red;
        padding: 3px 5px;
        border-radius: 5px;
    }
</style>
@endpush
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
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title title-custom">Quản lý đăng ký đặt giữ chỗ</h3>
                </div>

                <!-- /.card-header -->
                <div class="card-body p-0">
                    <div class="col-sm-12 card">
                        <div class="card-header">
                            <h3 class="card-title">Tìm kiếm</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form class="form-horizontal" action="" method="GET">
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                        <label for="inputName" class="col-form-label">Nhập tên khách hàng</label>
                                        <input type="text" class="form-control" name="ten_dk" id="inputName" placeholder="Nhập tên khách hàng..." value="{{ Request::get('ten_dk') }}">
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputName" class="col-form-label">Nhập số email</label>
                                        <input type="text" class="form-control" name="email" id="inputName" placeholder="Nhập số email..." value="{{ Request::get('email') }}">
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputName" class="col-form-label">Nhập số điện thoại</label>
                                        <input type="text" class="form-control" name="sdt" id="inputName" placeholder="Nhập số điện thoại..." value="{{ Request::get('sdt') }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-info">Tìm kiếm</button>
                                        <a href="{{route('reservationRegister.index')}}" class="btn btn-secondary">Reset</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </form>
                    </div>
                    <table class="table table-striped table-style">
                        <thead>
                            <tr class="text-center">
                                <th style="width: 50px">STT</th>
                                <th>TÊN KHÁCH HÀNG</th>
                                <th>ĐIỆN THOẠI</th>
                                <th>EMAIL</th>
                                <th>TÊN DOANH NGHIỆP</th>
                                <th>QUỐC GIA</th>
                                <th>NGÀNH NGHỀ</th>
                                <th style="width: 50px">XEM</th>
                                <th style="width: 50px">XÓA</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($datas->count())
                            @foreach ($datas as $key => $data)
                            <tr class="text-center">
                                <td>
                                    {{ (($datas->currentPage() - 1) * 20) + $key + 1 }}
                                </td>
                                <td>
                                    <a href="{{ route('reservationRegister.edit', ['reservationRegister' => $data->id]) }}">
                                        {{$data->ten_dk}}
                                        @if ($data->new == 0)
                                        <span class="new">NEW</span>
                                        @endif
                                    </a>
                                </td>
                                <td>
                                    {{$data->sdt}}
                                </td>
                                <td>
                                    {{$data->email}}
                                </td>
                                <td>
                                    {{$data->ten_doanh_nghiep}}
                                </td>
                                <td>
                                    {{$data->country->name ?? ''}}
                                </td>
                                <td>
                                    {{$data->business->name ?? ''}}
                                </td>
                                <td>
                                    <a href="{{ route('reservationRegister.edit', ['reservationRegister' => $data->id]) }}">
                                        <i class="fas fa-pencil-alt text-warning"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="delete-row" href="javascript:;" data-href="{{ route('reservationRegister.delete', ['reservationRegister' => $data->id]) }}">
                                        <i class="far fa-trash-alt text-danger"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td colspan="10" class="text-center">Không có dữ liệu</td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                    <div class="card-footer clearfix" style="position: relative;min-height: 60px;">
                        {{ $datas->links('admin.vendor.pagination.custom') }}
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
@push('scripts')
<script>
    $( document ).ready(function() {
            $( ".delete-row" ).click(function() {
                var url = $(this).data('href');
                confirm.fire({
                    title: 'Bạn chắc chắn muốn xóa ?',
                    icon: 'warning',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: url,
                            type: 'DELETE',
                            dataType: 'json', // added data type
                            success: function(res) {
                                location.reload();
                            },
                            error: function(xhr) {
                                location.reload();
                            }
                        });
                    }
                })
            });
        });
</script>
@endpush
