<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>

<h1>UPDATE PAGE</h1>


<script type="text/javascript">
	$(document).ready(function() {
		$("#changePasswordForm").validate({
			rules : {
				newPassword : {
					required : true,
					minlength: 15,
					capitals: true,
				},
				confirmNewPassword : {
					required : true,
					equalTo : "#password"
				}
			},
			messages : {
				newPassword: {
					minlength: "Password too short, make it at least 15 characters",
					capitals: "Field must contain a capital letter",
				},
				confirmNewPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>


<p id="currentUser">Current User: ${currentUser.userName}</p>

<div class="row">
	<div class="col-md-5">
	
	<h3>Update User Info</h3>
		<c:url var="formAction" value="/userUpdate/${currentUser.userName}" />
		<form action="${formAction}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
			<input type="hidden" name="userName" value="${currentUser.userName}" />
			
			<div class="form-group">
				<label for="picture">Photo: </label>
				<c:url var="userImg" value="/img/${currentUser.picture}" />
				<img src="${userImg}" style="display: block;">
				<input type="file" id="picture" name="newPicture" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="newUserName">Username: </label> 
				<input type="text" id="newUserName" name="newUserName" class="form-control" placeholder="${currentUser.userName}"/>
			</div>
			
			<div class="form-group">
				<label for="userName">Email: </label> 
				<input type="email" id="email" name="newEmail" class="form-control" placeholder="${currentUser.email}"/>
			</div>
			
			<div class="form-group">
				<label for="userName">Phone Number: </label> 
				<input type="text" id="phone" name="newPhone" class="form-control" placeholder="${currentUser.phone}"/>
			</div>
			
			<div class="form-group">
  				<label for="fitnessGoal">Select Fitness Goal:</label>
  				<select class="form-control" name="newFitnessGoal">
    					<option value="maintain weight" ${currentUser.fitnessGoal == "maintain weight" ? "selected" : "" }>MAINTAIN WEIGHT</option>
    					<option value="lose weight" ${currentUser.fitnessGoal == "lose weight" ? "selected" : "" }>LOSE WEIGHT</option>
    					<option value="gain weight" ${currentUser.fitnessGoal == "gain weight" ? "selected" : "" }>GAIN WEIGHT</option>
  				</select>
			</div>
			<button type="submit" class="btn btn-default">Update Info</button>
		</form>
			
			<hr>
			
	<h3>Update Password</h3>
		<c:url var="formAction" value="/userUpdate/${currentUser.userName}" />
		<form action="${formAction}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
			<input type="hidden" name="userName" value="${currentUser.userName}" />
			
			<div class="form-group">
				<label for="newPassword">New Password: </label> 
				<input type="password" id="newPassword" name="newPassword" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="confirmNewPassword">Confirm Password: </label> 
				<input type="password" id="confirmNewPassword" name="confirmNewPassword" class="form-control" />
			</div>
			
			<button type="submit" class="btn btn-default">Update Password</button>
		</form>
		
		<hr>
		
	<h3>Delete Account</h3>
		<c:url var="deleteAction" value="/deleteUser/${currentUser.userName}"/>
		<form action="${deleteAction}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
			<input type="hidden" name="userName" value="${currentUser.userName}" />
		
			<button type="submit" class="btn btn-danger">DELETE ACCOUNT</button>
		</form>
	</div>
</div>
<br>

<%@ include file="include/footer.jspf" %>