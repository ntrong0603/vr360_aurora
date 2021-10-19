@extends('admin.layout')
@section('title', 'Thêm lô đất')
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
                        <li class="breadcrumb-item"><a href="#">Quản lý lô đất</a></li>
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
                    <h3 class="card-title title-custom">THÊM MỚI LÔ ĐẤT</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" action="{{ route('land.store') }}" method="POST" enctype="multipart/form-data">
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
                                    <label class="col-form-label col-sm-2">Mô tả ({{$language->name}}):</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="content_{{$language->code}}" rows="3" placeholder="Nhập nội dung...">{{old('content_'.$language->code)}}</textarea>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Trạng thái:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('status') is-invalid @enderror" name="status" id="" value="{{old('status')}}">
                                    <option value="1" {{ old('status')==1 ? 'selected' : '' }}>Còn trống</option>
                                    <option value="2" {{ old('status')==2 ? 'selected' : '' }}>Đang giữ chỗ</option>
                                    <option value="3" {{ old('status')==3 ? 'selected' : '' }}>Đã cho thuê</option>
                                </select>
                                @error('status')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        {{-- <div class="form-group row">
                            <label class="col-form-label col-sm-2">Loại lô đất:</label>
                            <div class="col-sm-4">
                                <select class="form-control @error('style') is-invalid @enderror" name="style" id="" value="{{old('style')}}">
                                    <option value="1" {{ old('style')==1 ? 'selected' : '' }}>Lô đất</option>
                                    <option value="2" {{ old('style')==2 ? 'selected' : '' }}>Nhà xưởng xây sẵn</option>
                                </select>
                                @error('style')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div> --}}
                        <div class="form-group row">
                            <label class="col-form-label col-sm-2">Tên lô đất:</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control @error('name_land') is-invalid @enderror" name="name_land" value="{{old('name_land')}}">
                                @error('name_land')
                                <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-danger btn-submit">Thêm mới</button>
                        <a href="{{ route('land.index') }}" class="btn btn-info">Quay lại</a>
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
