<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${errorMessage!=null}">
    <h1 class="h5 my-2 fw-normal text-center"
        style="color: #9b1512;!important;">${errorMessage}</h1>
    <c:set var="errorMessage" scope="session" value="${''}"/>
</c:if>
<c:if test="${message!=null}">
    <h1 class="h5 my-2 fw-normal text-success">${errorMessage}</h1>
    <c:set var="message" scope="session" value="${''}"/>
</c:if>