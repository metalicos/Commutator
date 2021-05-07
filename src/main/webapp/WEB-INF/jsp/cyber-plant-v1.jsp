<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <title>Commutator | Пристрої</title>
    <%@include file="parts/common-styles.jsp" %>
    <style>
        .switch {
            /* margin: 50px auto; */
            position: relative
        }

        .switch label {
            width: 100%;
            height: 100%;
            position: relative;
            display: block
        }

        .switch input {
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            opacity: 0;
            z-index: 100;
            position: absolute;
            width: 100%;
            height: 100%;
            cursor: pointer
        }

        .switch.demo3 {
            width: 180px;
            height: 50px
        }

        .switch.demo3 label {
            display: block;
            width: 100%;
            height: 100%;
            background: #a5a39d;
            box-shadow: inset 0 3px 8px 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(255, 255, 255, 0.5)
        }

        .switch.demo3 label:after {
            content: "";
            position: absolute;
            z-index: -1;
            top: -8px;
            right: -8px;
            bottom: -8px;
            left: -8px;
            border-radius: inherit;
            background: #ababab;
            background: -moz-linear-gradient(#f2f2f2, #ababab);
            background: -ms-linear-gradient(#f2f2f2, #ababab);
            background: -o-linear-gradient(#f2f2f2, #ababab);
            background: -webkit-gradient(linear, 0 0, 0 100%, from(#f2f2f2), to(#ababab));
            background: -webkit-linear-gradient(#f2f2f2, #ababab);
            background: linear-gradient(#f2f2f2, #ababab);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3), 0 1px 1px rgba(0, 0, 0, 0.25)
        }

        .switch.demo3 label i {
            display: block;
            height: 100%;
            width: 60%;
            border-radius: inherit;
            background: silver;
            position: absolute;
            z-index: 2;
            right: 40%;
            top: 0;
            background: #b2ac9e;
            background: -moz-linear-gradient(#f7f2f6, #b2ac9e);
            background: -ms-linear-gradient(#f7f2f6, #b2ac9e);
            background: -o-linear-gradient(#f7f2f6, #b2ac9e);
            background: -webkit-gradient(linear, 0 0, 0 100%, from(#f7f2f6), to(#b2ac9e));
            background: -webkit-linear-gradient(#f7f2f6, #b2ac9e);
            background: linear-gradient(#f7f2f6, #b2ac9e);
            box-shadow: inset 0 1px 0 white, 0 0 8px rgba(0, 0, 0, 0.3), 0 5px 5px rgba(0, 0, 0, 0.2)
        }

        .switch.demo3 label i:after {
            content: "";
            position: absolute;
            left: 15%;
            top: 25%;
            width: 70%;
            height: 50%;
            background: #d2cbc3;
            background: -moz-linear-gradient(#cbc7bc, #d2cbc3);
            background: -ms-linear-gradient(#cbc7bc, #d2cbc3);
            background: -o-linear-gradient(#cbc7bc, #d2cbc3);
            background: -webkit-gradient(linear, 0 0, 0 100%, from(#cbc7bc), to(#d2cbc3));
            background: -webkit-linear-gradient(#cbc7bc, #d2cbc3);
            background: linear-gradient(#cbc7bc, #d2cbc3);
            border-radius: inherit
        }

        .switch.demo3 input:checked ~ label {
            background: #9abb82
        }

        .switch.demo3 input:checked ~ label i {
            right: -1%
        }
        .switch.demo3 label i:before {
            content: "0";
            text-transform: uppercase;
            font-style: normal;
            font-weight: bold;
            color: rgba(0, 0, 0, 0.4);
            text-shadow: 0 1px 0 #bcb8ae, 0 -1px 0 #97958e;
            font-family: Helvetica, Arial, sans-serif;
            font-size: 24px;
            position: absolute;
            top: 50%;
            margin-top: -12px;
            right: -50%
        }
        .switch.demo3 input:checked ~ label i:before {
            content: "1";
            right: 115%;
            color: #82a06a;
            text-shadow: 0 1px 0 #afcb9b, 0 -1px 0 #6b8659
        }
        #submit:focus {
            outline: none;
            outline-offset: none
        }

        .button {
            display: inline-block;
            padding: 9px 22px;
            margin: 20px 8px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            background-image: none;
            border: 2px solid transparent;
            border-radius: 5px;
            color: #fff;
            background-color: #8E24AA
        }

        .button_loader {
            background-color: transparent;
            border: 4px solid #f3f3f3;
            border-radius: 50%;
            border-top: 4px solid #969696;
            border-bottom: 4px solid #969696;
            width: 50px;
            height: 50px;
            -webkit-animation: spin 0.8s linear infinite;
            animation: spin 0.8s linear infinite
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg)
            }

            99% {
                -webkit-transform: rotate(360deg)
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg)
            }

            99% {
                transform: rotate(360deg)
            }
        }
    </style>
</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>
<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>


<!-- CONTENT -->
<div class="height-100 py-3">

    <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3 animated fadeInDown animate_500ms">
        <h3>Багатоканальний контролер поливу рослин з інтернет-керуванням</h3>
        <%--        <a class="align-self-center text-white" href="">--%>
        <%--            <i class="bx bx-plus-circle h3"></i>--%>
        <%--        </a>--%>
    </div>

    <%--
            <button class="d-flex justify-content-between w-100 m-0 py-1 my-2 pt-2 bg-dark-choco text-danger px-3 btn text-white animated  zoomIn animate_500ms"
                    type="button" data-toggle="collapse" data-target="#inner-box3" aria-expanded="false"
                    aria-controls="inner-box">
                <h3 class="font-weight-bold">Видалити</h3>
                <!--        <span class="bx bxs-plus-square icon-size-3"></span> --!>
            </button>

            <div id="inner-box3" class="row py-3 animated zoomIn animate_500ms">
                <div class="col-lg-1 col-md-2 offset-md-0 offset-sm-0 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Користувача</h5>
                            <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>

                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Користувача</h5>
                            <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>

                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Користувача</h5>
                            <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Користувача</h5>
                            <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Користувача</h5>
                            <span class="bx bx-user card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>

                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Прилад</h5>
                            <span class="bx bx-devices card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>

                <div class="col-lg-2 col-md-3 offset-md-0 offset-sm-1 col-sm-10 offset-sm-1 my-lg-0 my-4 custom-zoom">
                    <a class="text-decoration-none" href="">
                        <div class="card bg-dark-choco">
                            <h5 class="font-weight-bold text-center bg-danger text-white card-title m-2 py-2">
                                Сенсор</h5>
                            <span class="bx bx-devices card-body h1 text-danger icon-size-6 text-center my-0 p-0"></span>
                        </div>
                    </a>
                </div>
            </div>
        --%>

    <%--
        bool channelType[4] = {0, 0, 0, 0};                                         // Тип каналу (Реле / Диммер)
      bool channelLogic[4] = {0, 0, 0, 0};                                        // Логіка каналу (Логічний 0 або лог. 1)
      double analogSensorData[4] = {0.0, 0.0, 0.0, 0.0};                          // Значення сенсорів у реальному часі
      double maintainValue[4]  = {30.0, 30.0, 30.0, 30.0};                        // Підтримуване значення сенсорів регуляторами
      uint16_t channelValue[4] = {0, 0, 0, 0};                                    // Рівень відкритості каналу (для димера 0-65535) (для реле 1 або 0)
      uint8_t channelControlMode[4] = {0, 0, 0, 0};                               // Режим контролю (Ручний, Регулятор ...)

      bool pidDirection[4] = {0, 0, 0, 0};                                        // Напрямок регулювання пропорційно-інтегрально-диференціального регулятора
      double pidKp[4] = {0.1, 0.1, 0.1, 0.1};                                     // Пропорційна складова
      double pidKi[4] = {0.05, 0.05, 0.05, 0.05};                                 // Інтегральна складова
      double pidKd[4] = {0.01, 0.01, 0.01, 0.01};                                 // Диференціальна складова
      uint32_t pidDt[4] = {1000, 1000, 1000, 1000};                               // Час дискретизації

      bool relayDirection[4] = {0, 0, 0, 0};                                      // Напрямок регулювання релейного регулятора на гістерезисі
      double relayHysteresis[4] = {5.0, 5.0, 5.0, 5.0};                           // значення гістерезису
      double relayK[4] = {0.5, 0.5, 0.5, 0.5};                                    // коефіцієнт інерційності системи
      uint32_t relayDt[4] = {500, 500, 500, 500};                                 // час ітерації


      bool sound = false;                                                         // Режим звуку
      bool waterCheck = false;                                                    // Режим перевірки води
      bool screensaver = false;                                                   // Заставка
      uint16_t screensaverType = 0;                                               // Тип заставки
      uint32_t screensaverAfter = 0;                                              // Перейти в заставку після мс
      bool screenLight = true;                                                    // Підсвітка екрану

      uint8_t dateSecond;                                                         // Час секунда
      uint8_t dateMinute;                                                         // Час хвилина
      uint8_t dateHour;                                                           // Час година
      uint8_t dateDay;                                                            // Час день
      uint8_t dateMonth;                                                          // Час місяць
      uint16_t dateYear;                                                          // Час рік

      char wifiSSID[20] = {'\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'}; // Назва точки дуступу
      char wifiPASS[20] = {'\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'}; // Пароль до точки доступу

      // СИСТЕМНІ НАЛАШТУВАННЯ
      uint32_t sendDataToServerEvery = 1000;                                      // Надсилати дані на сервер кожних мс
      uint16_t checkSensorEvery = 1000;                                           // Перевіряти сенсори кожних мс
      bool turnOff = false;                                                       // Екстренне вимикання пристрою
      uint16_t restartCounter = 0;                                                // Лічильник перезавантажень контролера
      uint16_t workedTimeInSeconds = 0;                                           // Лічильник роботи контролера в секундах
      uint32_t workedTimeInHours = 0;                                             // Лічильник роботи контролера в годинах
      const char uId[20] = UID;                                                   // Унікальний номер пристрою Cyber Done
    --%>

    <div class="my-2">

        <div class="d-lg-flex d-md-block justify-content-sm-center justify-content-md-start align-content-center">


            <div class="card bg-light my-2 col-12 col-lg-5 col-md-5 col-sm-12">
                <div class="card-body">
                    <h1 class="h4">Тип каналу:</h1>
                    <div class="card-group">


                        <div class="card-body">
                            <h1 class="h5  justify-content-between">Канал 1</h1>
                            <div class="switch demo3">
                                <input id="ch-0-type" type="checkbox" onchange="
                               // if($('#ch-0-type').getAttribute('checked') )
                                location.href='/cyberplant/v1/channel/type?number=0&value=0'


"> <label><i></i></label>
                            </div>
                            <input id="submit" class="button" type="submit" value="CLICK ME" />
                        </div>

                        <div class="card-body">
                            <h1 class="h5  justify-content-between">Канал 2</h1>
                            <div class="switch demo3"><input type="checkbox"> <label><i></i></label></div>
                        </div>

                        <div class="card-body">
                            <h1 class="h5  justify-content-between">Канал 3</h1>
                            <div class="switch demo3"><input type="checkbox"> <label><i></i></label></div>
                        </div>

                        <div class="card-body">
                            <h1 class="h5  justify-content-between">Канал 4</h1>
                            <div class="switch demo3"><input type="checkbox"> <label><i></i></label></div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


    <%@include file="parts/footer.jsp" %>

</div>
<%--<script>--%>
<%--    $(document).ready(function() {--%>

<%--        $('.updateButton').on('click', function() {--%>

<%--            var member_id = $(this).attr('member_id');--%>

<%--            var name = $('#nameInput'+member_id).val();--%>
<%--            var email = $('#emailInput'+member_id).val();--%>

<%--            req = $.ajax({--%>
<%--                url : '/update',--%>
<%--                type : 'POST',--%>
<%--                data : { name : name, email : email, id : member_id }--%>
<%--            });--%>

<%--            req.done(function(data) {--%>

<%--                $('#memberSection'+member_id).fadeOut(1000).fadeIn(1000);--%>
<%--                $('#memberNumber'+member_id).text(data.member_num);--%>

<%--            });--%>


<%--        });--%>

<%--    });--%>
<%--</script>--%>

<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>