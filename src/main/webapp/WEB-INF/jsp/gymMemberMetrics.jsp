<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>

<c:out value="${thisUser.userName}"/>

<table class ="userMetrics">
	<thead>
		<tr>
		<th>Username</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Goal</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><c:out value="${thisUser.email}"/> </td>
			<td><c:out value="${thisUser.phone}"/> </td>
			<td><c:out value="${thisUser.fitnessGoal}"/> </td>
			<td><c:out value="${thisUser.equipmentName}"/></td>
		</tr>
	</tbody>
</table>

<%@ include file="include/footer.jspf"%>