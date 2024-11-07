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
            border-color: #007bff;
        }
        .table-container {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .btn {
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #007bff;
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
        <div class="col-md-4">
            <div class="card point-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Add Doctor</p>

                    <!-- Success or Error Messages -->
                    <c:if test="${not empty errorMsg}">
                        <div class="error-msg">${errorMsg}</div>
                        <c:remove var="errorMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <div class="success-msg">${succMsg}</div>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <!-- Form to Add Doctor -->
                    <form action="../addDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="fullname" id="fullname" required class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input type="date" name="dob" id="dob" required class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input type="text" name="qualification" id="qualification" required class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" id="spec" class="form-control" required>
                                <option value="">-- Select --</option>  <!-- Set value as empty for "Select" option -->
                                <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                %>
                                <option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
                                <% } %>
                            </select>

                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" id="email" required class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mobile No</label>
                            <input type="text" name="mobno" id="mobno" required class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" id="password" required class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Add Doctor</button>
                    </form>

                </div>
            </div>
        </div>

        <!-- Doctor Details Table -->
        <div class="col-md-8">
            <div class="card point-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Doctor Details</p>
                    <div class="table-container">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>DOB</th>
                                <th>Qualification</th>
                                <th>Specialization</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                DoctorDao dao1 = new DoctorDao(DBConnect.getConn());
                                List<Doctor> doctorList = dao1.getAllDoctor();
                                for (Doctor d : doctorList) {
                            %>
                            <tr>
                                <td><%= d.getFullName() %></td>
                                <td><%= d.getDob() %></td>
                                <td><%= d.getQualification() %></td>
                                <td><%= d.getSpecialist() %></td>
                                <td><%= d.getEmail() %></td>
                                <td><%= d.getMobNo() %></td>
                                <td>
                                    <a href="#" class="btn btn-sm edit-btn">Edit</a>
                                    <a href="#" class="btn btn-sm delete-btn">Delete</a>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
