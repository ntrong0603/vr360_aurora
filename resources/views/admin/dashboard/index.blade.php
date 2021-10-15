@extends('admin.layout')
@section('title', 'Dashboard')
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
                <div class="card-header" style="border-bottom: none;">
                </div> <!-- /.card-body -->
                <div class="card-body" style="text-align: center;">
                    <h2 style="color: #dc0000;
                    font-weight: bold;
                    font-size: 28px;
                    margin: 20px 0px;">ADMIN SYSTEM</h2>
                    <a href="{{ route('admin.logout') }}" style="padding: 5px;
                    text-decoration: none;
                    background-image: url(./media/images/arrow_logout.png);
                    max-width: max-content;
                    max-width: -moz-max-content;
                    background-repeat: no-repeat;
                    background-position: center right;
                    padding-right: 15px;
                    color: #898989;
                    font-size: 18px;">Đăng xuất   <i class="fas fa-long-arrow-alt-right"></i></a>
                    <div class="col-md-12">
                        <img src="{{ url("storage/images/default_pic.png") }}" alt="" width="100%">
                    </div>
                </div><!-- /.card-body -->
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection
