@extends('admin.layout')
@section('title', 'Cài đặt')
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
                    <h3 class="card-title title-custom">Cài đặt</h3>
                </div>

                <!-- /.box-header -->
                <form role="form-horizontal form-brand" action="{{ route('setting.edit') }}" method="POST" enctype="multipart/form-data">
                    @if (session('thongbao'))
                    <div class="alert alert-success">
                        {!! session('thongbao') !!}
                    </div>
                    @endif
                    @if (session('loi'))
                    <div class="alert alert-danger">
                        {{ session('loi') }}
                    </div>
                    @endif
                    @csrf
                    <div class="card-body">
                        <div class="form-group @if ($errors->get('logo'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Logo</label>
                            @if (!empty(getSetting("logo")))
                            <div style="margin-bottom: 5px">
                                <img src="{{asset('storage/setting_image/'. getSetting('logo'))}}" alt="logo" style="width: 150px">
                            </div>
                            @endif
                            <input type="file" name="logo" class="form-control" id="exampleInputEmail1" placeholder="Logo">
                            @if ($errors->get('logo'))
                            @foreach ($errors->get('logo') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('company_name'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Tên dự án</label>
                            <input type="text" name="company_name" class="form-control" id="exampleInputEmail1" placeholder="Tên dự án" value="{{ getSetting('company_name') }}">
                            @if ($errors->get('company_name'))
                            @foreach ($errors->get('company_name') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('to_email'))
                                has-error
                                @endif">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="text" name="to_email" class="form-control" id="exampleInputEmail1" placeholder="Email" value="{{ getSetting('to_email') }}">
                            @if ($errors->get('to_email'))
                            @foreach ($errors->get('to_email') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('hotline'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Hotline</label>
                            <input type="text" name="hotline" class="form-control" id="exampleInputEmail1" placeholder="Hotline" value="{{ getSetting('hotline') }}">
                            @if ($errors->get('hotline'))
                            @foreach ($errors->get('hotline') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('title'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Title</label>
                            <input type="text" name="title" class="form-control" id="exampleInputEmail1" placeholder="Title" value="{{ getSetting('title') }}">
                            @if ($errors->get('title'))
                            @foreach ($errors->get('title') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('keywork'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Keywork</label>
                            <input type="text" name="keywork" class="form-control" id="exampleInputEmail1" placeholder="Tên hotspot" value="{{ getSetting('keywork') }}">
                            @if ($errors->get('keywork'))
                            @foreach ($errors->get('keywork') as $error)
                            <span class="help-block">
                                {{ $error }}
                            </span>
                            @endforeach
                            @endif
                        </div>
                        <div class="form-group @if ($errors->get('description'))
                                    has-error
                                    @endif">
                            <label for="exampleInputEmail1">Description</label>
                            <textarea class="form-control" id="editor2" name="description" rows="10" cols="80">{{ getSetting('description') }}</textarea>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                </form>
                <!-- /.col -->
            </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
