@extends('admin.layout')
@section('title', 'Quản lý danh mục')
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
                    <h3 class="card-title title-custom">Quản lý danh mục</h3>
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
                                        <label for="inputName" class="col-form-label">Nhập tên danh mục</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="name" id="inputName" placeholder="Nhập tên danh mục..." value="{{ Request::get('name') }}">
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-info">Tìm kiếm</button>
                                        <a href="{{route('category.index')}}" class="btn btn-secondary">Reset</a>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <a href="{{route('category.create')}}" class="btn btn-success">Thêm mới</a>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </form>
                    </div>
                    <table class="table table-striped table-style">
                        <thead>
                            <tr class="text-center">
                                <th>TÊN</th>
                                <th style="width: 50px">SỬA</th>
                                <th style="width: 50px">XÓA</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($datas->count())
                            @foreach ($datas as $key => $data)
                            @include('admin.category.row_table', ['data' => $data, 'level' => 0])
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
