<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>

<%-- Message after user create failure redirect --%>
<c:if test="${not empty message}">
	<div style="display: inline-block; border: 1px solid black;">
		<c:out value="${message}" />
	</div>
</c:if>

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="row">
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
				<input type="text" id="phone" name="phone" placeHolder="Phone Number (Optional)" class="form-control" />	
			</div>
			<div class="form-group">
  				<label for="fitnessGoal">Select Fitness Goal:</label>
  				<select class="form-control" name="fitnessGoal">
    					<option value="maintain weight">Maintain Weight</option>
    					<option value="lose weight">Lose Weight</option>
    					<option value="gain weight">Gain Weight</option>
  				</select>
			</div> 
		</div>
	</div>
		<div class="row">
			<div class="col-sm-4 col-lg-7">
				<div class="form-group">
					<label for="picture">Select avatar:</label>
					<div>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f00.png"><img src="../img/f00.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f01.png"><img src="../img/f01.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f02.png"><img src="../img/f02.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f03.png"><img src="../img/f03.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f04.png"><img src="../img/f04.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f05.png"><img src="../img/f05.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f06.png"><img src="../img/f06.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="f07.png"><img src="../img/f07.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m00.png"><img src="../img/m00.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m01.png"><img src="../img/m01.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m02.png"><img src="../img/m02.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m03.png"><img src="../img/m03.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m04.png"><img src="../img/m04.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m05.png"><img src="../img/m05.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m06.png"><img src="../img/m06.png" style="height: 150px">
	  				</label>
	  				<label class="radio-inline">
	  					<input type="radio" name="picture" value="m07.png"><img src="../img/m07.png" style="height: 150px">
	  				</label>
  				</div>
			</div>
			<button type="submit" class="btn btn-default">Create User</button>
		</div>
	</div>
</form>
		
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

<%@ include file="include/footer.jspf"%>