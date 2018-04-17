<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jspf"%>

<div class="container">

	<h1>USER DASHBAORD</h1>

	<div style="display: inline-block; border: 0px solid black;">

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

	<h1>

		<c:url var="formAction" value="/users/${currentUser.userName}" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="currentUserId"
				value="${currentUser.userId}" /> <input type="hidden"
				name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input type="submit" class="btn btn-primary"
				value="Gym Check In" onClick="return change(this);" />
		</form>
	</h1>

	<div style="display: inline-block; border: 0px solid black;">


		<%-- Message after user update redirect --%>
		<c:if test="${not empty message}">
			<c:out value="${message}" />
		</c:if>
		
		<div class="">
			<div class="">
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
								<!-- Update Button -->
								<div class="btn-group">
									<c:url var="updateLink" 
										value="/userUpdate/${currentUser.userName}" />
									<a href="${updateLink}"><button class="btn btn-primary">Update
											Info</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- start content-top -->
		<div class="row content-top">
			<div class="col-md-5">
				<img src="images/pic.png" class="img-responsive" alt="" />
			</div>
			<div class="content_left_text">
				<h3>Welcome, 
				<c:out value="${currentUser.userName}" />
				!</h3>
				<p><i>"The last three or four reps is what makes the muscle grow. 
				This area of pain divides the champion from someone else who is not a champion. 
				That's what most people lack, having the guts to go on and just say they'll go through the pain no matter what happens."</i> 
				-Arnold Schwarzenegger</p>
			</div>
		</div>
	</div>
</div>


<%@ include file="include/lorem.jspf"%>

<%@ include file="include/footer.jspf"%>