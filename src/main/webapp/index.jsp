<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.db.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Hospital Management</title>
    <%@include file="component/css.jsp"%>


    <style type="text/css">
        .point-card{
            box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
        }
    </style>
    <style type="text/css">

        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
        }
    </style>

</head>

<body>
    <%@include file="component/navbar.jsp"%>
    <% Connection connection= DBConnect.getConn();
    out.print(connection);
    %>

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/hospital.jpg" class="d-block w-100" alt="..." height="700px">
            </div>
            <div class="carousel-item">
                <img src="img/doctr4.jpeg" class="d-block w-100" alt="..." height="800px">
            </div>
            <div class="carousel-item">
                <img src="img/Hospital-Ma.jpg" class="d-block w-100" alt="..." height="800px">
            </div>
            <div class="carousel-item">
                <img src="img/hospital-CRM.jpg" class="d-block w-100" alt="..." height="900px">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="container p-5">
        <p class="text-center fs-2">Key Features of Our Hospital</p>
        <div class="row">
            <!-- Features Section -->
            <div class="col-md-8">
                <div class="row">
                    <!-- Feature 1: 100% Safety -->
                    <div class="col-md-6 mb-4">
                        <div class="card feature-card">
                            <div class="card-body">
                                <p class="fs-5 fw-bold">100% Safety</p>
                                <p>We prioritize the safety and well-being of our patients with advanced safety protocols and regular check-ups.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Feature 2: Clean Environment -->
                    <div class="col-md-6 mb-4">
                        <div class="card feature-card">
                            <div class="card-body">
                                <p class="fs-5 fw-bold">Clean Environment</p>
                                <p>Our hospital is equipped with the latest sanitization tools, maintaining a sterile and clean environment.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Feature 3: Friendly Doctors -->
                    <div class="col-md-6 mb-4">
                        <div class="card feature-card">
                            <div class="card-body">
                                <p class="fs-5 fw-bold">Friendly Doctors</p>
                                <p>Our doctors are highly trained and approachable, ensuring a comfortable environment for all patients.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Feature 4: Medical Research -->
                    <div class="col-md-6 mb-4">
                        <div class="card feature-card">
                            <div class="card-body">
                                <p class="fs-5 fw-bold">Medical Research</p>
                                <p>Our hospital engages in continuous medical research to improve treatment techniques and patient care.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-4 d-flex justify-content-center align-items-center my-2">
                <img alt="Doctors" src="img/doctors.png" class="img-fluid" height="300px" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            </div>

        </div>
    </div>

    <hr>

    <div class="container p-2">
        <p class="text-center fs-2">Our Team</p>
        <div class="row">
            <div class="col-md-3">
                <div class="card point-card">
                    <div class="card-body text-center">
                        <img src="img/mehdi.jpg" width="250" height="300">
                        <p class="fw-bold fs-5">Mehdi Raza</p>
                        <p class="fs-7">(CEO & Chairman)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card point-card">
                    <div class="card-body text-center">
                        <img src="img/azhr.webp" width="250" height="300">
                        <p class="fw-bold fs-5">Azhar Hussain</p>
                        <p class="fs-7">(Chief Doctor)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card point-card">
                    <div class="card-body text-center">
                        <img src="img/sirj.png" width="250" height="300">
                        <p class="fw-bold fs-5">Siraj Ahmed </p>
                        <p class="fs-7">(Chief Doctor)</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card point-card">
                    <div class="card-body text-center">
                        <img src="img/zohaib.jpg" width="250" height="300">
                        <p class="fw-bold fs-5">Zohaib </p>
                        <p class="fs-7">(Chief Doctor)</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

<%@include file="component/footer.jsp"%>


</body>
</html>