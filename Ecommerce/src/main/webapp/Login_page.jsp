<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Custom styles */
        .show-password-btn {
            cursor: pointer;
        }
        .btnnn{
        margin-left:15%;
         width:70%;
         margin-bottom:5px; 
        }
        .center{
        display:flex;
        justify-content:center;
        }
        a .pass{
        justify-content:center;
        align-items:center;
        margin-bottom:50px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="login.jsp" method="post">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="name">
                        </div>
                        <div class="form-group">
                            <label for="password" >Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary show-password-btn" type="button" onclick="togglePassword()">Show</button>
                                </div>
                            </div>
                        </div>
                        <a href="forgotpass.jsp" class="pass">Forget Username/Password?</a>
                        <button type="submit" class="btn btnnn btn-primary">Login</button>
                        <div class="center">Don't have an account?<a href="registraton_page.html">Register here</a></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JavaScript -->
<script>
    function togglePassword() {
        var passwordField = document.getElementById("password");
        if (passwordField.type === "password") {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    }
</script>
</body>
</html>
