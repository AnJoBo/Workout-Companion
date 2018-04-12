<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jspf"%>



<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
<input type="hidden" name="destination" value="${param.destination}" />

<h1>Gym Check-In/Check-Out</h1>



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

<c:url var="userUpdate"
	value="/gymCheckInAndOut/${currentUser.userName}" />
<a href="${userUpdate}"><button>Update Profile</button></a>

<%@ include file="include/footer.jspf"%>
