<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

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
    <div style="max-width: 350px;margin: auto;">

        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h3>Вхід</h3>
        </div>

        <form action="/auth/login" method="post" class="animated zoomIn animate_500ms">

            <div class="form-group mb-3">
                <label for="inputEmail" hidden>Email:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="email"
                       id="inputEmail" type="email" placeholder="Email" required autofocus>
            </div>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="inputPassword" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="password"
                       id="inputPassword" type="password" placeholder="Password" required autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('inputPassword', this)"></a>
                </div>
            </div>

            <div class="form-group mb-3">
                <label for="submitBtn" hidden></label>
                <input class="form-control border-0 shadow-sm px-4 my-3 bg-dark-choco text-white"
                       id="submitBtn" type="submit" value="Увійти">
            </div>

            <div class="form-group d-flex justify-content-between">
                <label for="forgotPass" hidden></label>
                <a class="my-1 text-decoration-none link-dark-choco bg-light-grey"
                   id="forgotPass" href="/auth/forgot-password">Забули пароль?</a>

                <label for="newUser" hidden></label>
                <a class="my-1 text-decoration-none link-dark-choco bg-light-grey"
                   id="newUser" href="/auth/registration">Новий користувач?</a>
            </div>
        </form>

    </div>
</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>