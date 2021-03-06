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
                {{-- <li class="nav-item">
                    <a href="{{ route('contact.index') }}" class="nav-link {{ (request()->is('admin/contact*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý liên hệ khách hàng ({{countNewContact()}})
                        </p>
                    </a>
                </li> --}}
                <li class="nav-item">
                    <a href="{{ route('reservation.index') }}" class="nav-link {{ (request()->is('admin/reservation*') && !request()->is('admin/reservationRegister*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý đăng ký tham quan ({{countVisit()}})
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('reservationRegister.index') }}" class="nav-link {{ (request()->is('admin/reservationRegister*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý đăng ký đặt chỗ ({{countReservation()}})
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('category.index') }}" class="nav-link {{ (request()->is('admin/category*')) ? 'active' : '' }}" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý danh mục
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
                    <a href="{{ route('land.index') }}" class="nav-link {{ (request()->is('admin/land*') && !request()->is('admin/landStyle*') && !request()->is('admin/landUse*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý lô đất
                        </p>
                    </a>
                </li>
                {{-- <li class="nav-item">
                    <a href="{{ route('landStyle.index') }}" class="nav-link {{ (request()->is('admin/landStyle*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý loại đất
                        </p>
                    </a>
                </li> --}}
                <li class="nav-item">
                    <a href="{{ route('utilities.index') }}" class="nav-link {{ (request()->is('admin/utilities*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý tiện ích
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
                    <a href="{{ route('business.index') }}" class="nav-link {{ (request()->is('admin/business*') && !request()->is('admin/businessStyle*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý ngành kinh doanh
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('businessStyle.index') }}" class="nav-link {{ (request()->is('admin/businessStyle*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý loại hình doanh nghiệp
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('visiting.index') }}" class="nav-link {{ (request()->is('admin/visiting*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý mục đích tham quan
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('landUse.index') }}" class="nav-link {{ (request()->is('admin/landUse*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý mục đích sử dụng
                        </p>
                    </a>
                </li>
                {{-- <li class="nav-item">
                    <a href="{{ route('enquiry.index') }}" class="nav-link {{ (request()->is('admin/enquiry*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý nhu cầu liên hệ
                        </p>
                    </a>
                </li> --}}
                <li class="nav-item">
                    <a href="{{ route('language.index') }}" class="nav-link {{ (request()->is('admin/language*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý ngôn ngữ
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('text.index') }}" class="nav-link {{ (request()->is('admin/text*')) ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>
                            Quản lý tiêu đề
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
