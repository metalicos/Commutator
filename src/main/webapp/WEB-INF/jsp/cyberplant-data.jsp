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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        google.charts.load('current', {packages: ['corechart', 'line']});
        google.charts.setOnLoadCallback(drawLineColorslast60seconds);

        function drawLineColorslast60seconds() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Вологість');

            data.addRows(
                [
                    <c:forEach items="${last60seconds}" var="sdata">
                    [${sdata.created.getSecond()}, ${sdata.value}],
                    </c:forEach>
                ]);

            var options = {
                hAxis: {
                    title: 'Час (останні 60 секунд)'
                },
                vAxis: {
                    title: 'Відносна вологість субстрату'
                },
                colors: ['#a52714']
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div_last60seconds'));
            chart.draw(data, options);
        }
    </script>

    <script>
        google.charts.load('current', {packages: ['corechart', 'line']});
        google.charts.setOnLoadCallback(drawLineColorslast60minutes);

        function drawLineColorslast60minutes() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Вологість');

            data.addRows(
                [
                    <c:forEach items="${last60minutes}" var="sdata">
                    [${sdata.created.getMinute()}, ${sdata.value}],
                    </c:forEach>
                ]);

            var options = {
                hAxis: {
                    title: 'Час (останні 60 [хвилин])'
                },
                vAxis: {
                    title: 'Відносна вологість субстрату'
                },
                colors: ['#a52714']
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div_last60minutes'));
            chart.draw(data, options);
        }
    </script>

    <script>
        google.charts.load('current', {packages: ['corechart', 'line']});
        google.charts.setOnLoadCallback(drawLineColorslast60minutes);

        function drawLineColorslast60minutes() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Вологість');

            data.addRows(
                [
                    <c:forEach items="${lastMonth}" var="sdata">
                    [${sdata.created.getDayOfMonth()}, ${sdata.value}],
                    </c:forEach>
                ]);

            var options = {
                hAxis: {
                    title: 'Час (останній місяць)'
                },
                vAxis: {
                    title: 'Відносна вологість субстрату'
                },
                colors: ['#a52714']
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div_lastMonth'));
            chart.draw(data, options);
        }
    </script>

</head>

<body id="body-pd">

<!-- TOP NAVIGATION BAR -->
<%@include file="parts/navbar.jsp" %>
<!-- LEFT OPERATIONS BAR -->
<%@include file="parts/left-bar.jsp" %>


<!-- CONTENT -->
<div class="height-100 py-3">

    <%@include file="parts/cyberplant/menu.jsp" %>

    <div class="my-2 col-12">
        <a class="btn btn-dark-choco mt-5" href="/cyberplant/moisture/${channelId}?uid=${device.UID}">Оновити дані</a>
        <div id="chart_div_last60seconds" style="height: 500px"></div>

        <a class="btn btn-dark-choco mt-5" href="/cyberplant/moisture/${channelId}?uid=${device.UID}">Оновити дані</a>
        <div id="chart_div_last60minutes" style="height: 500px"></div>

        <a class="btn btn-dark-choco mt-5" href="/cyberplant/moisture/${channelId}?uid=${device.UID}">Оновити дані</a>
        <div id="chart_div_lastMonth" style="height: 500px"></div>
    </div>

    <%@include file="parts/footer.jsp" %>

</div>

<!-- SCRIPTS -->
<%@include file="parts/common-scripts.jsp" %>
</body>
</html>