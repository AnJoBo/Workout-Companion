<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jspf"%>

<h1>USER DASHBAORD</h1>

<%-- Message after user update redirect --%>
<c:if test="${not empty message}">
	<div style="display: inline-block; border: 1px solid black;">
		<c:out value="${message}" />
	</div>
</c:if>

<input type="hidden" name="currentUserId" value="${currentUser.userId}" />


<div class="test">

	<div class="header-text">
	
		<div class="header-text h2">
			<c:url var="userImg" value="/img/${currentUser.picture}" />
			<img src="${userImg}" style="display: block;">
			<p>
				<c:out value="${currentUser.userName}" />
			</p>
		</div>

		<div class="user-page-info">
			<ul class="ul.a">
				<li>Your email: <c:out value="${currentUser.email}" />
				</li>
				<li>Your phone number: <c:out value="${currentUser.phone}" />
				</li>
				<li>Fitness Goal: <c:out value="${currentUser.fitnessGoal}" />
				</li>
			</ul>
			<c:url var="updateLink" value="/userUpdate/${currentUser.userName}" />
			<a href="${updateLink}"><button class="btn">Update Info</button></a>
		</div>

		<c:url var="formAction" value="/users/${currentUser.userName}" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="currentUserId"
				value="${currentUser.userId}" /> <input type="hidden"
				name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input type="submit"
				value="Check In" onClick="return change(this);" />
		</form>
		
	</div>
	
</div>

<%@ include file="include/lorem.jspf"%>

<%@ include file="include/footer.jspf"%>