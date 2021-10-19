@extends('admin.layout')
@section('title', 'Sửa thông tin tiện ích')
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
                        <li class="breadcrumb-item"><a href="#">Quản lý tiện ích</a></li>
                        <li class="breadcrumb-item active">Sửa thông tin</li>
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
                    <h3 class="card-title title-custom">SỬA THÔNG TIN TIỆN ÍCH</h3>
                </div>
                <!-- /.card-header -->
                <form class="form-horizontal form-brand" action="{{ route('utilities.update', ['utilities' => $utilities->id]) }}" method="POST" enctype="multipart/form-data">
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
                                        @php
                                        $notIssetLang = true;
                                        @endphp
                                        @foreach ($utilities->utilitiesLanguages as $utilitiesLanguage)
                                        @if($utilitiesLanguage->lang == $language->code)
                                        @php
                                        $notIssetLang = false;
                                        @endphp
                                        <input type="text" class="form-control @error('name_'.$language->code) is-invalid @enderror" name="name_{{$language->code}}" value="{{old('name_'.$language->code, $utilitiesLanguage->name)}}">
                                        @endif
                                        @endforeach
                                        @if($notIssetLang)
                                        <input type="text" class="form-control @error('name_'.$language->code) is-invalid @enderror" name="name_{{$language->code}}" value="{{old('name_'.$language->code, $utilities->name)}}">
                                        @endif
                                        @error('name_'.$language->code)
                                        <span class="error invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-2">
                                        Ảnh đại diện ({{$language->name}}):
                                        <br>
                                        <span style="font-size: 13px; color: red;">Kích thước: 438px x 255px</span>
                                    </label>
                                    <div class="col-sm-4">
                                        @foreach ($utilities->utilitiesLanguages as $utilitiesLanguage)
                                        @if($utilitiesLanguage->lang == $language->code && !empty($utilitiesLanguage->photo))
                                        <div style="margin-bottom: 10px;">
                                            <img src="{{asset('storage/utilities_image/'.$utilitiesLanguage->photo)}}" alt="{{$utilitiesLanguage->name}}" style="width: 250px;">
                                        </div>
                                        @endif
                                        @endforeach
                                        <div>
                                            <input type="file" class="form-control @error('photo_'.$language->code) is-invalid @enderror" name="photo_{{$language->code}}" value="{{old('photo_'.$language->code)}}">
                                            @error('photo_'.$language->code)
                                            <span class="error invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            @endif
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-danger btn-submit">Cập nhật</button>
                        <a href="{{ route('utilities.index') }}" class="btn btn-info">Quay lại</a>
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
