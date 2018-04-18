<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>

<style>
	td{
		padding: 2px 5px;
		border: 1px solid black;
	}
</style>

<h2><c:out value="${thisUser.userName}"/></h2>

<table class ="userMetrics">
	<tr>
		<td>Equipment Used</td>
		<td><c:out value="${usersMetrics.equipmentName} "/></td>
	</tr>
	<tr>
		<td>Number of Sets</td>
		<td><c:out value="${usersMetrics.numberOfSets} "/></td>
	</tr>
	<tr>
		<td>Set One</td>
		<td><c:out value="${usersMetrics.setOne} "/></td>
	</tr>
	<tr>
		<td>Set Two</td>
		<td><c:out value="${usersMetrics.setTwo} "/></td>
	</tr>
	<tr>
		<td>Set Three</td>
		<td><c:out value="${usersMetrics.setThree} "/></td>
	</tr>
	<tr>
		<td>Set Four</td>
		<td><c:out value="${usersMetrics.setFour} "/></td>
	</tr>
	<tr>
		<td>Weight Used</td>
		<td><c:out value="${usersMetrics.weight} "/></td>
	</tr>
	<tr>
		<td>Workout Time</td>
		<td><c:out value="${usersMetrics.workoutTime} "/></td>
	</tr>
</table>

<%@ include file="include/footer.jspf"%>