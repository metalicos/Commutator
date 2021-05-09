<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">

<head>
    <title>Commutator | Реєстрація</title>
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

        <%--        <c:if test="${errorMessage!=null}">--%>
        <%--            <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${errorMessage}</h1>--%>
        <%--            <c:set var="errorMessage" scope="session" value="${''}"/>--%>
        <%--        </c:if>--%>

        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h3>Реєстрація</h3>
        </div>

        <form action="/auth/registration" method="post" class="animated zoomIn animate_500ms">

            <c:if test="${firstNameError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${firstNameError}</h1>
                <c:set var="errorMessage" scope="request" value="${''}"/>
            </c:if>

            <div class="form-group mb-3">
                <label for="firstname" hidden>Ім'я:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="firstName"
                       id="firstname" type="text" placeholder="Ім'я" value="${userDto.firstName}" autofocus>
            </div>

            <c:if test="${lastNameError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${lastNameError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3">
                <label for="lastname" hidden>Прізвище:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="lastName"
                       id="lastname" type="text" placeholder="Прізвище" value="${userDto.lastName}" autofocus>
            </div>

            <c:if test="${emailError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${emailError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3">
                <label for="email" hidden>Email:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="email"
                       id="email" type="email" placeholder="Ваш E-mail" value="${userDto.email}" required autofocus>
            </div>

            <c:if test="${passwordError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${passwordError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="password1" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="password"
                           id="password1" type="password" placeholder="Пароль" value="${userDto.password}" required
                           autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('password1', this)"></a>
                </div>
            </div>

            <c:if test="${passwordCheckError!=null}">
                <h1 class="h5 my-2 fw-normal text-center" style="color: #9b1512;!important;">${passwordCheckError}</h1>
                <c:set var="errorMessage" scope="session" value="${''}"/>
            </c:if>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="password2" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="passwordCheck"
                           id="password2" type="password" placeholder="Перевірка паролю"
                           value="${userDto.passwordCheck}" required autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('password2', this)"></a>
                </div>
            </div>

            <div class="form-group mb-3">
                <label for="submitRegistration" hidden></label>
                <input class="form-control border-0 shadow-sm px-4 btn-dark-choco"
                       id="submitRegistration" type="submit" value="Зареєструватися">
            </div>

            <div class="form-group d-flex justify-content-between">
                <label for="forgotPass" hidden></label>
                <a class="my-1 text-decoration-none link-dark-choco bg-light-grey"
                   id="forgotPass" href="/auth/forgot-password">Забули пароль?</a>

                <label for="newUser" hidden></label>
                <a class="my-1 text-decoration-none link-dark-choco bg-light-grey"
                   id="newUser" href="/auth/login">Ви вже зареєстровані?</a>
            </div>
        </form>
        <c:set var="userDto" scope="request" value="${null}"/>
    </div>
</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>