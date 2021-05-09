<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">
<head>
    <title>Commutator | Розклади</title>
    <%@include file="parts/common-styles.jsp" %>
</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>
<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>

<!-- CONTENT -->
<div class="height-100 p-3">
    <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
        <h3>Розклади</h3>
        <a class="align-self-center text-white" href="">
            <i class="bx bx-plus-circle h3"></i>
        </a>
    </div>
    <div class="row py-3 animated zoomIn animate_500ms">
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row py-3 animated zoomIn animate_500ms">
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row py-3 animated zoomIn animate_500ms">
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="">
                <div class="card bg-dark-choco">
                    <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title m-2 py-2">
                        Стерилізація Вкл.</h5>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="col-lg-2 col-sm-3 col-3">
                                <span class="bx bx-calendar h1 mr-1 text-light-white icon-size-6"></span>
                            </div>
                            <div class="d-flex flex-column justify-content-center align-content-center col-lg-9 col-sm-9 col-8">
                                <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Дата:</span>
                                <h6 class="text-grey">22/09/2021 13:45:66:222</h6>

                                <h6 class="text-muted d-flex text-grey">
                                    <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Встановити:</span>75%
                                </h6>

                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <%@include file="parts/footer.jsp"%>
</div>

<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>