<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jspf" %>



<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

<h1 style="text-align:center">Exercise Guide</h1>

<c:forEach var="exercise" items="${allExercises}" >
<div>
	<strong><c:out value="${exercise.workoutname}"/></strong> 
	<div><c:url var="exerciseImg" value="/img/exercises/${exercise.workoutname}.gif" />
	<img src="${exerciseImg}" class="exercise-picture"></div>
	<c:out value="${exercise.workoutdescription}"/>
	<br><br>
</div>	
</c:forEach>


</form>

<%@ include file="include/footer.jspf" %>
