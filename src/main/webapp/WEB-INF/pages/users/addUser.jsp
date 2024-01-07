<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 18.12.2023
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle=" Add User">
    <br>
    <h1> Add User</h1>

    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddUser">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="username">User name</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="" value="" required>
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="" value="" required>
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="" value=""
                       required>
                <div class="invalid-feedback">
                    Password is required.
                </div>
                <label for="user_groups">Groups</label>
                <select class="custom-select d-block w-100" id="user_groups" name="user_groups" multiple>
                    <c:forEach var="user_group" items="${userGroups}" varStatus="status">
                        <option value="${user_group}">${user_group}</option>
                    </c:forEach>
                </select>


                <button class=" btn btn-primary btn-lg" type="submit">Submit</button>
                <div class="invalid-feedback">
                    License Plate is required
                </div>
            </div>

        </div>
    </form>

</t:pageTemplate>
