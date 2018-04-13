<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jspf" %>

<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
<input type="hidden" name="destination" value="${param.destination}"/>

<section class="container">
<div>
		
<div class="row">

<h1>Employee Dash</h1>
<div>
<table class ="adminViewTable">
	<thead>
	<tr>
	<th>Username</th>
	<th>Email</th>
	<th>Phone</th>
	<th>Goal</th>
	</tr>
	</thead>
	
	<c:forEach var="user" items="${allUsers}">
		<tr>
		<th><c:out value="${user.userName}"/> </th>
		<th><c:out value="${user.email}"/> </th>
		<th><c:out value="${user.phone}"/> </th>
		<th><c:out value="${user.fitnessGoal}"/> </th>
		<form></form>
		</tr>
	</c:forEach>
	</table>
</div>

</section>



<%@ include file="include/footer.jspf" %>
