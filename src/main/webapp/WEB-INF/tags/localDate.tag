<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="pattern" required="false" type="java.lang.String" %>
<%@ attribute name="date" required="true" type="java.time.LocalDate" %>

<c:if test="${empty pattern}">
	<c:set var="pattern" value="MM/dd/yyyy" />
</c:if>

<fmt:parseDate value="${date}" pattern="yyy-MM-dd" var="parsedDate" type="date"/>
<fmt:formatDate value="${parsedDate}" type="date" pattern="${pattern}"/>
