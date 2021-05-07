<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

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

        <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
            <h3>Реєстрація</h3>
        </div>

        <form action="/auth/registration" method="post" class="animated zoomIn animate_500ms">

            <div class="form-group mb-3">
                <label for="firstname" hidden>Ім'я:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="firstname"
                       id="firstname" type="text" placeholder="Ім'я" required autofocus>
            </div>

            <div class="form-group mb-3">
                <label for="lastname" hidden>Прізвище:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="lastname"
                       id="lastname" type="text" placeholder="Прізвище" required autofocus>
            </div>

            <div class="form-group mb-3">
                <label for="email" hidden>Email:</label>
                <input class="form-control border-0 shadow-sm px-4 my-3 text-dark-choco bg-light-grey" name="email"
                       id="email" type="email" placeholder="Ваш E-mail" required autofocus>
            </div>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="password1" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="password"
                           id="password1" type="password" placeholder="Пароль" required autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('password1', this)"></a>
                </div>
            </div>

            <div class="form-group mb-3 bg-light-grey shadow-sm">
                <label for="password2" hidden></label>
                <div class="input-group">
                    <input class="form-control border-0 px-4 text-dark-choco bg-light-grey" name="password-check"
                           id="password2" type="password" placeholder="Перевірка паролю" required autofocus>
                    <a class="fa fa-eye align-self-center text-decoration-none text-dark-choco mr-2"
                       onClick="showPwd('password2', this)"></a>
                </div>
            </div>

            <div class="form-group mb-3">
                <label for="submitRegistration" hidden></label>
                <input class="form-control border-0 shadow-sm px-4 btn-dark-choco"
                       id="submitRegistration" type="submit" value="Зареєструватися">
            </div>

            <div class="form-group mb-3 text-center">
                <label for="login" hidden></label>
                <a class="text-decoration-none link-dark-choco bg-light-grey px-4"
                   id="login" href="/auth/login">Ви вже зареєстровані?</a>
            </div>
        </form>

    </div>
</div>
<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>