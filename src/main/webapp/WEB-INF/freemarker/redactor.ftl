<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">
<head>
    <title>Commutator | Додати</title>
    <%@include file="parts/common-styles.jsp" %>
</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>
<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>

<!-- CONTENT -->
<div class="height-100 px-5 py-5 collapse" id="filterbar">

    <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
        <h3>Редактор</h3>
    </div>

    <button class="d-flex justify-content-between w-100 m-0 py-1 my-2 pt-2 bg-dark-choco text-warning px-3 btn text-white animated  zoomIn animate_500ms"
            type="button" data-toggle="collapse" data-target="#inner-box" aria-expanded="false"
            aria-controls="inner-box">
        <h3 class="font-weight-bold">Додати</h3>
<%--        <span class="bx bxs-plus-square icon-size-3"></span>--%>
    </button>
    <div id="inner-box" class="row py-3  animated zoomIn animate_500ms">
        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="/redactor/add-device">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-warning text-dark-choco card-title m-2 py-2">
                        Прилад</h5>
                    <span class="bx bx-devices card-body h1 text-warning icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-warning text-dark-choco card-title m-2 py-2">
                        Сенсор</h5>
                    <span class="bx bx-tachometer card-body h1 text-warning icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>
    </div>

    <button class="d-flex justify-content-between w-100 m-0 py-1 my-2 pt-2 bg-dark-choco text-info px-3 btn text-white animated  zoomIn animate_500ms"
            type="button" data-toggle="collapse" data-target="#inner-box2" aria-expanded="false"
            aria-controls="inner-box">
        <h3 class="font-weight-bold">Змінити</h3>
<%--        <span class="bx bxs-plus-square icon-size-3"></span>--%>
    </button>
    <div id="inner-box2" class="row py-3 animated zoomIn animate_500ms">
        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-info text-dark-choco card-title m-2 py-2">
                        Статус користувача</h5>
                    <span class="bx bx-diamond card-body h1 text-info icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-info text-dark-choco card-title m-2 py-2">
                        Статус приладу</h5>
                    <span class="bx bx-devices card-body h1 text-info icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>
    </div>

    <button class="d-flex justify-content-between w-100 m-0 py-1 my-2 pt-2 bg-dark-choco text-danger px-3 btn text-white animated  zoomIn animate_500ms"
            type="button" data-toggle="collapse" data-target="#inner-box3" aria-expanded="false"
            aria-controls="inner-box">
        <h3 class="font-weight-bold">Видалити</h3>
<%--        <span class="bx bxs-plus-square icon-size-3"></span>--%>
    </button>
    <div id="inner-box3" class="row py-3 animated zoomIn animate_500ms">
        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                        Користувача</h5>
                    <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                        Прилад</h5>
                    <span class="bx bx-devices card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                        Сенсор</h5>
                    <span class="bx bx-devices card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>