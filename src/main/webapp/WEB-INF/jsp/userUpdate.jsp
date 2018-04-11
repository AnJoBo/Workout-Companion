<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

UPDATE PAGE


<script type="text/javascript">
	$(document).ready(function () {
		$("#changePasswordForm").validate({
			rules : {
				password : {
					required : true
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>


<h2>Change Password</h2>

<p id="currentUser">Current User: ${currentUser.userName}</p>

<c:url var="formAction" value="/userUpdate/${currentUser.userName}" />

<div class="row">
	<div class="col-md-5">
		<form action="${formAction}" method="POST">
<<<<<<< HEAD
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
=======
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<input type="hidden" name="userName" value="${currentUser.userName}"/>
>>>>>>> f60ceb954b9241c164f498f45363ea13006bee7c
			<div class="form-group">
				<label for="password">New Password: </label>
				<input type="password" id="password" name="password" class="form-control" />	
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" />	
			</div>
			<button type="submit" class="btn btn-default">Change Password</button>
		</form>
	</div>

	<div class="col-md-9"></div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />