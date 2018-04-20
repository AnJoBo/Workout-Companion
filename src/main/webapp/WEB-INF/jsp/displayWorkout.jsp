<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" import="java.util.*"%>
<%@ include file="include/header.jspf"%>


<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />


<html>
<body>


<script language="Javascript" type="text/javascript">
var counter = 1;
var limit = 8;
var sets = 1;
function addInput(divName){
if (counter == limit) {
alert("Reached adding limit" + counter + " inputs");
}
else {
var newdiv = document.createElement('div');
newdiv.innerHTML = "Set " + (counter + 1) +":"+
"<input type='number' name='reps" + (counter + 1) + "'>";

document.getElementById(divName).appendChild(newdiv);
counter++;

}
} 

</script>
<div class="container">
 <p class="container"><strong>Hello, <c:out value="${currentUser.userName}" />! </strong>
 </br>
 </br>
 Please fill in your workout</p>
 <section class="container centeredPanel">
	
	<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		<div>
		<div>
			<label for="workoutId">Exercise: </label> <select id="workoutId" name="workoutId">
				<option value="1">Bench Press</option>
				<option value="2">Dumbbell Row</option>
				<option value="3">Squat</option>
				<option value="4">Pullup</option>
				<option value="5">Kettlebell Swing</option>
				<option value="6">Russian Twist</option>	
			</select>
			</br>
			<label for="workoutId">Equipment used:</label> <select id="equipment" name="equipment">
				<option value="1">None</option>
				<option value="2">Power Rack</option>
				<option value="3">Kettle Bell</option>
				<option value="4">Flat Bench</option>	
			</select>
		
			</div>
			<div>Sets: <input type="number" name="sets">   <%-- <input type="hidden" name="sets" value="${sets}"/> --%> </div>
			<!-- Reps per set: -->

			<div>
			<!-- Set 1: <input type="number" name="reps1">  -->
			<div id="dynamicInput">
			Set 1: <input type="number" name="reps1"> 
			
			</div>
			
			<div> <input type="button" value="Rep +" onClick="addInput('dynamicInput');"></div>
	</br>
			<div>Weight:<input type="number" name="weight"></div>
			<input type="hidden" name="currentUserId" value="${currentUser.userId}" /> 
			</br>
			<button type="submit" name="push" class="btn btn-default">Submit this workout!</button>
			
	
		</div>
		</form>
		</section>    
		
		
		
		<c:url value="/users/workout" var="formAction" />
		<form method="GET" action="${formAction}">
		</br>
<strong><div class = "workoutlist">Past Workouts:</div></strong>
		
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
		
	
		
		<b><div class = "workoutlist"><c:out value="${getSetsAndReps.workoutDate}" />:</div></b>
		<div><c:out value="${getSetsAndReps.numberOfSets}" /> Sets of <c:out value="${workoutid1}" /></div>
	
	
		<div class="surveylist">
			<div></div>
			<div>Set 1:   <c:out value="${getSetsAndReps.reps1}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB </div>
			<c:choose>
				<c:when test="${getSetsAndReps.reps3 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 2:   <c:out value="${getSetsAndReps.reps2}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${getSetsAndReps.reps3 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 3:   <c:out value="${getSetsAndReps.reps3}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${getSetsAndReps.reps4 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 4:   <c:out value="${getSetsAndReps.reps4}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${getSetsAndReps.reps5 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 5:   <c:out value="${getSetsAndReps.reps5}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
				<c:choose>
				<c:when test="${getSetsAndReps.reps6 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 6:   <c:out value="${getSetsAndReps.reps6}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
				<c:choose>
				<c:when test="${getSetsAndReps.reps7 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 7:   <c:out value="${getSetsAndReps.reps7}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
				<c:choose>
				<c:when test="${getSetsAndReps.reps8 == 0}">	
				<div></div>
				</c:when>
				<c:otherwise>
					<div>Set 8:   <c:out value="${getSetsAndReps.reps8}" /> Repitions With <c:out value="${getSetsAndReps.weight}" /> LB</div>	
				</c:otherwise>
			</c:choose>
		
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