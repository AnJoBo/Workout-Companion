<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
<h1>USER PAGE</h1>

<p> flash attr: ${message} </p>

<p>Hello, <c:out value="${currentUser.userName}" /></p>

<c:url var="userUpdate" value="/users/${currentUser.userName}/userUpdate" />
<a href="${userUpdate}"><button>Update Profile</button></a>

<c:import url="/WEB-INF/jsp/footer.jsp" />