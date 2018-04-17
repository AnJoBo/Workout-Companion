<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" import="java.util.*"%>


<%@ include file="include/header.jspf"%>




<html>
<head>

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
	<h1 class="centered">Submit a Survey</h1>
	<form method="POST" action="${formAction}">
		<div>
			<label for="parkCode">Favorite National Park</label> <select
				id="parkCode" name="parkCode">
				<option value="CVNP">Cuyahoga Valley National Park</option>
				<option value="ENP">Everglades National Park</option>
				<option value="GCNP">Grand Canyon National Park</option>
				<option value="GNP">Glacier National Park</option>
				<option value="GSMNP">Great Smoky Mountains National Park</option>
				<option value="GTNP">Grand Teton National Park</option>
				<option value="MRNP">Mount Rainier National Park</option>
				<option value="RMNP">Rocky Mountain National Park</option>
				<option value="YNP">Yellowstone National Park</option>
				<option value="YNP2">Yosemite National Park</option>
				
			</select>
			
		</div>
		</form>
		</section>



<!-- Add reps one button push and submit -->


</head>


<body>
<form method="POST">
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