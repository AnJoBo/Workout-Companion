<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" import="java.util.*"%>

<%@ include file="include/header.jspf"%>



<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

<h1>EMPLOYEE DASHBAORD</h1>

<c:url value="/users/workout" var="formAction" />
		
 <%-- <form method="GET" action="${formAction}"> 
<b><div class = "popularParks">work outs</div></b> --%>

	<c:forEach var="workouts" items="${workouts}">
		<div class="surveylist">
			<%-- 	<c:out value="${workouts.workoutdescription}" /> --%>
			</div>
</c:forEach>
<!-- </form>  -->




<%@ include file="include/footer.jspf"%>