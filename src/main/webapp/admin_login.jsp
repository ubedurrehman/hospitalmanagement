<%--
  Created by IntelliJ IDEA.
  User: The Networks
  Date: 11/5/2024
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login Page</title>
    <%@ include file="component/css.jsp" %> <!-- Including CSS -->
    <style type="text/css">

        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>

<%@ include file="component/navbar.jsp" %> <!-- Including Navbar -->

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow-lg" style="width: 100%; max-width: 400px;">
        <div class="card-body">
            <h3 class="text-center mb-4"><i class="fa-solid fa-user-lock"></i> Admin Login</h3>

            <form action="adminLogin" method="post">
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input type="email" class="form-control"  name="email" placeholder="Enter your username" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit" class="btn btn-success w-100">Login</button>
                <button type="submit" class="btn btn-success w-100">Login</button>
            </form>

        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
