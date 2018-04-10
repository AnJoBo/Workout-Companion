<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>USER PAGE</h1>

<c:out value="${message}" />

<p>Hello, <c:out value="${currentUser.userName}" /></p>

<c:url var="userUpdate" value="/userUpdate/${currentUser.userName}" />
<a href="${userUpdate}"><button>Update Profile</button></a>

<c:import url="/WEB-INF/jsp/footer.jsp" />