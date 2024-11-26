<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Validation</title>
  <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body">
          <form onsubmit="return validate()" novalidate action="" method="post">
            <h3>Register here</h3>

            <!-- Name Field -->
            <div class="form-group">
              <label>Name</label>
              <input type="text" class="form-control name-field" placeholder="Enter Your Name">
              <small class="name-field-msg form-text text-danger ml-2"></small>
            </div>

            <!-- Email Field -->
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="email-field form-control" placeholder="Enter Your Email">
              <small class="email-field-msg form-text text-danger"></small>
            </div>

            <!-- Password Field -->
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="password-field form-control" placeholder="Enter Your Password">
              <small class="password-field-msg form-text text-danger"></small>
            </div>

            <!-- Phone Field -->
            <div class="form-group">
              <label>Phone</label>
              <input type="text" class="phone-field form-control" placeholder="Enter Your Phone Number">
              <small class="phone-field-msg form-text text-danger"></small>
            </div>

            <button type="submit" class="btn btn-primary w-100">Add Doctor</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  function validate() {
    let valid = true;

    $('.form-text.text-danger').html('');


    // Name validation
    let name = $(".name-field").val();
    if (name == '' || name == undefined) {
      $('.name-field-msg').html('Name is required')
              .addClass("text-danger");

    }else{
      $('.name-field-msg').html('ok..!!!!')
              .removeClass('text-danger')
              .addClass("text-success");


      f=true;
    }



    return valid;  // If any validation fails, return false to prevent form submission
  }
</script>

</body>
</html>
