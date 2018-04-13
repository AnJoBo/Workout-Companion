<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%@ include file="include/header.jspf"%>


<%-- <p>Hello, <c:out value="${currentUser.userName}" /></p> --%>




<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
<input type="hidden" name="destination" value="${param.destination}" />

<h1>Gym Check-In/Check-Out</h1>
<p>
	Hello,
	<c:out value="${currentUser.userName}" />
</p>

<%-- <c:url var="userUpdate"value="/gymCheckInAndOut/${currentUser.userName}" />

<a href="${userUpdate}"><button>Update Profile</button></a>
} else {
<a href="${userUpdate}"><button>Update Profile</button></a>
// if the user is logged in show this button so they can check out
</div> --%>



<c:url var="userUpdate"
	value="/gymCheckInAndOut/${currentUser.userName}" />
<form method="POST" action="${userUpdate}">

	<label for="pickabutton"> Select Fahrenheit or Celsius</label> <select
		name="checkIn" id="checkIn">
		<c:choose>
			<c:when test="${checkIn== true}">
				<input type="password" id="password" name="Check In" />
				<input type="submit" value="submit" />
			</c:when>
		</c:choose>
		<!-- <option value="true">Check In</option>
		<option value="false">Check Out</option>

	</select> <input type="submit" value="submit" /> -->
</form>


<%@ include file="include/footer.jspf"%>
