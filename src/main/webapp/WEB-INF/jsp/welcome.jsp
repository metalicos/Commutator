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


    <div class="d-block justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
        <h3 class="text-center">ВІТАЄМО! COMMUTATOR НА ЗВ'ЯЗКУ</h3>
        <h3 class="bg-success" >Для чого я створений?</h3>
        <h3>Додаток дозволяє:</h3>
        <h3> - додавати нові прилади</h3>
        <h3> - змінювати налаштування власних приладів</h3>
        <h3> - віддалене керування доданими приладами</h3>
        <h3> - переглядати дані власних приладів</h3>
        <h3 class="bg-success" >Як користуватися?</h3>
        <h3>Потрібно виконати наступні кроки:</h3>
        <h3> - <a class="text-warning font-weight-bold" href="/auth/registration">зареєструвати</a> власний акаунт, якщо Ви ще не зареєстровані</h3>
        <h3> - <a class="text-warning font-weight-bold" href="/auth/login">увійти</a> в обліковий запис</h3>
        <h3> - <a class="text-warning font-weight-bold" href="/devices">додати новий прилад</a>, вписавши у поле вводу його UID</h3>
        <h3> - використовувати доданий прилад, натиснувши на його зображення</h3>
    </div>


</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>