<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
<h1>USER PAGE</h1>

<<<<<<< HEAD
<p> flash attr: <c:out value="${message}"/> </p>
=======
<c:out value="${message}" />
>>>>>>> f60ceb954b9241c164f498f45363ea13006bee7c

<p>Hello, <c:out value="${currentUser.userName}" /></p>
<p>Your email: <c:out value="${currentUser.email}" /></p>
<p>Your phone number: <c:out value="${currentUser.phone}" /></p>

<c:url var="userUpdate" value="/userUpdate/${currentUser.userName}" />
<a href="${userUpdate}"><button>Update Profile</button></a>

<c:import url="/WEB-INF/jsp/footer.jsp" />