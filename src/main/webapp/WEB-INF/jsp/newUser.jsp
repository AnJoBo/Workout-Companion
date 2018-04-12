<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>


<script type="text/javascript">
	$(document).ready(function () {
		$.validator.addMethod('capitals', function(thing){
			return thing.match(/[A-Z]/);
		});
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true,
					minlength: 15,
					capitals: true,
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {			
				password: {
					minlength: "Password too short, make it at least 15 characters",
					capitals: "Field must contain a capital letter",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />	
			</div>
			<div class="form-group">
				<label for="email">Email: </label>
				<input type="email" id="email" name="email" placeHolder="Email" class="form-control" />	
			</div>
			<div class="form-group">
				<label for="phone">Phone Number: </label>
				<input type="phone" id="phone" name="phone" placeHolder="Phone Number (Optional)" class="form-control" />	
			</div>
			<div class="form-group">
  				<label for="fitnessGoal">Select Fitness Goal:</label>
  				<select class="form-control" name="fitnessGoal">
    					<option value="maintain weight">Maintain Weight</option>
    					<option value="lose weight">Lose Weight</option>
    					<option value="gain weight">Gain Weight</option>
  				</select>
			</div> 
			<div class="form-group">
				<label for="picture">Select avatar:</label>
				<div>
  				<label class="radio-inline">
  					<input type="radio" name="picture" value="maleImg.png"><img src="../img/maleImg.png" style="height: 150px">
  					<input type="radio" name="picture" value="femaleImg.png"><img src="../img/femaleImg.png" style="height: 150px">
  				</label>
  				</div>
			</div>
			<button type="submit" class="btn btn-default">Create User</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form>
		
<c:import url="/WEB-INF/jsp/footer.jsp" />