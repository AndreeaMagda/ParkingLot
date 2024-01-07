<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 26.11.2023
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Users">
  <h1>Add  Users</h1>
  <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
    <a class=" btn btn-primary btn-lg" type="submit" href="${pageContext.request.contextPath}/AddUser">Add
      User</a>

  </c:if>
  <button type="button" class="btn btn-secondary">Invoice</button>
  <div class="container text-center">
    <c:forEach var="user" items="${users}">
      <div class="row">
        <div class="col">
            ${user.username}
        </div>

        <div class="col">
            ${user.email}
        </div> </div>
    </c:forEach>
  </div>

</t:pageTemplate>