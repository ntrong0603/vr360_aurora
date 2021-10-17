@extends('admin.layout')
@section('title', 'Quản lý ngôn ngữ')
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
                        <li class="breadcrumb-item"><a href="#">Quản lý Place</a></li>
                        <li class="breadcrumb-item active">Chi tiết</li>
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
                    <h3 class="card-title title-custom">CHI TIẾT NGÔN NGỮ</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" action="{{ route('language.update', ['language' => $language->id]) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Icon:</label>
                            <div class="col-sm-4">
                                <img src="{{asset('storage/language_image/'.$language->photo)}}" style="width: 90px; margin: 5px 0px;">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Chọn hình:</label>
                            <div class="col-sm-4">
                                <div class="custom-file" style="">
                                    <input type="file" class="custom-file-input form-control @error('photo') is-invalid @enderror" id="customFile" name="photo">
                                    <label class="custom-file-label" for="customFile">Chọn hình ảnh ...</label>
                                    @error('photo')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tên ngôn ngữ:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{old('name',$language->name)}}">
                                @error('name')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Ký hiệu:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control @error('code') is-invalid @enderror" name="code" value="{{old('code',$language->code)}}" readonly>
                                @error('code')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Hiển thị:</label>
                            <div class="col-sm-2">
                                <div class="icheck-success d-inline">
                                    <input type="checkbox" id="checkboxStatus" value="1" name="status" {{ old('status', $language->status) ? 'checked' : ''}}>
                                    <label for="checkboxStatus">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-danger btn-submit">Cập nhật</button>
                        <a href="{{ URL::previous() }}" class="btn btn-info">Quay lại</a>
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
                    title: 'Bạn chắc chắn muốn cập nhật dữ liệu?',
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
