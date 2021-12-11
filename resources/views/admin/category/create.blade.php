@extends('admin.layout')
@section('title', 'Thêm danh mục')
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
                        <li class="breadcrumb-item"><a href="#">Quản lý danh mục</a></li>
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
                    <h3 class="card-title title-custom">THÊM MỚI DANH MỤC</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" action="{{ route('category.store') }}" method="POST" enctype="multipart/form-data">
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
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-2">Nội dung ({{$language->name}}):</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="content_{{$language->code}}" rows="3" placeholder="Nhập nội dung...">{{old('content_'.$language->code)}}</textarea>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Danh mục cha:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('category_id') is-invalid @enderror" name="category_id" id="">
                                    <option value="0">Chọn danh mục cha</option>
                                    @foreach ($categories as $data)
                                    @include('admin.category.option', ['data' => $data, 'level' => 0, 'category_id' => old('category_id')])
                                    @endforeach
                                </select>
                                @error('category_id')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Chức năng:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('style_event') is-invalid @enderror" name="style_event" id="" value="{{old('style_event')}}">
                                    <option value="">Chọn chức năng</option>
                                    <option value="1" {{ old('style_event')==1 ? 'selected' : '' }}>Di chuyển đến cảnh</option>
                                    <option value="2" {{ old('style_event')==2 ? 'selected' : '' }}>Hiển thị nội dung</option>
                                    <option value="3" {{ old('style_event')==3 ? 'selected' : '' }}>Chuyển đến địa chỉ liên kết</option>
                                </select>
                                @error('style_event')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Cảnh liên kết:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('name_scene') is-invalid @enderror" name="name_scene" id="" value="{{old('name_scene')}}">
                                    <option value="">Chọn cảnh liên kết</option>
                                    @foreach ($scenes as $scene)
                                    <option value="{{$scene->name_scene}}" {{ old('name_scene')==$scene->name_scene ? 'selected' : '' }}>{{$scene->name}}</option>
                                    @endforeach
                                </select>
                                @error('name_scene')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Xoay đến vị trí:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('name_hotspot') is-invalid @enderror" name="name_hotspot" id="">
                                    <option value="">Chọn vị trí</option>
                                    <option value="khu_nha_o_va_dich_vu" {{ old('name_hotspot')==$scene->name_hotspot ? 'selected' : '' }}>Khu nhà ở và dịch vụ</option>
                                    <option value="nha_may_xu_ly_cap_nuoc" {{ old('name_hotspot')==$scene->name_hotspot ? 'selected' : '' }}>Nhà máy xử lý cấp nước</option>
                                </select>
                                @error('name_hotspot')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Liên kết:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control @error('link') is-invalid @enderror" name="link" value="{{old('link')}}">
                                @error('link')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
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
                        <a href="{{ route('category.index') }}" class="btn btn-info">Quay lại</a>
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
@if (!empty($languages))
@foreach ($languages as $key => $language)
<script>
    CKEDITOR.replace( "{{'content_'.$language->code}}", {
        filebrowserBrowseUrl: "{{ asset('plugins/ckfinder/ckfinder.html') }}",
        filebrowserImageBrowseUrl: "{{ asset('plugins/ckfinder/ckfinder.html?type=Images') }}",
        filebrowserFlashBrowseUrl: "{{ asset('plugins/ckfinder/ckfinder.html?type=Flash') }}",
        filebrowserUploadUrl: "{{ asset('plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files') }}",
        filebrowserImageUploadUrl: "{{ asset('plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images') }}",
        filebrowserFlashUploadUrl: "{{ asset('plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash') }}"
    });
</script>
@endforeach
@endif
@endpush
