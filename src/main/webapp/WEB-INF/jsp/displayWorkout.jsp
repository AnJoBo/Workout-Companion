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
<div class="container">
 <p class="container"><strong>Hello, <c:out value="${currentUser.userName}" />! </strong>
 </br>
 </br>
 Please fill in your workout.</p>
 <section class="container centeredPanel">
	
	<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		<div>
		<div>
			<label for="workoutId">Select a Workout</label> <select id="workoutId" name="workoutId">
				<option value="1">Bench Press</option>
				<option value="2">Dumbbell Row</option>
				<option value="3">Squat</option>
				<option value="4">Pullup</option>
				<option value="5">Kettlebell Swing</option>
				<option value="6">Russian Twistk</option>	
			</select>
			
			<label for="workoutId">Select What peice of equipment you used:</label> <select id="equipment" name="equipment">
				<option value="1">None</option>
				<option value="2">Power Rack</option>
				<option value="3">Kettle Bell</option>
				<option value="4">Flat Bench</option>	
			</select>
		
			</div>
			<div>Input number of Sets you did:<input type="number" name="sets"></div>
			<div>Input how many Reps in each set:</div><div>1:<input type="number" name="reps1"> 2: <input type="number" name="reps2"> 3: <input type="number" name="reps3" >(optional) 4:<input type="number" name="reps4" >(optional)</div>
			<div>Input how much weight you used:<input type="number" name="weight"></div>
			<input type="hidden" name="currentUserId" value="${currentUser.userId}" /> 
			<button type="submit" class="btn btn-default">Submit this workout!</button>
		</div>
		</form>
		</section>    
		
		
		
		<c:url value="/users/workout" var="formAction" />
		<form method="GET" action="${formAction}">
<b><div class = "workoutlist">Your Current Workouts</div></b>
		
		<c:forEach var="getSetsAndReps" items="${getSetsAndReps}">
		
		<c:choose>
				<c:when test="${getSetsAndReps.workoutid == 1}">
					<c:set var="workoutid1" value="Bench Press"/>	
				</c:when>
				<c:when test="${getSetsAndReps.workoutid == 2}">
				<c:set var="workoutid1" value="Dumbbell Row"/>	
				</c:when>
				<c:when test="${getSetsAndReps.workoutid == 3}">
					<c:set var="workoutid1" value="Squat"/>	
				</c:when>
				<c:when test="${getSetsAndReps.workoutid == 4}">
					<c:set var="workoutid1" value="Pullup"/>	
				</c:when>
				<c:when test="${getSetsAndReps.workoutid == 5}">
					<c:set var="workoutid1" value="Kettlebell Swing"/>	
				</c:when>
				
				<c:otherwise>
					<c:set var="workoutid1" value="Russian Twist"/>	
				</c:otherwise>
			</c:choose>
		
	
		
		<b><div class = "workoutlist">you did this workout on <c:out value="${getSetsAndReps.workoutDate}" /></div></b>
		<div>you did <c:out value="${getSetsAndReps.numberOfSets}" /> Sets of <c:out value="${workoutid1}" /> on </div>
	
		<div class="surveylist">
			<div></div>
			<div>Set 1:   <c:out value="${getSetsAndReps.reps1}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB </div>
			<div>Set 2:   <c:out value="${getSetsAndReps.reps2}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>
			<div>Set 3:   <c:out value="${getSetsAndReps.reps3}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>
			<div>Set 4:   <c:out value="${getSetsAndReps.reps4}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>
		
			</div>
</c:forEach>
		</form>
		</div>



		<!-- Add reps one button push and submit -->

<%-- <form method="POST" action="${formAction}">
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
</form> --%>

</body>
</html>  

<%@ include file="include/footer.jspf"%>