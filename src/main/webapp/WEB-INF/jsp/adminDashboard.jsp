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
	<th>Role</th>
	</tr>
	</thead>
	
	<c:forEach var="user" items="${allUsers}">
		<c:url var="roleUpdate" value="/admin/dashboard" />
		<form action="${roleUpdate}" method="POST">
			<tr>
				<td><c:out value="${user.userName}"/> </td>
				<td><c:out value="${user.email}"/> </td>
				<td><c:out value="${user.phone}"/> </td>
				<td><c:out value="${user.fitnessGoal}"/> </td>
				<td>
					<select class="form-control" name="role" id="roleSelected">
						<option value="user" ${user.role == "user" ? "selected" : "" }>USER</option>
						<option value="employee" ${user.role == "employee" ? "selected" : "" }>EMPLOYEE</option>
						</select>
						</c:forEach>
						<button type="submit" onclick="updateSelectedRole()" class="btn btn-default">Update</button>
					
<!-- 		 			<script>
						function updateSelectedRole(){
							  var xhttp;    
							  if (str == "") {
							    document.getElementById("roleSelected").innerHTML = "";
							    return;
							  }
							  xhttp = new XMLHttpRequest();
							  xhttp.onreadystatechange = function() {
							    if (this.readyState == 4 && this.status == 200) {
							      document.getElementById("roleSelected").innerHTML = this.responseText;
							    }
							  };
							  xhttp.open("POST", "getRole.asp?q="+str, true);
							  xhttp.send();
							}
					
							}
						}
					</script>  -->
				</td>
				
			</tr>
		</form>
	
	</table>
</div>

</section>



<%@ include file="include/footer.jspf" %>
