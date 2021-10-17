@extends('admin.layout')
@section('title', 'Quản lý lô đất')
@push('styles')
<style>
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
                    <h3 class="card-title title-custom">Quản lý lô đất</h3>
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
                                        <label for="inputName" class="col-form-label">Nhập tên lô đất</label>
                                        <input type="text" class="form-control" name="name" id="inputName" placeholder="Nhập tên lô đất..." value="{{ Request::get('name') }}">
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputName" class="col-form-label">Loại đất</label>
                                        <select name="style" class="form-control">
                                            <option value="">Chọn loại</option>
                                            <option value="1" {{ Request::get('style')==1 ? 'selected' : '' }}>Lô đất</option>
                                            <option value="2" {{ Request::get('style')==2 ? 'selected' : '' }}>Nhà xưởng xây sẵn</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <label for="inputName" class="col-form-label">Tình trạn</label>
                                        <select name="status" class="form-control">
                                            <option value="">Chọn loại</option>
                                            <option value="1" {{ Request::get('status')==1 ? 'selected' : '' }}>Còn trống</option>
                                            <option value="2" {{ Request::get('status')==2 ? 'selected' : '' }}>Đang giữ chỗ</option>
                                            <option value="2" {{ Request::get('status')==3 ? 'selected' : '' }}>Đã cho thuê</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <a href="{{route('land.create')}}" class="btn btn-success">Thêm mới</a>
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-info">Tìm kiếm</button>
                                        <a href="{{route('land.index')}}" class="btn btn-secondary">Reset</a>
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
                                <th>TÊN</th>
                                <th>LOẠI ĐẤT</th>
                                <th>TÌNH TRẠNG</th>
                                <th style="width: 120px">LƯỢT XEM</th>
                                <th style="width: 50px">SỬA</th>
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
                                    {{$data->name}}
                                </td>
                                <td>
                                    @if($data->style==1)
                                    Lô đất
                                    @elseif($data->style==2)
                                    Nhà xưởng xây sẵn
                                    @endif
                                </td>
                                <td>
                                    @if($data->status==1)
                                    Còn trống
                                    @elseif($data->status==2)
                                    Đang giữ chỗ
                                    @elseif($data->status==2)
                                    Đã cho thuê
                                    @endif
                                </td>
                                <td>
                                    {{$data->view}}
                                </td>
                                <td>
                                    <a href="{{ route('land.edit', ['land' => $data->id]) }}">
                                        <i class="fas fa-pencil-alt text-warning"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="delete-row" href="javascript:;" data-href="{{ route('land.delete', ['land' => $data->id]) }}">
                                        <i class="far fa-trash-alt text-danger"></i>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td colspan="5" class="text-center">Không có dữ liệu</td>
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
