<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <title>Commutator | Пристрої</title>
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
        <h3>Пристрої</h3>
    </div>
    <form action="/add/new-device" method="get">
        <input hidden name="userID" value="${user.id}">
        <div class="d-flex justify-content-center align-content-center align-self-center">
            <input class="form-text" type="text" name="UID" placeholder="Додати пристрій по UID">
            <button class="form-text" type="submit" ><span class="bx bxs-news border"></span></button>
        </div>
    </form>
    <div class="row py-3 animated zoomIn animate_500ms">

        <div class="col-xl-2 col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="/cyberplant/v1">
                <div class="card bg-dark-choco text-white">
                    <div class="card-body">
                        <img class="card-img-top mb-3"
                             src="https://media.wired.com/photos/5f3c219786a7c014331d15fd/master/pass/
                         Gear-PORTAL+_White_Forward-Facing-Inline-(1).jpg" alt="">

                        <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title py-2">Cyber
                            Plant</h5>

                        <div class="text-muted d-sm-block d-xl-flex">
                            <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Модель:</span>
                            <span class="font-weight-bold p-0 m-0 mr-2 text-grey">1.0</span>
                        </div>
                        <div class="text-muted d-sm-block d-xl-flex">
                            <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Статус:</span>
                            <span class="font-weight-bold p-0 m-0 mr-2 text-grey">Активний</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>

    <%@include file="parts/footer.jsp" %>
</div>


<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>