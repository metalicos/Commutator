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
<div class="d-xl-flex d-lg-flex d-md-block d-block">
<div class="col-lg-3 col-xl-4"></div>
<div class="height-100 p-3 col-lg-6 col-xl-4 col-12">

    <form action="/redactor/add-device" method="post" enctype="multipart/form-data">
        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h1 class="h3">Створення пристрою</h1>
        </div>

        <div class="row py-3 px-3 animated zoomIn animate_500ms form-group">

            <h1 class="h5 m-0 py-3">Пристрій</h1>
            <select class="form-control" name="deviceName">
                <c:forEach var="dInfo" items="${deviceInfo}">
                    <option value="${dInfo.name}">${dInfo.name}</option>
                </c:forEach>
            </select>

            <h1 class="h5 m-0 py-3">Стан приладу</h1>
            <select class="form-control" name="status">
                <c:forEach var="status" items="${statusArray}">
                    <option value="${status}">${status}</option>
                </c:forEach>
            </select>

            <h1 class="h5 m-0 py-3">Колір приладу</h1>
            <select class="form-control" name="color">
                <c:forEach var="color" items="${colors}">
                    <option value="${color}">${color.name}</option>
                </c:forEach>
            </select>

            <h1 class="h5 m-0 py-3">Зображення приладу</h1>
            <input class="form-control-file pb-2"  type="file" name="photo">

            <h1 class="h5 m-0 py-3">UID приладу</h1>
            <input class="form-control"  type="text" value="${generatedUID}" name="uid">

            <h1 class="h5 m-0 py-3">Опис (Замінить опис по замовчуванню)</h1>
            <input class="form-control"  type="text" name="description">

            <h1 class="h5 m-0 py-3">Модель (Замінить модель по замовчуванню)</h1>
            <input class="form-control"  type="text" name="model">

            <h1 class="h5 m-0 py-3">Тип (Замінить тип по замовчуванню)</h1>
            <input class="form-control"  type="text" name="type">

            <input type="submit" class="my-4 btn btn-dark-choco text-white" value="Зберегти">

        </div>
    </form>
</div>
</div>

<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>