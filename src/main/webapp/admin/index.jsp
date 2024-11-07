<%--
  Created by IntelliJ IDEA.
  User: The Networks
  Date: 11/5/2024
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../component/css.jsp"%>
    <style type="text/css">

        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>
    <div class="container p-4">
        <p class="text-center fs-3">Admin DashBoard</p>
        <%
            String successMessage = (String) session.getAttribute("succMsg");
            if (successMessage != null) {
        %>
        <div class="alert alert-success ">
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
        <div class="alert alert-error text-danger">
            <%= errorMessage %>
        </div>
        <%
                session.removeAttribute("error");
            }
        %>

        <div class="row">
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <li class="fas fa-user-md fa-3x"></li><br>
                        <p class="fs-4 text-center">
                            Doctor <br>5
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <li class="fas fa-user-md fa-3x"></li><br>
                        <p class="fs-4 text-center">
                            User <br>43
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <li class="fas fa-user-md fa-3x"></li><br>
                        <p class="fs-4 text-center">
                            Total Appointment <br>453
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card point-card" data-bs-toggle="modal"
                     data-bs-target="#exampleModal">
                    <div class="card-body text-center text-success">
                        <li class="fas fa-user-md fa-3x"></li><br>
                        <p class="fs-4 text-center">
                            Specialist <br>34
                        </p>
                    </div>
                </div>
            </div>


        </div>
    </div>



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../addSpecialist" method="post">
                            <div class="from-group">
                                <label>Enter Specialist Name</label>
                                <input type="text" name="specName" class="form-control">
                            </div>

                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
