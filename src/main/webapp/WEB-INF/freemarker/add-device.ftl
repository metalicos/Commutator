<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">
<head>
    <title>Додати пристрій</title>
    <%@include file="parts/common-styles.jsp" %>
</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>
<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>

<!-- CONTENT -->
<div class="height-100 p-3">

    <form action="/redactor/add-device" method="post">
        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h3>Створення пристрою</h3>
        </div>

        <div class="row py-3 px-3 animated zoomIn animate_500ms form-group">

            <h2 class="m-0 py-3">Пристрій</h2>
            <select class="form-control" name="deviceName">
                <c:forEach var="deviceName" items="${deviceNames}">
                    <option value="${deviceName}">${deviceName.getName()}</option>
                </c:forEach>
            </select>

            <h2 class="m-0 py-3">Стан приладу</h2>
            <select class="form-control" name="status">
                <c:forEach var="status" items="${statusArray}">
                    <option value="${status}">${status}</option>
                </c:forEach>
            </select>

            <input type="submit" class="my-4 btn btn-dark-choco text-white" value="Зберегти">

        </div>
    </form>
</div>


<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>