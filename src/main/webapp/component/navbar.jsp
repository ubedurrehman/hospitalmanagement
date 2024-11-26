<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa-solid fa-house-medical"></i> MEDI HOME
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">


                <c:if test="${empty userObj }">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="admin_login.jsp">
                            <i class="fa-solid fa-right-to-bracket"></i> ADMIN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="">APPOTTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a>
                    </li>

                </c:if>

                <!-- Only display these links if userObj is present (i.e., user is logged in) -->
                <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="">APPOINTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="">VIEW APPOINTMENT</a>
                    </li>
                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i> ${userObj.fullName}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </div>


                </c:if>

            </ul>
        </div>
    </div>
</nav>
<%--<style>--%>
<%--    /* Navbar Styling */--%>
<%--    .navbar {--%>
<%--        background-color: #28a745 !important; /* Custom green color */--%>
<%--        border-bottom: 3px solid #007b33; /* Darker green border */--%>
<%--        transition: background-color 0.3s ease; /* Smooth background transition */--%>
<%--    }--%>

<%--    .navbar-brand {--%>
<%--        font-size: 1.5rem;--%>
<%--        font-weight: bold;--%>
<%--    }--%>

<%--    /* Navbar items - Links */--%>
<%--    .navbar-nav .nav-item .nav-link {--%>
<%--        color: #ffffff !important;--%>
<%--        font-size: 1rem;--%>
<%--        padding: 0.5rem 1rem;--%>
<%--        text-transform: uppercase;--%>
<%--        font-weight: 500;--%>
<%--        transition: color 0.3s ease;--%>
<%--    }--%>

<%--    /* Hover effect for navbar links */--%>
<%--    .navbar-nav .nav-item .nav-link:hover {--%>
<%--        color: #f1f1f1 !important;--%>
<%--        text-decoration: underline;--%>
<%--    }--%>

<%--    /* Active link style */--%>
<%--    .navbar-nav .nav-item .nav-link.active {--%>
<%--        color: #ffc107 !important;--%>
<%--        font-weight: bold;--%>
<%--    }--%>

<%--    /* Dropdown button styling */--%>
<%--    .dropdown-toggle {--%>
<%--        color: #28a745 !important;--%>
<%--        font-weight: 600;--%>
<%--    }--%>

<%--    .dropdown-menu {--%>
<%--        background-color: #ffffff;--%>
<%--        border: 1px solid #28a745;--%>
<%--    }--%>

<%--    .dropdown-item {--%>
<%--        color: #28a745;--%>
<%--        padding: 8px 16px;--%>
<%--    }--%>

<%--    .dropdown-item:hover {--%>
<%--        background-color: #f1f1f1;--%>
<%--        color: #28a745;--%>
<%--    }--%>

<%--    /* Mobile/Responsive Navbar */--%>
<%--    @media (max-width: 991px) {--%>
<%--        .navbar-nav {--%>
<%--            margin-top: 1rem;--%>
<%--        }--%>
<%--    }--%>
<%--</style>--%>