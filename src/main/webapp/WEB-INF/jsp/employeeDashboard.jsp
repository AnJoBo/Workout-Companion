<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>


<h1>EMPLOYEE DASHBAORD</h1>

<table class ="employeeViewTable">
	<thead>
		<tr>
		<th>Username</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Goal</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="user" items="${allUsers}" >
	<c:if test="${user.role != 'admin' && user.role != 'employee'}">
	<tr>
		<td><c:out value="${user.userName}"/> </td>
		<td><c:out value="${user.email}"/> </td>
		<td><c:out value="${user.phone}"/> </td>
		<td><c:out value="${user.fitnessGoal}"/> </td>
		<td>
			<c:url var="userMetrics" value="/employee/userMetrics/${user.userName}" />
			<form action="${userMetrics}" method="GET">
				<button type="submit" class="btn btn-default">View Metrics</button>
			</form>
		</td>
	</c:if>
	</c:forEach>
	</tbody>
</table>


<%@ include file="include/footer.jspf"%>