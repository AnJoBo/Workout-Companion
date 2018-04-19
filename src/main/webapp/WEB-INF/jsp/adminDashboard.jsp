<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jspf" %>
		
<h1>Employee Dash</h1>

<table class ="adminViewTable">
	<thead>
		<tr>
		<th>Username</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Goal</th>
		<th>Role</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="user" items="${allUsers}" >
	<c:if test="${user.role != 'admin'}">
	<tr>
		<td><c:out value="${user.userName}"/> </td>
		<td><c:out value="${user.email}"/> </td>
		<td><c:out value="${user.phone}"/> </td>
		<td><c:out value="${user.fitnessGoal}"/> </td>
		<td>
		<c:url var="roleUpdate" value="/admin/dashboard" />
		<form action="${roleUpdate}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<input type="hidden" name="userName" value="${user.userName}"/>
			<select class="form-control" name="role" >
				<option value="user" ${user.role == "user" ? "selected" : "" }>USER</option>
				<option value="employee" ${user.role == "employee" ? "selected" : "" }>EMPLOYEE</option>
			</select>
			<td>
				<button type="submit" class="btn btn-default">Update</button>
			</td>
		</form>
		</td>
	</c:if>
	</c:forEach>
	</tbody>
</table>

<%@ include file="include/footer.jspf" %>
