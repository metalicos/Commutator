<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="d-flex justify-content-between m-0 py-2 pt-3 bg-dark-choco text-white px-3">
    <h3>Багатоканальний контролер поливу рослин з інтернет-керуванням</h3>
</div>
<div class="d-flex justify-content-between mt-1 py-2 pt-3 bg-dark-choco text-white px-3">
    <a class="btn btn-light font-weight-bold" href="/cyberplant?uid=${device.UID}">Налаштування<br>контролера</a>
    <a class="btn btn-light font-weight-bold" href="/cyberplant/moisture/0?uid=${device.UID}">Вологість<br>1 каналу, %</a>
    <a class="btn btn-light font-weight-bold" href="/cyberplant/moisture/1?uid=${device.UID}">Вологість<br>2 каналу, %</a>
    <a class="btn btn-light font-weight-bold" href="/cyberplant/moisture/2?uid=${device.UID}">Вологість<br>3 каналу, %</a>
    <a class="btn btn-light font-weight-bold" href="/cyberplant/moisture/3?uid=${device.UID}">Вологість<br>4 каналу, %</a>
<%--    <a class="btn btn-light font-weight-bold" href="/cyberplant/settings?uid=${device.UID}">Загальні<br>налаштування</a>--%>
</div>