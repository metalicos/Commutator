<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="UA">

<head>
    <title>Commutator | Вхід</title>
    <%@include file="parts/common-styles.jsp" %>
</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>

<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>

<!-- CONTENT -->
<div class="height-100 py-5 collapse" id="filterbar">

    <%@include file="parts/success-and-error-out.jsp" %>

    <div style="max-width: 350px;margin: auto;">
        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-success text-white px-3 animated fadeInDown animate_500ms">
            <h3>Реєстрація успішно проведена! Підтвердіть Ваш обліковий запис перейшовши за посиланням, відправленим Вам на Email.</h3>
        </div>
    </div>
</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>