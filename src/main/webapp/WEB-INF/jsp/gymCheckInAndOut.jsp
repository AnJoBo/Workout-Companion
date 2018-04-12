<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@ include file="include/header.jspf"%>


<%-- <p>Hello, <c:out value="${currentUser.userName}" /></p> --%>



<a href="${userUpdate}"><button>Update Profile</button></a>


<div class="test" >
if(userdoesnthaveacheck_ininthedatabse){
// tell the datebase to check you in and show the check in button

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
} else {
<a href="${userUpdate}"><button>Update Profile</button></a>
// if the user is logged in show this button so they can check out
</div>


<%@ include file="include/footer.jspf"%>
