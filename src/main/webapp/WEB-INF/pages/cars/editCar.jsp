<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 02.12.2023
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle=" Edit Cars">
    <h1> Edit Car</h1>
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditCar">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="license_plate">License Plate</label>
                <input type="text" class="form-control" id="license_plate" name="license_plate" placeholder="" value="${car.licensePlate}" required>
                <label for="parking_spot">Parking Spot</label>
                <input type="text" class="form-control" id="parking_spot" name="parking_spot" placeholder="" value="${car.parkingSpot}" required>
                <label for="owner_id" class="form-label">Country</label>
                <select class="form-select" id="owner_id"  name="owner_id" required>
                    <option value="">Choose...</option>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <option value="${user.id}"${car.ownerName eq user.username ? 'selected' : ''}>${user.username} </option>
                    </c:forEach>

                </select>
                <div class="invalid-feedback">
                    Please select a valid input.
                </div>
                <button class=" btn btn-primary btn-lg" type="submit">Submit</button>
                <div class="invalid-feedback">
                    License Plate is required
                </div>
            </div>
            <input type="hidden" name="car_id" value="${car.id}"/>

        </div>
    </form>

</t:pageTemplate>
