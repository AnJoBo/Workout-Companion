<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>

<%-- Message after user create redirect --%>
<c:if test="${not empty message}">
	<div style="display: inline-block; border: 0px solid black;">
		<c:out value="${message}" />
	</div>
</c:if>

<div class="main">
	<div class="login_top">
		<div class="container">
			<div class="col-md-6">
				<div class="login-page">
				
					<h4 class="title">New Customers</h4>
					
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat. Duis autem vel eum iriure dolor in hendrerit in
						vulputate velit esse molestie consequat, vel illum dolore eu
						feugiat nulla facilisis</p>
						
					<div class="button1">
						<c:url var="newUserUrl" value="/users/new"/>
			  		 <a href="${newUserUrl}"><input type="submit" name="Submit"  value="Create an Account"></a>
			
					</div>
					
					<div class="clear"></div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="login-page">
					<div class="login-title">
					
						<h4 class="title">Registered Customers</h4>
						
						<div id="loginbox" class="loginbox">
							<c:url var="formAction" value="/home" />
							<form method="POST" action="${formAction}">
							
								<input type="hidden" name="destination" value="${param.destination}" /> 
								<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
								
								<div class="form-group">
									<label for="userName">User Name: </label> 
									<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
								</div>
								
								<div class="form-group">
									<label for="password">Password: </label> 
									<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
								</div>
								
								<button type="submit" class="btn btn-default">Login</button>
							</form>
						</div>
					</div>
				</div>
				
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="include/footer.jspf"%>