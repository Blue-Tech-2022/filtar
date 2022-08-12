<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="side-header">
        <a class="header-brand1" href="{{route('adminHome')}}">
            <img src="{{($setting->logo) ?? 'assets/uploads/logo.png'}}" class="header-brand-img light-logo1" alt="logo">
        </a>
        <!-- LOGO -->
    </div>
    <ul class="side-menu">
        <li><h3>العناصر</h3></li>

        <li class="slide">
            <a class="side-menu__item" href="{{route('adminHome')}}">
                <i class="icon icon-home side-menu__icon"></i>
                <span class="side-menu__label">الرئيسية</span>
            </a>
        </li>

        @can('عرض المشرفين')
        <li class="slide">
            <a class="side-menu__item" href="{{route('admins.index')}}">
                <i class="fe fe-users side-menu__icon"></i>
                <span class="side-menu__label">المشرفين</span>
            </a>
        </li>
        @endcan

        @can('عرض الصلاحيات')
        <li class="slide">
            <a class="side-menu__item" href="{{route('roles.index')}}">
                <i class="fe fe-lock side-menu__icon"></i>
                <span class="side-menu__label"> الصلاحيات </span>
            </a>
        </li>
        @endcan

        @can('عرض البانر')
        <li class="slide">
            <a class="side-menu__item" href="{{route('sliders.index')}}">
                <i class="fe fe-camera side-menu__icon"></i>
                <span class="side-menu__label">بانر الاعلانات</span>
            </a>
        </li>
        @endcan



        @can('عرض التجار')
        <li class="slide">
            <a class="side-menu__item" href="{{route('provider.index')}}">
                <i class="fe fe-user-check side-menu__icon"></i>
                <span class="side-menu__label">التجار</span>
            </a>
        </li>
        @endcan


        @can('عرض العملاء')
        <li class="slide">
            <a class="side-menu__item" href="{{route('users.index')}}">
                <i class="fe fe-users side-menu__icon"></i>
                <span class="side-menu__label">العملاء</span>
            </a>
        </li>
        @endcan

        @can('عرض التصنيفات')
        <li class="slide">
            <a class="side-menu__item" href="{{route('categories.index')}}">
                <i class="fe fe-align-right side-menu__icon"></i>
                <span class="side-menu__label">التصنيفات</span>
            </a>
        </li>
        @endcan

        @can('عرض الطلبات')
        <li class="slide">
            <a class="side-menu__item" href="{{route('orders.index')}}">
                <i class="fe fe-shopping-cart side-menu__icon"></i>
                <span class="side-menu__label">الطلبات</span>
            </a>
        </li>
        @endcan


        @can('عرض المنتجات')
        <li class="slide">
            <a class="side-menu__item" href="{{route('products.index')}}">
                <i class="icon icon-bag side-menu__icon"></i>
                <span class="side-menu__label"> المنتجات</span>
            </a>
        </li>
        @endcan


        @can('الاشعارات العامة')
        <li class="slide">
            <a class="side-menu__item" href="{{route('sendNotification.index')}}">
                <i class="fe fe-bell side-menu__icon"></i>
                <span class="side-menu__label">الاشعارات العامة</span>
            </a>
        </li>
        @endcan

        @can('عرض التقارير')
        <li class="slide">
            <a class="side-menu__item" href="{{route('reports.index')}}">
                <i class="fe fe-file-text side-menu__icon"></i>
                <span class="side-menu__label">التقارير</span>
            </a>
        </li>
        @endcan


        @can('عرض الشروحات')
        <li class="slide">
            <a class="side-menu__item" href="{{route('explanations.index')}}">
                <i class="fe fe-headphones side-menu__icon"></i>
                <span class="side-menu__label">الشروحات</span>
            </a>
        </li>
        @endcan


        @can('عرض اعدادت الفلتر')
        <li class="slide">
            <a class="side-menu__item" href="{{route('filterSetting.index')}}">
                <i class="fe fe-droplet side-menu__icon"></i>
                <span class="side-menu__label">اعدادت الفلتر</span>
            </a>
        </li>
        @endcan


        @can('عرض تواصل معنا')
        <li class="slide">
            <a class="side-menu__item" href="{{route('contact.index')}}">
                <i class="fe fe-mail side-menu__icon"></i>
                <span class="side-menu__label">تواصل معنا</span>
            </a>
        </li>
        @endcan


        @can('عرض الدول')
        <li class="slide">
            <a class="side-menu__item" href="{{route('nationalities.index')}}">
                <i class="icon-directions side-menu__icon"></i>
                <span class="side-menu__label">الدول والمحافظات</span>
            </a>
        </li>
        @endcan

        <li class="slide">
            <a class="side-menu__item" href="{{route('admin.logout')}}">
                <i class="icon icon-lock side-menu__icon"></i>
                <span class="side-menu__label">تسجيل الخروج</span>
            </a>
        </li>

    </ul>
</aside>
