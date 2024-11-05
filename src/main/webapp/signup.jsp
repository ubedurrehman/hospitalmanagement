<%--
  Created by IntelliJ IDEA.
  User: The Networks
  Date: 11/5/2024
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%@include file="component/css.jsp"%>
  <style type="text/css">

    body {
      background-color: #f0f8ff;
      font-family: Arial, sans-serif;
    }
  </style>
</head>
<body>
  <%@ include file="component/navbar.jsp" %>
  <div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow-lg" style="width: 100%; max-width: 400px;">
      <div class="card-body">

        <h3 class="text-center mb-4"><i class="fa-solid fa-user-lock"></i> User Register</h3>
        <%
          String successMessage = (String) session.getAttribute("sucMsg");
          if (successMessage != null) {
        %>
        <div class="alert alert-success ">
          <%= successMessage %>
        </div>
        <%
            session.removeAttribute("sucMsg");
          }
        %>

        <%
          String errorMessage = (String) session.getAttribute("errorMsg");
          if (errorMessage != null) {
        %>
        <div class="alert alert-error text-danger">
          <%= errorMessage %>
        </div>
        <%
            session.removeAttribute("error");
          }
        %>


        <form action="user_register" method="get">
          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control"  name="fullname" placeholder="Enter your username" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Email address</label>
            <input type="email" class="form-control"  name="email" placeholder="Enter your username" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
          </div>

          <button type="submit" class="btn btn-success w-100">Register</button>

        </form>

      </div>
    </div>
  </div>


</body>
</html>