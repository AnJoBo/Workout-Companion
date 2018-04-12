<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jspf"%>


<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

<h1>USER PAGE.JSP</h1>

<c:out value="${message}" />

<c:url var="userImg" value="/img/${currentUser.picture}" />
<img src="${userImg}">
<p>
	Hello,
	<c:out value="${currentUser.userName}" />
</p>
<p>
	Your email:
	<c:out value="${currentUser.email}" />
</p>
<p>
	Your phone number:
	<c:out value="${currentUser.phone}" />
</p>
<p>
	Fitness Goal:
	<c:out value="${currentUser.fitnessGoal}" />
</p>


<%@ include file="include/footer.jspf"%>