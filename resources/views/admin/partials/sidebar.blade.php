<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../" class="brand-link" style="height: 60px;">
        Admin system
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-compact" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="{{ route('dashboard.index') }}" class="nav-link {{ (request()->is('admin/dashboard*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Thống kê
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('contact.index') }}" class="nav-link {{ (request()->is('admin/contact*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý liên hệ khách hàng
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('reservation.index') }}" class="nav-link {{ (request()->is('admin/reservation*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý đăng ký
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('scene.index') }}" class="nav-link {{ (request()->is('admin/scene*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý cảnh VR
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('land.index') }}" class="nav-link {{ (request()->is('admin/land*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý lô đất
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('utilities.index') }}" class="nav-link {{ (request()->is('admin/utilities*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý tiện ích ngoại khu
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('country.index') }}" class="nav-link {{ (request()->is('admin/country*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý quốc gia
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('business.index') }}" class="nav-link {{ (request()->is('admin/business*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý ngành kinh doanh
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('language.index') }}" class="nav-link {{ (request()->is('admin/language*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý ngôn ngữ
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.index') }}" class="nav-link {{ (request()->is('admin/user*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý tài khoản
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('setting.index') }}" class="nav-link {{ (request()->is('admin/setting*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Cài đặt khác
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
