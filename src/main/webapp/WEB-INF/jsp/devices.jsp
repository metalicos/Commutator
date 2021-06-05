<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">
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

    <c:if test="${error!=null}">
        <h1 class="h5 my-2 fw-normal text-center"
            style="color: #9b1512;!important;">${error}</h1>
        <c:set var="error" scope="request" value="${''}"/>
    </c:if>
    <c:if test="${success!=null}">
        <h1 class="h5 my-2 fw-normal text-center"
            style="color: #9b1512;!important;">${success}</h1>
        <c:set var="success" scope="request" value="${''}"/>
    </c:if>

    <div class="d-xl-flex d-lg-flex d-md-block d-sm-block d-block justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
        <h3 class="col-xl-3 col-lg-3 col-12 align-self-center">Пристрої</h3>
        <form class="col-xl-9 col-lg-9 col-12 " action="/add/new-device?userID=${userID}" method="get">
            <div class="btn-group input-group d-flex">
                <input class="form-control col-xl-11 col-lg-11 col-10 " type="text" name="UID"
                       placeholder="Додати пристрій по UID">
                <button class="col-xl-1 col-lg-1 col-2 btn btn-warning" type="submit" >
                    <i class="fas fa-plus-square"></i>
                </button>
            </div>
        </form>
    </div>

    <div class="row py-3 animated zoomIn animate_500ms">

        <c:forEach var="device" items="${devicesDto}">
        <div class="col-xl-2 col-lg-4 col-md-6 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-2 custom-zoom">
            <a class="text-decoration-none" href="/cyberplant?uid=${device.UID}">
                <div class="card bg-dark-choco text-white">
                    <div class="card-body">
                        <img class="card-img-top mb-3"
                             src="data:image/jpeg;base64,${device.photo}" alt="">
                        <h5 class="font-weight-bold text-center bg-light-white text-dark-choco card-title py-2">${device.name}</h5>

                        <div class="text-muted d-sm-block d-xl-flex">
                            <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Модель:</span>
                            <span class="font-weight-bold p-0 m-0 mr-2 text-grey">${device.model}</span>
                        </div>
                        <div class="text-muted d-sm-block d-xl-flex">
                            <span class="font-weight-bold p-0 m-0 mr-2 text-light-white">Статус:</span>
                            <span class="font-weight-bold p-0 m-0 mr-2 text-grey">${device.deviceStatus}</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        </c:forEach>
    </div>

    <%@include file="parts/footer.jsp" %>
</div>


<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>