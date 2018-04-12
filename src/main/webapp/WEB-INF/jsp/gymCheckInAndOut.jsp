<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
<%-- <input type="hidden" name="destination" value="${param.destination}"/> --%>
<%-- <c:url var="userUpdate" value="/gymCheckInAndOut/${currentUser.userName}" /> --%>
<!-- <h1>USER PAGE</h1> -->

<%-- <p>Hello, <c:out value="${currentUser.userName}" /></p> --%>


<a href="${userUpdate}"><button>Update Profile</button></a>


<div class="test" >
if(userdoesnthaveacheck_ininthedatabse){
// tell the datebase to check you in and show the check in button
<a href="${userUpdate}"><button>Update Profile</button></a>
} else {
<a href="${userUpdate}"><button>Update Profile</button></a>
// if the user is logged in show this button so they can check out
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />