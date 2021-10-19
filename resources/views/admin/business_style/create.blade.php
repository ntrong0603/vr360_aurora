@extends('admin.layout')
@section('title', 'Thêm loại doanh nghiệp')
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
                        <li class="breadcrumb-item"><a href="#">Quản lý loại doanh nghiệp</a></li>
                        <li class="breadcrumb-item active">Thêm mới</li>
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
                    <h3 class="card-title title-custom">THÊM MỚI LOẠI DOANH NGHIỆP</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" action="{{ route('businessStyle.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
                            @if (!empty($languages))
                            @foreach ($languages as $key => $language)
                            <li class="nav-item">
                                <a class="nav-link {{$key == 0 ? 'active' : ''}}" id="lang-{{$language->code}}-tab" data-toggle="pill" href="#lang-{{$language->code}}" role="tab" aria-controls="custom-content-below-home" aria-selected="true">{{$language->name}}</a>
                            </li>
                            @endforeach
                            @endif
                        </ul>
                        <div class="tab-content" id="custom-content-below-tabContent">
                            @if (!empty($languages))
                            @foreach ($languages as $key => $language)
                            <div class="tab-pane fade {{$key == 0 ? 'active show' : ''}}" id="lang-{{$language->code}}" role="tabpanel" aria-labelledby="lang-{{$language->code}}-tab">
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-2">Tên ({{$language->name}}):</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control @error('name_'.$language->code) is-invalid @enderror" name="name_{{$language->code}}" value="{{old('name_'.$language->code)}}">
                                        @error('name_'.$language->code)
                                        <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Hiển thị:</label>
                            <div class="col-sm-2">
                                <div class="icheck-success d-inline">
                                    <input type="checkbox" id="checkboxStatus" value="1" name="status" {{ (!old() || old('status')) ? 'checked' : '' }}>
                                    <label for="checkboxStatus">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-danger btn-submit">Thêm mới</button>
                        <a href="{{ route('businessStyle.index') }}" class="btn btn-info">Quay lại</a>
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
