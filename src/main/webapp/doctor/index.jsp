<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Doctor Dashboard</title>
    <%@include file="../component/css.jsp"%>
</head>
<body>

<!-- Check if the doctor object exists in session, if not redirect to login page -->
<c:if test="${empty sessionScope.docObj}">
    <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@ include file="navbar.jsp" %>

<h1>Welcome, Doctor!</h1>

</body>
</html>
