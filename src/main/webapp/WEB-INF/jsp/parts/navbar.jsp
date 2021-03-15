<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="header bg-dark-choco" id="header">

    <div class="header_toggle align-self-center">
        <i class='bx bx-menu text-white align-self-center' id="header-toggle"></i>
    </div>

    <div class="d-flex justify-content-between w-100">

        <!--        SEARCH-->
        <div class="col-10 px-0 pl-2 pl-sm-2 pl-md-4 mx-sm-0 mt-3">
            <form>
                <input name="search" type="search" class="form-control" placeholder="Шукати...">
            </form>
        </div>

        <!--        ACCOUNT-->
        <div class="dropdown col-lg-1 align-self-center px-0 pl-2 pl-sm-2 pl-md-4 mx-0">

            <a class="header_img align-self-center" href="#" id="" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <img src="https://i.imgur.com/hczKIze.jpg" alt="" width="45" height="45">
            </a>

            <div class="dropdown-menu dropdown-menu-right bg-dark-choco border-light text-decoration-none">
                <div class="list-footer text-start px-3">
                    <a href="#" class="text-light-white">
                        <i class="fa fa-sign-in-alt py-2 pr-2"></i>Увійти
                    </a>
                </div>
                <div class="list-footer text-start px-3">
                    <a href="#" class="text-light-white">
                        <i class="fa fa-user-alt py-2 pr-2"></i>Мій профіль
                    </a>
                </div>
                <div class="list-footer text-start px-3">
                    <a href="#" class="text-light-white">
                        <i class="fa fa-sign-out-alt py-2 pr-2"></i>Вийти
                    </a>
                </div>
            </div>
        </div>

    </div>
</header>