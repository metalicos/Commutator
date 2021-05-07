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

        <div class="row">
            <%-- Список вкладок --%>
            <div class="col-2 pt-2">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-web-control" data-toggle="list"
                       href="#web-control" role="tab" aria-controls="settings">Веб керування</a>
                    <a class="list-group-item list-group-item-action" id="list-sett-ch1" data-toggle="list"
                       href="#sett-ch1" role="tab" aria-controls="home">Канал 1</a>
                    <a class="list-group-item list-group-item-action" id="list-sett-ch2" data-toggle="list"
                       href="#sett-ch2" role="tab" aria-controls="profile">Канал 2</a>
                    <a class="list-group-item list-group-item-action" id="list-sett-ch3" data-toggle="list"
                       href="#sett-ch3" role="tab" aria-controls="messages">Канал 3</a>
                    <a class="list-group-item list-group-item-action" id="list-sett-ch4" data-toggle="list"
                       href="#sett-ch4" role="tab" aria-controls="settings">Канал 4</a>
                    <a class="list-group-item list-group-item-action" id="list-sett-general" data-toggle="list"
                       href="#sett-general" role="tab" aria-controls="settings">Загальні</a>
                </div>
            </div>

            <%-- Вкладки і їх реалізація --%>
            <div class="col-10">
                <div class="tab-content" id="nav-tabContent">
                    <%-- Веб керування --%>
                    <div class="tab-pane show active" id="web-control" role="tabpanel"
                         aria-labelledby="list-web-control">
                        <div class="card bg-light my-2 col-12">
                            <div class="card-body text-dark">


                                <!-- Заголовок -->
                                <div class="bg-dark-choco text-white p-2 mb-4">
                                    <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Веб
                                        керування</h1>

                                </div>

                                <div class="d-flex">
                                    <div class="col-5"></div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-secondary col-10"
                                           href="/cyberplant/webcontrol?command=3&uid=${device.uid}"><i
                                                class="fa fa-arrow-up"></i></a>
                                    </div>
                                    <div class="col-5"></div>
                                </div>
                                <div class="d-flex">
                                    <div class="col-3"></div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-secondary col-10"
                                           href="/cyberplant/webcontrol?command=1&uid=${device.uid}"><i
                                                class="fa fa-arrow-left"></i></a>
                                    </div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-dark-choco col-10"
                                           href="/cyberplant/webcontrol?command=0&uid=${device.uid}">Вибрати</a>
                                    </div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-secondary col-10"
                                           href="/cyberplant/webcontrol?command=2&uid=${device.uid}"><i
                                                class="fa fa-arrow-right"></i></a>
                                    </div>
                                    <div class="col-3"></div>
                                </div>

                                <div class="d-flex">
                                    <div class="col-5"></div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-secondary col-10"
                                           href="/cyberplant/webcontrol?command=4&uid=${device.uid}"><i
                                                class="fa fa-arrow-down"></i></a>
                                    </div>
                                    <div class="col-5"></div>
                                </div>

                                <div class="d-flex">
                                    <div class="col-3"></div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-danger col-10"
                                           href="">Стерти</a>
                                    </div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-success col-10"
                                           href="">Зберегти</a>
                                    </div>
                                    <div class="my-2 col-2">
                                        <a class="btn btn-dark col-10"
                                           href="/cyberplant/webcontrol?command=5&uid=${device.uid}">Назад</a>
                                    </div>
                                    <div class="col-3"></div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%-- Канал 1 --%>
                    <div class="tab-pane" id="sett-ch1" role="tabpanel"
                         aria-labelledby="list-sett-ch1">
                        <form action="">
                            <div class="card bg-light my-2 col-12">
                                <div class="card-body text-dark">

                                    <!-- Заголовок -->
                                    <div class="bg-dark-choco text-white p-2 mb-4">
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

                                    <!-- Тип Каналу -->
                                    <div class="d-flex my-2">
                                        <div class="col-4">
                                            <h1 class="h5">Тип каналу</h1>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex">
                                                <input type="checkbox" name="type">
                                                <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                                   class="btn btn-outline-success col-6">Реле</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="btn btn-outline-danger col-6">Диммер</a>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">Диммер</h1>
                                        </div>
                                    </div>

                                    <!-- Логіка Каналу -->
                                    <div class="d-flex my-2">
                                        <div class="col-4">
                                            <h1 class="h5">Логіка каналу</h1>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex">
                                                <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                                   class="h5 btn btn-outline-success col-6">Активний 0</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="h5 btn btn-outline-danger mr-3 col-6">Активна 1</a>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">Активний 0</h1>
                                        </div>
                                    </div>

                                    <!-- Підтримуване значення каналом -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">Підтримуване значення</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="0.0" max="100.0"
                                                       step="0.1"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <!-- Рівень відкритості каналу -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">Рівень відкритості каналу</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="0" max="65535" step="1"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0</h1>
                                        </div>
                                    </div>

                                    <!-- Режим контролю -->
                                    <div class="d-flex my-2">
                                        <div class="col-4">
                                            <h1 class="h5">Режим контролю</h1>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex">
                                                <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                                   class="h5 btn btn-outline-success col-4">Ручний</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="h5 btn btn-outline-warning col-4">Автомат</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="h5 btn btn-outline-danger col-4">WiFi</a>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">WiFi</h1>
                                        </div>
                                    </div>

                                    <!-- PID Напрям регулювання -->
                                    <div class="d-flex my-2">
                                        <div class="col-4">
                                            <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex">
                                                <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                                   class="btn btn-outline-success col-6">По зростанню</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="btn btn-outline-danger col-6">По спаданню</a>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <!-- PID пропорційний коефіцієнт -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="-100" max="100"
                                                       step="0.01"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <!-- PID інтегральний коефіцієнт -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="-100" max="100"
                                                       step="0.01"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <!-- PID диференціальний коефіцієнт -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="-100" max="100"
                                                       step="0.01"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.2</h1>
                                        </div>
                                    </div>

                                    <!-- PID час ітерації (dT) -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">PID час ітерації (dT)</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="0" max="4294967295"
                                                       step="1"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <!-- Напрям регулювання релейного регулятора-->
                                    <div class="d-flex my-2">
                                        <div class="col-4">
                                            <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex">
                                                <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                                   class="btn btn-outline-success col-6">По зростанню</a>
                                                <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                                   class="btn btn-outline-danger col-6">По спаданню</a>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">По зростанню</h1>
                                        </div>
                                    </div>

                                    <!-- Гістерезис релейного регулятора -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">Гістерезис релейного регулятора</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="-100" max="100"
                                                       step="0.01"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>

                                    <!-- Коефіцієнт інертності системит -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">Коефіцієнт інертності системит</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="-100" max="100"
                                                       step="0.01"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.02</h1>
                                        </div>
                                    </div>

                                    <!-- Час ітерації -->
                                    <div class="d-flex">
                                        <div class="col-4">
                                            <h1 class="h5">Час ітерації</h1>
                                        </div>
                                        <div class="col-4">
                                            <form action="/cyberplant/v1/channel/" method="get">
                                                <input class="form-control" type="number" min="0" max="4294967295"
                                                       step="1"
                                                       value="0">
                                            </form>
                                        </div>
                                        <div class="col-4">
                                            <h1 class="h5">0.05</h1>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </form>
                    </div>

                    <%--animated  zoomIn animate_100ms--%>
                    <%-- Канал 2 --%>
                    <div class="tab-pane" id="sett-ch2" role="tabpanel"
                         aria-labelledby="list-sett-ch2">
                        <div class="card bg-light my-2 col-12">
                            <div class="card-body text-dark">

                                <!-- Заголовок -->
                                <div class="bg-dark-choco text-white p-2 mb-4">
                                    <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал 2</h1>
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

                                <!-- Тип Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Тип каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Реле</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Диммер</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Диммер</h1>
                                    </div>
                                </div>

                                <!-- Логіка Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Логіка каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-6">Активний 0</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger mr-3 col-6">Активна 1</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Активний 0</h1>
                                    </div>
                                </div>

                                <!-- Підтримуване значення каналом -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Підтримуване значення</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0.0" max="100.0" step="0.1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Рівень відкритості каналу -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Рівень відкритості каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="65535" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Режим контролю -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Режим контролю</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-4">Ручний</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-warning col-4">Автомат</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger col-4">WiFi</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">WiFi</h1>
                                    </div>
                                </div>

                                <!-- PID Напрям регулювання -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- PID пропорційний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- PID інтегральний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- PID диференціальний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.2</h1>
                                    </div>
                                </div>

                                <!-- PID час ітерації (dT) -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID час ітерації (dT)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Напрям регулювання релейного регулятора-->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- Гістерезис релейного регулятора -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Гістерезис релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Коефіцієнт інертності системит -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Коефіцієнт інертності системит</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- Час ітерації -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Час ітерації</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <%-- Канал 3 --%>
                    <div class="tab-pane" id="sett-ch3" role="tabpanel"
                         aria-labelledby="list-sett-ch3">
                        <div class="card bg-light my-2 col-12">
                            <div class="card-body text-dark">

                                <!-- Заголовок -->
                                <div class="bg-dark-choco text-white p-2 mb-4">
                                    <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал 3</h1>
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

                                <!-- Тип Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Тип каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Реле</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Диммер</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Диммер</h1>
                                    </div>
                                </div>

                                <!-- Логіка Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Логіка каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-6">Активний 0</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger mr-3 col-6">Активна 1</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Активний 0</h1>
                                    </div>
                                </div>

                                <!-- Підтримуване значення каналом -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Підтримуване значення</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0.0" max="100.0" step="0.1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Рівень відкритості каналу -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Рівень відкритості каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="65535" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Режим контролю -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Режим контролю</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-4">Ручний</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-warning col-4">Автомат</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger col-4">WiFi</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">WiFi</h1>
                                    </div>
                                </div>

                                <!-- PID Напрям регулювання -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- PID пропорційний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- PID інтегральний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- PID диференціальний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.2</h1>
                                    </div>
                                </div>

                                <!-- PID час ітерації (dT) -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID час ітерації (dT)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Напрям регулювання релейного регулятора-->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- Гістерезис релейного регулятора -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Гістерезис релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Коефіцієнт інертності системит -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Коефіцієнт інертності системит</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- Час ітерації -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Час ітерації</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <%-- Канал 4 --%>
                    <div class="tab-pane" id="sett-ch4" role="tabpanel"
                         aria-labelledby="list-sett-ch4">
                        <div class="card bg-light my-2 col-12">
                            <div class="card-body text-dark">

                                <!-- Заголовок -->
                                <div class="bg-dark-choco text-white p-2 mb-4">
                                    <h1 class="col-12 h4 text-uppercase text-center font-weight-bold  py-2">Канал 4</h1>
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

                                <!-- Тип Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Тип каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Реле</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Диммер</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Диммер</h1>
                                    </div>
                                </div>

                                <!-- Логіка Каналу -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Логіка каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-6">Активний 0</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger mr-3 col-6">Активна 1</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Активний 0</h1>
                                    </div>
                                </div>

                                <!-- Підтримуване значення каналом -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Підтримуване значення</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0.0" max="100.0" step="0.1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Рівень відкритості каналу -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Рівень відкритості каналу</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="65535" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0</h1>
                                    </div>
                                </div>

                                <!-- Режим контролю -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Режим контролю</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="h5 btn btn-outline-success col-4">Ручний</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-warning col-4">Автомат</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="h5 btn btn-outline-danger col-4">WiFi</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">WiFi</h1>
                                    </div>
                                </div>

                                <!-- PID Напрям регулювання -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">PID Напрям регулювання вхідної величини</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- PID пропорційний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID пропорційний коефіцієнт (Kp)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- PID інтегральний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID інтегральний коефіцієнт (Ki)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- PID диференціальний коефіцієнт -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID диференціальний коефіцієнт (Kd)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.2</h1>
                                    </div>
                                </div>

                                <!-- PID час ітерації (dT) -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">PID час ітерації (dT)</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Напрям регулювання релейного регулятора-->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Напрям регулювання релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">По зростанню</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">По спаданню</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">По зростанню</h1>
                                    </div>
                                </div>

                                <!-- Гістерезис релейного регулятора -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Гістерезис релейного регулятора</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>

                                <!-- Коефіцієнт інертності системит -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Коефіцієнт інертності системит</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="-100" max="100" step="0.01"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.02</h1>
                                    </div>
                                </div>

                                <!-- Час ітерації -->
                                <div class="d-flex">
                                    <div class="col-4">
                                        <h1 class="h5">Час ітерації</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/" method="get">
                                            <input class="form-control" type="number" min="0" max="4294967295" step="1"
                                                   value="0">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">0.05</h1>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <%-- Загальні налаштування --%>
                    <div class="tab-pane" id="sett-general" role="tabpanel"
                         aria-labelledby="list-sett-general">
                        <div class="card bg-light my-2 col-12">
                            <div class="card-body text-dark">

                                <!-- Заголовок -->
                                <div class="bg-dark-choco text-white p-2 mb-4">
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

                                <!-- Звук -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Звук приладу</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Ввімкнути</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Вимкнути</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Увімкнений</h1>
                                    </div>
                                </div>

                                <!-- Перевірка наявності води у резервуарі -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Перевірка наявності води у резервуарі</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Ввімкнути</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Вимкнути</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Увімкнений</h1>
                                    </div>
                                </div>

                                <!-- Заставка -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Заставка при неактивності</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Ввімкнути</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Вимкнути</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Увімкнений</h1>
                                    </div>
                                </div>

                                <!-- Вибір заставки -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Вибір заставки</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/type" method="get">
                                            <div class="d-flex">

                                                <select class="form-control col-9">
                                                    <option value="0">Інформація про канали</option>
                                                    <option value="1">Інформація сенсори</option>
                                                    <option value="2">Інформація про стан з'єднання WiFi</option>
                                                    <option value="3">Час та дата</option>
                                                </select>
                                                <input class="col-3 btn btn-outline-dark" type="submit" value="Змінити">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Інформація про канали</h1>
                                    </div>
                                </div>

                                <!-- Перейти в заставку після мс -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Перейти в заставку після мс</h1>
                                    </div>
                                    <div class="col-4">
                                        <form action="/cyberplant/v1/channel/type" method="get">
                                            <input type="number" name="value" min="0" max="4000000000">
                                        </form>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">10000</h1>
                                    </div>
                                </div>


                                <!-- Підсвітка екрану -->
                                <div class="d-flex my-2">
                                    <div class="col-4">
                                        <h1 class="h5">Підсвітка екрану</h1>
                                    </div>
                                    <div class="col-4">
                                        <div class="d-flex">
                                            <a href="/cyberplant/v1/channel/type?number=0&value=0"
                                               class="btn btn-outline-success col-6">Ввімкнути</a>
                                            <a href="/cyberplant/v1/channel/type?number=0&value=1"
                                               class="btn btn-outline-danger col-6">Вимкнути</a>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h1 class="h5">Увімкнений</h1>
                                    </div>
                                </div>

                            </div>
                        </div>
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