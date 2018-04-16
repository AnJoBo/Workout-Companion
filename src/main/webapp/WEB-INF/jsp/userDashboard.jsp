<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jspf"%>

<div class="test container">
	<h1>USER DASHBAORD</h1>

	<div style="display: inline-block; border: 1px solid black;">
<<<<<<< HEAD

		<%-- Message after user update redirect --%>
		<c:if test="${not empty message}">
			<c:out value="${message}" />

			<c:url var="formAction" value="/users/${currentUser.userName}" />
			<form method="POST" action="${formAction}">
				<input type="hidden" name="currentUserId"
					value="${currentUser.userId}" /> <input type="hidden"
					name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input type="submit"
					value="Check In" onClick="return change(this);" />

			</form>

		</c:if>

		<c:forEach var="LogResults" items="${LogResults}">
			<p>
				User Id:
				<c:out value="${LogResults.userId}" />
				Gym Number:
				<c:out value="${LogResults.gymId}" />
				Check In :
				<c:out value="${LogResults.checkIn}" />
				Check Out:
				<c:out value="${LogResults.checkOut}" />
			</p>
		</c:forEach>



		<c:url var="formAction" value="/users/${currentUser.userName}" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="currentUserId"
				value="${currentUser.userId}" /> <input type="hidden"
				name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input type="submit"
				value="Check In" onClick="return change(this);" />
		</form>





		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="well well-sm">
						<div class="row">
							<div class="col-sm-6 col-md-4">

								<c:url var="userImg" value="/img/${currentUser.picture}" />
								<img src="${userImg}" alt="" class="img-rounded img-responsive"
									style="display: block;">


							</div>
							<div class="col-sm-6 col-md-8">
								<h4>
									<c:out value="${currentUser.userName}" />
								</h4>
								<small><cite title="San Francisco, USA">San
										Francisco, USA <i class="glyphicon glyphicon-map-marker">
									</i>
								</cite></small>
								<p>
									<i class="glyphicon glyphicon-envelope"></i>
									<c:out value="${currentUser.email}" />
									<br /> <i class="glyphicon glyphicon-phone"></i>
									<c:out value="${currentUser.phone}" />
									<br /> <i class="glyphicon glyphicon-gift"></i>June 02, 1988
								</p>
								<!-- Split button -->
								<div class="btn-group">
									<button type="button" class="btn btn-primary">Social</button>
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										<span class="caret"></span><span class="sr-only">Social</span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Twitter</a></li>
										<li><a
											href="https://plus.google.com/+Jquery2dotnet/posts">Google
												+</a></li>
										<li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
										<li class="divider"></li>
										<li><a href="#">Github</a></li>


									</ul>
									<br>
									<c:url var="updateLink"
										value="/userUpdate/${currentUser.userName}" />
									<a href="${updateLink}"><button class="btn">Update
											Info</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!--  /////////////////////////////////////////////////// TEST PAGE CODE - DELETE BELOW IF THE PAGE IS NOT WORKING ///////////////////////////////////////////////////////////// -->






		<!-- start content-top -->
		<div class="row content-top">
			<div class="col-md-5">
				<img src="images/pic.png" class="img-responsive" alt="" />
			</div>
			<div class="col-md-7 content_left_text">
				<h3>Lorem ipsum dolor sit!</h3>
				<p>aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
					nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
					ex ea commodo consequat.</p>
			</div>
		</div>
	</div>



<%@ include file="include/lorem.jspf"%>

<%@ include file="include/footer.jspf"%>