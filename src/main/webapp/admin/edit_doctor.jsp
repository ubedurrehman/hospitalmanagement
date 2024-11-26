<%@ page import="com.example.dao.SpecialistDao" %>
<%@ page import="com.example.db.DBConnect" %>
<%@ page import="com.example.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.DoctorDao" %>
<%@ page import="com.example.entity.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Doctor Management</title>
    <%@ include file="../component/css.jsp" %>
    <style type="text/css">
        body {
            background-color: #f7f9fc;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container-fluid {
            padding: 30px;
        }
        .point-card {
            border-radius: 8px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            background-color: #fff;
        }
        .card-body {
            padding: 20px;
        }
        .form-label {
            font-weight: 600;
            color: #333;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #CCCCFF;
        }
        .table-container {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table thead {
            background-color:#CCCCFF;
            color: white;
        }
        .btn {
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #CCCCFF;
            color: white;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .edit-btn, .delete-btn {
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 5px;
            text-decoration: none;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .edit-btn:hover {
            background-color: #218838;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .fs-3 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
        }
        .error-msg, .success-msg {
            padding: 10px;
            margin-bottom: 10px;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
        }
        .error-msg {
            background-color: #f8d7da;
            color: #721c24;
        }
        .success-msg {
            background-color: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container-fluid">
    <div class="row">

        <!-- Add Doctor Form -->
        <div class="col-md-4 offset-md-4">
            <div class="card point-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Edit Doctor</p>

                    <!-- Success or Error Messages -->
                    <%
                        String successMessage = (String) session.getAttribute("succMsg");
                        if (successMessage != null) {
                    %>
                    <div class="alert alert-success text-center fs-3">
                        <%= successMessage %>
                    </div>
                    <%
                            session.removeAttribute("succMsg");
                        }
                    %>


                    <%
                        String errorMessage = (String) session.getAttribute("errorMsg");
                        if (errorMessage != null) {
                    %>
                    <div class="alert alert-danger">
                        <%= errorMessage %>
                    </div>
                    <%
                            session.removeAttribute("errorMsg");
                        }
                    %>

                    <%
                        int id=Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2=new DoctorDao(DBConnect.getConn());
                        Doctor d=dao2.getDoctorById(id);
                    %>

                    <!-- Form to Add Doctor -->
                    <form action="../updatedoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="fullname" id="fullname" required class="form-control" value="<%=d.getFullName()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input type="date" name="dob" id="dob" required class="form-control" value="<%=d.getDob()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input type="text" name="qualification" id="qualification" required class="form-control" value="<%=d.getQualification()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" value="<%=d.getSpecialist()%>"></label>
                            <select name="spec" id="spec" class="form-control" required>
                                <option value="">-- Select --</option>
                                <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                %>

                                <option value="<%= s.getSpecialistName() %>"></option>
                                <% } %>
                            </select>

                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" id="email" required class="form-control" value="<%=d.getEmail()%>">
                            <div id="email-error" style="color: red; display: none;">Please enter a valid email address.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mobile No</label>
                            <input type="text" name="mobno" id="mobno" required class="form-control" value="<%=d.getMobNo()%>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="text" name="password" id="password" required class="form-control"value="<%=d.getPassword()%>">
                        </div>
                        <input type="hidden" name="id" value="<%=d.getId()%>">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>

                </div>
            </div>
        </div>


    </div>
</div>

<script>
    // Form submission ke liye custom validation
    document.querySelector("form").addEventListener("submit", function(event) {
        var emailInput = document.getElementById("email");
        var emailError = document.getElementById("email-error");

        // Regular expression for basic email validation
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        // Agar email valid nahi hai
        if (!emailRegex.test(emailInput.value)) {
            emailError.style.display = "block";
            event.preventDefault(); // Form ko submit hone se rokna
        } else {
            emailError.style.display = "none";
        }
    });
</script>
</body>
</html>
