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
        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h3>Вхід</h3>
        </div>

        <form action="/auth/login" method="post" class="animated zoomIn animate_500ms">
            ${param.error}
            <c:if test="${emailError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${emailError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3">
                <label for="email" hidden>Email:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="email"
                       id="email" type="email" placeholder="Email" value="${userDto.email}" required autofocus>
            </div>

            <c:if test="${passwordError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${passwordError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="password" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="password"
                           id="password" type="password" placeholder="Password" value="${userDto.password}" required
                           autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('password', this)"></a>
                </div>
            </div>

            <div class="form-group d-flex mb-3 align-items-center justify-content-start">
                <h1 class="h6 mt-2 mr-3">Запам'ятати мене (30 днів):</h1>
                <input class="form-check border-0 shadow-sm px-4 my-1" name="remember-me"
                       id="remember-me" type="checkbox">
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