<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="l-navbar bg-dark-choco" id="nav-bar">
    <nav class="nav">
        <div>
            <a href="/" class="nav_logo text-decoration-none">
                <img src="/img/cd.png" alt="" height="25" width="25" class="bg-white rounded-circle px-1">
                <span class="nav_logo-name">COMMUTATOR</span>
            </a>
            <div class="nav_list">
                <a href="/devices" class="nav_link active">
                    <i class='bx bx-devices nav_icon'></i>
                    <span class="nav_name">Пристрої</span>
                </a>
                <a href="/schedules" class="nav_link">
                    <i class='bx bx-calendar nav_icon'></i>
                    <span class="nav_name">Розклади</span>
                </a>
                <a href="/timers" class="nav_link">
                    <i class='bx bx-timer nav_icon'></i>
                    <span class="nav_name">Таймери</span>
                </a>
                <a href="/redactor" class="nav_link">
                    <i class='bx bx-edit nav_icon'></i>
                    <span class="nav_name">Редактор</span>
                </a>
            </div>
        </div>
        <a href="/logout" class="nav_link">
            <i class='bx bx-log-out nav_icon'></i>
            <span class="nav_name">Вийти</span>
        </a>
    </nav>
</div>