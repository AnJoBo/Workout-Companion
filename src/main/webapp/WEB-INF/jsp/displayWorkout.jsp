<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" import="java.util.*"%>
<%@ include file="include/header.jspf"%>

<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />


<html>
<body>

<script language="Javascript" type="text/javascript">
var counter = 1;
var limit = 4;
function addInput(divName){
if (counter == limit) {
alert("Reached adding limit" + counter + " inputs");
}
else {
var newdiv = document.createElement('div');
newdiv.innerHTML = "Entry " + (counter + 1) +
	"<input type='number' name='reps[]'>";
document.getElementById(divName).appendChild(newdiv);
counter++;
}
} 

</script>


<section class="centeredPanel">
	
	<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		<div>
			<label for="parkCode">Select a Workout</label> <select id="parkCode" name="parkCode">
				<option value="1">Bench Press</option>
				<option value="2">Dumbbell Row</option>
				<option value="3">Squat</option>
				<option value="4">Pullup</option>
				<option value="5">Kettlebell Swing</option>
				<option value="6">Russian Twistk</option>
				
				
			</select>
			<button type="submit" class="btn btn-default">select workout</button>
		</div>
		</form>
		</section>   
		
		
		
		
		
<form method="GET" action="${formAction}">
<b><div class = "popularParks">Most Popular Parks!!!</div></b>

	<c:forEach var="surveyResults" items="${workouts}">
		<div class="surveylist">
				<c:out value="${workouts.workoutname}" />
			</div>
</c:forEach>
</form> 



		<!-- Add reps one button push and submit -->

<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
<div id="dynamicInput">
Enter number of Sets:
<input type="number" name="sets">
</div>

<div id="dynamicInput">
Rep 1
<input type="number" name="reps[]">
</div>
<input type="button" value="Rep +" onClick="addInput('dynamicInput');">
<div></div><button type="submit" class="btn btn-default">Submit</button></div>
</form>

</body>
</html>  

<%@ include file="include/footer.jspf"%>