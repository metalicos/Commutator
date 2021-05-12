<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="uk">
<head>
    <title>Commutator | Пристрої</title>
    <%@include file="parts/common-styles.jsp" %>
    <style>
        .active {
            background-color: #202369 !important; /* 222333*/
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

    <div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3">
        <h3>Багатоканальний контролер поливу рослин з інтернет-керуванням</h3>
    </div>

    <div class="my-2">

        <div class="d-xl-flex d-lg-block d-md-block d-sm-block d-block">
            <%-- Список вкладок --%>
            <div class="col-xl-2 col-lg-12 col-md-12 col-sm-12 col-12 pt-2">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action ${webControlIsActive}" id="list-web-control"
                       data-toggle="list"
                       href="#web-control" role="tab" aria-controls="settings">Веб керування</a>

                    <a class="list-group-item list-group-item-action ${channel1IsActive}" id="list-sett-ch1"
                       data-toggle="list"
                       href="#sett-ch1" role="tab" aria-controls="home">Канал 1</a>

                    <a class="list-group-item list-group-item-action ${channel2IsActive}" id="list-sett-ch2"
                       data-toggle="list"
                       href="#sett-ch2" role="tab" aria-controls="profile">Канал 2</a>

                    <a class="list-group-item list-group-item-action ${channel3IsActive}" id="list-sett-ch3"
                       data-toggle="list"
                       href="#sett-ch3" role="tab" aria-controls="messages">Канал 3</a>

                    <a class="list-group-item list-group-item-action ${channel4IsActive}" id="list-sett-ch4"
                       data-toggle="list"
                       href="#sett-ch4" role="tab" aria-controls="settings">Канал 4</a>

                    <a class="list-group-item list-group-item-action ${generalSettingsIsActive}" id="list-sett-general"
                       data-toggle="list"
                       href="#sett-general" role="tab" aria-controls="settings">Загальні</a>
                </div>
            </div>

            <%-- Вкладки і їх реалізація --%>
            <div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="tab-content" id="nav-tabContent">
                    <%-- Веб керування --%>
                    <div class="tab-pane show ${webControlIsActive}" id="web-control" role="tabpanel"
                         aria-labelledby="list-web-control">
                        <div class="card bg-light my-2 col-12">


                            <!-- Заголовок -->
                            <div class="bg-dark-choco text-white p-2 mb-4">
                                <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Веб
                                    керування</h1>
                            </div>

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

                            <div class="d-flex">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <a class="btn btn-secondary my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=3&uid=${device.uid}"><i
                                            class="fa fa-arrow-up"></i></a>
                                </div>
                                <div class="col-4"></div>
                            </div>
                            <div class="d-flex">
                                <%--                                    <div class="col-3"></div>--%>
                                <div class="col-4">
                                    <a class="btn btn-secondary my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=1&uid=${device.uid}"><i
                                            class="fa fa-arrow-left"></i></a>
                                </div>
                                <div class="col-4">
                                    <a class="btn btn-dark-choco my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=0&uid=${device.uid}">Вибрати</a>
                                </div>
                                <div class="col-4">
                                    <a class="btn btn-secondary my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=2&uid=${device.uid}"><i
                                            class="fa fa-arrow-right"></i></a>
                                </div>
                                <%--                                    <div class="col-3"></div>--%>
                            </div>

                            <div class="d-flex">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <a class="btn btn-secondary my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=4&uid=${device.uid}"><i
                                            class="fa fa-arrow-down"></i></a>
                                </div>
                                <div class="col-4"></div>
                            </div>

                            <div class="d-flex">
                                <%--                                    <div class="col-3"></div>--%>
                                <div class="col-4">
                                    <a class="btn btn-danger my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="">Стерти</a>
                                </div>
                                <div class="col-4">
                                    <a class="btn btn-success my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="">Зберегти</a>
                                </div>
                                <div class="col-4">
                                    <a class="btn btn-dark my-1 py-5  col-12 col-md-11 col-lg-10 col-xl-8"
                                       href="/cyberplant/webcontrol?command=5&uid=${device.uid}">Назад</a>
                                </div>
                                <%--                                    <div class="col-3"></div>--%>
                            </div>

                        </div>
                    </div>

                    <%-- Канал 1 --%>
                    <div class="tab-pane ${channel1IsActive}" id="sett-ch1" role="tabpanel"
                         aria-labelledby="list-sett-ch1">
                        <form action="/cyberplant/channel-settings" method="get">
                            <input type="hidden" name="uid" value="${device.uid}">
                            <input type="hidden" name="channel" value="0">

                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <c:if test="${error!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${error}</h1>
                                        <c:set var="error" scope="request" value="${''}"/>
                                    </c:if>

                                    <!-- Заголовок -->
                                    <div class="d-lg-flex d-none bg-dark-choco text-white p-2 mb-4">
                                        <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал
                                            1</h1>
                                        <div class="d-flex py-2">
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Назва налаштування</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Панель управління</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Станом на даний момент</h1>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelType!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelType}</h1>
                                        <c:set var="errorChannelType" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Тип Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Тип каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">Диммер</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="type" value="0" checked>
                                                    Реле
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="type" value="1"> Диммер
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Диммер</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelLogic!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelLogic}</h1>
                                        <c:set var="errorChannelLogic" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Логіка Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Логіка каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">GND</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="logic" value="0" checked> GND
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="logic" value="1"> VCC
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">GND</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorMaintainValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorMaintainValue}</h1>
                                        <c:set var="errorMaintainValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Підтримуване значення каналом -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Підтримуване значення</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="maintain-value"
                                                   min="0.0" max="100.0" step="0.1" value="${channelDto.maintainValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorOpenValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorOpenValue}</h1>
                                        <c:set var="errorOpenValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Рівень відкритості каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Рівень відкритості каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="open-value"
                                                   min="0" max="65535" step="1" value="${channelDto.openValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorControlMode!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorControlMode}</h1>
                                        <c:set var="errorControlMode" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Режим контролю -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Режим контролю</h1>
                                            <h1 class="h5 d-lg-none d-flex">WiFi</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-4">
                                                    <input type="radio" name="control-mode" value="0" checked> Ручний
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="1"> Автомат
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="2"> WiFi
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">WiFi</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDirection}</h1>
                                        <c:set var="errorPidDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID Напрям регулювання -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="pid-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="pid-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKp!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKp}</h1>
                                        <c:set var="errorPidKp" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID пропорційний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kp"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKp}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKi!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKi}</h1>
                                        <c:set var="errorPidKi" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID інтегральний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-ki"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKi}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKd!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKd}</h1>
                                        <c:set var="errorPidKd" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID диференціальний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.2</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kd"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKd}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.2</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDt}</h1>
                                        <c:set var="errorPidDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID час ітерації (dT) -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID час ітерації (dT)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.pidDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDirection}</h1>
                                        <c:set var="errorRelayDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Напрям регулювання релейного регулятора-->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="relay-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="relay-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayHysteresis!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayHysteresis}</h1>
                                        <c:set var="errorRelayHysteresis" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Гістерезис релейного регулятора -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Гістерезис релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-hysteresis"
                                                   min="-100" max="100" step="0.01"
                                                   value="${channelDto.relayHysteresis}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayK!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayK}</h1>
                                        <c:set var="errorRelayK" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Коефіцієнт інертності системит -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Коефіцієнт інертності системит</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-k"
                                                   min="-100" max="100" step="0.01" value="${channelDto.relayK}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDt}</h1>
                                        <c:set var="errorRelayDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Час ітерації -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Час ітерації</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.relayDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-dark-choco w-100 py-2 m-2">Зберегти</button>

                                </div>
                            </div>
                        </form>
                    </div>

                    <%-- Канал 2 --%>
                    <div class="tab-pane ${channel2IsActive}" id="sett-ch2" role="tabpanel"
                         aria-labelledby="list-sett-ch2">
                        <form action="/cyberplant/channel-settings" method="get">
                            <input type="hidden" name="uid" value="${device.uid}">
                            <input type="hidden" name="channel" value="1">

                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <c:if test="${error!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${error}</h1>
                                        <c:set var="error" scope="request" value="${''}"/>
                                    </c:if>

                                    <!-- Заголовок -->
                                    <div class="d-lg-flex d-none bg-dark-choco text-white p-2 mb-4">
                                        <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал
                                            2</h1>
                                        <div class="d-flex py-2">
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Назва налаштування</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Панель управління</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Станом на даний момент</h1>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelType!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelType}</h1>
                                        <c:set var="errorChannelType" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Тип Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Тип каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">Диммер</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="type" value="0" checked>
                                                    Реле
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="type" value="1"> Диммер
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Диммер</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelLogic!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelLogic}</h1>
                                        <c:set var="errorChannelLogic" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Логіка Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Логіка каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">GND</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="logic" value="0" checked> GND
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="logic" value="1"> VCC
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">GND</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorMaintainValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorMaintainValue}</h1>
                                        <c:set var="errorMaintainValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Підтримуване значення каналом -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Підтримуване значення</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="maintain-value"
                                                   min="0.0" max="100.0" step="0.1" value="${channelDto.maintainValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorOpenValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorOpenValue}</h1>
                                        <c:set var="errorOpenValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Рівень відкритості каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Рівень відкритості каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="open-value"
                                                   min="0" max="65535" step="1" value="${channelDto.openValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorControlMode!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorControlMode}</h1>
                                        <c:set var="errorControlMode" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Режим контролю -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Режим контролю</h1>
                                            <h1 class="h5 d-lg-none d-flex">WiFi</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-4">
                                                    <input type="radio" name="control-mode" value="0" checked> Ручний
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="1"> Автомат
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="2"> WiFi
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">WiFi</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDirection}</h1>
                                        <c:set var="errorPidDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID Напрям регулювання -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="pid-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="pid-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKp!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKp}</h1>
                                        <c:set var="errorPidKp" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID пропорційний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kp"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKp}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKi!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKi}</h1>
                                        <c:set var="errorPidKi" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID інтегральний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-ki"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKi}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKd!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKd}</h1>
                                        <c:set var="errorPidKd" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID диференціальний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.2</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kd"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKd}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.2</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDt}</h1>
                                        <c:set var="errorPidDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID час ітерації (dT) -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID час ітерації (dT)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.pidDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDirection}</h1>
                                        <c:set var="errorRelayDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Напрям регулювання релейного регулятора-->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="relay-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="relay-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayHysteresis!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayHysteresis}</h1>
                                        <c:set var="errorRelayHysteresis" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Гістерезис релейного регулятора -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Гістерезис релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-hysteresis"
                                                   min="-100" max="100" step="0.01"
                                                   value="${channelDto.relayHysteresis}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayK!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayK}</h1>
                                        <c:set var="errorRelayK" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Коефіцієнт інертності системит -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Коефіцієнт інертності системит</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-k"
                                                   min="-100" max="100" step="0.01" value="${channelDto.relayK}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDt}</h1>
                                        <c:set var="errorRelayDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Час ітерації -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Час ітерації</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.relayDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-dark-choco w-100 py-2 m-2">Зберегти</button>

                                </div>
                            </div>
                        </form>
                    </div>

                    <%-- Канал 3 --%>
                    <div class="tab-pane ${channel3IsActive}" id="sett-ch3" role="tabpanel"
                         aria-labelledby="list-sett-ch3">
                        <form action="/cyberplant/channel-settings" method="get">
                            <input type="hidden" name="uid" value="${device.uid}">
                            <input type="hidden" name="channel" value="1">

                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <c:if test="${error!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${error}</h1>
                                        <c:set var="error" scope="request" value="${''}"/>
                                    </c:if>

                                    <!-- Заголовок -->
                                    <div class="d-lg-flex d-none bg-dark-choco text-white p-2 mb-4">
                                        <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал
                                            3</h1>
                                        <div class="d-flex py-2">
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Назва налаштування</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Панель управління</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Станом на даний момент</h1>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelType!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelType}</h1>
                                        <c:set var="errorChannelType" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Тип Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Тип каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">Диммер</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="type" value="0" checked>
                                                    Реле
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="type" value="1"> Диммер
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Диммер</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelLogic!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelLogic}</h1>
                                        <c:set var="errorChannelLogic" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Логіка Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Логіка каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">GND</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="logic" value="0" checked> GND
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="logic" value="1"> VCC
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">GND</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorMaintainValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorMaintainValue}</h1>
                                        <c:set var="errorMaintainValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Підтримуване значення каналом -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Підтримуване значення</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="maintain-value"
                                                   min="0.0" max="100.0" step="0.1" value="${channelDto.maintainValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorOpenValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorOpenValue}</h1>
                                        <c:set var="errorOpenValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Рівень відкритості каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Рівень відкритості каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="open-value"
                                                   min="0" max="65535" step="1" value="${channelDto.openValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorControlMode!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorControlMode}</h1>
                                        <c:set var="errorControlMode" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Режим контролю -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Режим контролю</h1>
                                            <h1 class="h5 d-lg-none d-flex">WiFi</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-4">
                                                    <input type="radio" name="control-mode" value="0" checked> Ручний
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="1"> Автомат
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="2"> WiFi
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">WiFi</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDirection}</h1>
                                        <c:set var="errorPidDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID Напрям регулювання -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="pid-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="pid-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKp!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKp}</h1>
                                        <c:set var="errorPidKp" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID пропорційний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kp"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKp}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKi!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKi}</h1>
                                        <c:set var="errorPidKi" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID інтегральний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-ki"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKi}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKd!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKd}</h1>
                                        <c:set var="errorPidKd" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID диференціальний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.2</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kd"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKd}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.2</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDt}</h1>
                                        <c:set var="errorPidDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID час ітерації (dT) -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID час ітерації (dT)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.pidDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDirection}</h1>
                                        <c:set var="errorRelayDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Напрям регулювання релейного регулятора-->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="relay-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="relay-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayHysteresis!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayHysteresis}</h1>
                                        <c:set var="errorRelayHysteresis" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Гістерезис релейного регулятора -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Гістерезис релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-hysteresis"
                                                   min="-100" max="100" step="0.01"
                                                   value="${channelDto.relayHysteresis}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayK!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayK}</h1>
                                        <c:set var="errorRelayK" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Коефіцієнт інертності системит -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Коефіцієнт інертності системит</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-k"
                                                   min="-100" max="100" step="0.01" value="${channelDto.relayK}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDt}</h1>
                                        <c:set var="errorRelayDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Час ітерації -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Час ітерації</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.relayDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-dark-choco w-100 py-2 m-2">Зберегти</button>

                                </div>
                            </div>
                        </form>
                    </div>

                    <%-- Канал 4 --%>
                    <div class="tab-pane ${channel4IsActive}" id="sett-ch4" role="tabpanel"
                         aria-labelledby="list-sett-ch4">
                        <form action="/cyberplant/channel-settings" method="get">
                            <input type="hidden" name="uid" value="${device.uid}">
                            <input type="hidden" name="channel" value="1">

                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <c:if test="${error!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${error}</h1>
                                        <c:set var="error" scope="request" value="${''}"/>
                                    </c:if>

                                    <!-- Заголовок -->
                                    <div class="d-lg-flex d-none bg-dark-choco text-white p-2 mb-4">
                                        <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал
                                            4</h1>
                                        <div class="d-flex py-2">
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Назва налаштування</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Панель управління</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Станом на даний момент</h1>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelType!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelType}</h1>
                                        <c:set var="errorChannelType" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Тип Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Тип каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">Диммер</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="type" value="0" checked>
                                                    Реле
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="type" value="1"> Диммер
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Диммер</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelLogic!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelLogic}</h1>
                                        <c:set var="errorChannelLogic" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Логіка Каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Логіка каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">GND</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="logic" value="0" checked> GND
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="logic" value="1"> VCC
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">GND</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorMaintainValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorMaintainValue}</h1>
                                        <c:set var="errorMaintainValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Підтримуване значення каналом -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Підтримуване значення</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="maintain-value"
                                                   min="0.0" max="100.0" step="0.1" value="${channelDto.maintainValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorOpenValue!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorOpenValue}</h1>
                                        <c:set var="errorOpenValue" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Рівень відкритості каналу -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Рівень відкритості каналу</h1>
                                            <h1 class="h5 d-lg-none d-flex">0</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="open-value"
                                                   min="0" max="65535" step="1" value="${channelDto.openValue}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorControlMode!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorControlMode}</h1>
                                        <c:set var="errorControlMode" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Режим контролю -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Режим контролю</h1>
                                            <h1 class="h5 d-lg-none d-flex">WiFi</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-4">
                                                    <input type="radio" name="control-mode" value="0" checked> Ручний
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="1"> Автомат
                                                </div>
                                                <div class="btn btn-secondary col-4">
                                                    <input type="radio" name="control-mode" value="2"> WiFi
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">WiFi</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDirection}</h1>
                                        <c:set var="errorPidDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID Напрям регулювання -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="pid-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="pid-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKp!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKp}</h1>
                                        <c:set var="errorPidKp" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID пропорційний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kp"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKp}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKi!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKi}</h1>
                                        <c:set var="errorPidKi" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID інтегральний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-ki"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKi}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidKd!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidKd}</h1>
                                        <c:set var="errorPidKd" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID диференціальний коефіцієнт -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.2</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-kd"
                                                   min="-100" max="100" step="0.01" value="${channelDto.pidKd}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.2</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorPidDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorPidDt}</h1>
                                        <c:set var="errorPidDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- PID час ітерації (dT) -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">PID час ітерації (dT)</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="pid-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.pidDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDirection!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDirection}</h1>
                                        <c:set var="errorRelayDirection" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Напрям регулювання релейного регулятора-->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">По зростанню</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="relay-direction" value="0" checked> По
                                                    зростанню
                                                </div>
                                                <div class="btn btn-secondary col-6">
                                                    <input type="radio" name="relay-direction" value="1"> По спаданню
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayHysteresis!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayHysteresis}</h1>
                                        <c:set var="errorRelayHysteresis" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Гістерезис релейного регулятора -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Гістерезис релейного регулятора</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-hysteresis"
                                                   min="-100" max="100" step="0.01"
                                                   value="${channelDto.relayHysteresis}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayK!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayK}</h1>
                                        <c:set var="errorRelayK" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Коефіцієнт інертності системит -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Коефіцієнт інертності системит</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.02</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-k"
                                                   min="-100" max="100" step="0.01" value="${channelDto.relayK}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <c:if test="${errorRelayDt!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorRelayDt}</h1>
                                        <c:set var="errorRelayDt" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Час ітерації -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Час ітерації</h1>
                                            <h1 class="h5 d-lg-none d-flex">0.05</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <input class="form-control" type="number" name="relay-dt"
                                                   min="0" max="4294967295" step="1" value="${channelDto.relayDt}">
                                        </div>
                                        <div class="col-4 d-none d-lg-flex">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-dark-choco w-100 py-2 m-2">Зберегти</button>

                                </div>
                            </div>
                        </form>
                    </div>

                    <%-- Загальні налаштування --%>
                    <div class="tab-pane ${generalSettingsIsActive}" id="sett-general" role="tabpanel"
                         aria-labelledby="list-sett-general">
                        <form action="/cyberplant/settings" method="get">
                            <input type="hidden" name="uid" value="${device.uid}">
                            <input type="hidden" name="channel" value="1">

                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <c:if test="${error!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${error}</h1>
                                        <c:set var="error" scope="request" value="${''}"/>
                                    </c:if>

                                    <!-- Заголовок -->
                                    <div class="d-lg-flex d-none bg-dark-choco text-white p-2 mb-4">
                                        <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Загальні
                                            налаштування</h1>
                                        <div class="d-flex py-2">
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Назва налаштування</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Панель управління</h1>
                                            </div>
                                            <div class="col-4">
                                                <h1 class="h5 text-uppercase">Станом на даний момент</h1>
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${errorChannelType!=null}">
                                        <h1 class="h5 my-2 fw-normal text-center"
                                            style="color: #9b1512;!important;">${errorChannelType}</h1>
                                        <c:set var="errorChannelType" scope="request" value="${''}"/>
                                    </c:if>
                                    <!-- Звук -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Звук приладу</h1>
                                            <h1 class="h5 d-lg-none d-flex">Ввімкн.</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="sound" value="0" checked>
                                                    Ввімкн.
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="sound" value="1"> Вимкн.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Ввімкн.</h1>
                                        </div>
                                    </div>

                                    <!-- Перевірка наявності води у резервуарі -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Перевірка наявності води у резервуарі</h1>
                                            <h1 class="h5 d-lg-none d-flex">Ввімкн.</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="sound" value="0" checked>
                                                    Ввімкн.
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="sound" value="1"> Вимкн.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Ввімкн.</h1>
                                        </div>
                                    </div>

                                    <!-- Заставка -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Заставка при неактивності</h1>
                                            <h1 class="h5 d-lg-none d-flex">Ввімкн.</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="screensaver" value="0" checked>
                                                    Ввімкн.
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="screensaver" value="1"> Вимкн.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Ввімкн.</h1>
                                        </div>
                                    </div>


                                    <!-- Підсвітка екрану -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Підсвітка екрану</h1>
                                            <h1 class="h5 d-lg-none d-flex">Ввімкн.</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <div class="btn btn-secondary active col-6">
                                                    <input type="radio" name="screenLight" value="0" checked>
                                                    Ввімкн.
                                                </div>
                                                <div class="btn btn-secondary col-6 ">
                                                    <input type="radio" name="screenLight" value="1"> Вимкн.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">Ввімкн.</h1>
                                        </div>
                                    </div>

                                    <!-- SSID -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Назва точки доступу SSID</h1>
                                            <h1 class="h5 d-lg-none d-flex">ABC</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12 w-100">
                                            <input class="form-control" type="text" name="ssid" placeholder="SSID">
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">ABC</h1>
                                        </div>
                                    </div>

                                    <!-- PASS -->
                                    <div class="d-lg-flex d-md-block my-2">
                                        <div class="d-flex justify-content-between col-lg-4 col-md-12 col-12">
                                            <h1 class="h5">Пароль точки доступу PASS</h1>
                                            <h1 class="h5 d-lg-none d-flex">**********</h1>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-12 w-100">
                                            <input class="form-control" type="password" name="pass" placeholder="***********">
                                        </div>
                                        <div class="col-lg-4 d-none d-lg-flex">
                                            <h1 class="h5">**********</h1>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-dark-choco w-100 py-2 m-2">Зберегти</button>

                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <%@include file="parts/footer.jsp" %>

</div>

<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>