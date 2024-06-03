<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Username Form</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      max-width: 400px;
      margin: 100px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group input[type="text"] {
      border: none;
      border-bottom: 2px solid #007bff;
      border-radius: 0;
      box-shadow: none;
      outline: none;
    }
    .form-group input[type="text"]:focus {
      box-shadow: none;
      border-color: #007bff;
    }
    .btn-submit {
      background-color: #007bff;
      border: none;
      border-radius: 20px;
      padding: 10px 20px;
      color: #fff;
      cursor: pointer;
    }
    .btn-submit:hover {
      background-color: #0056b3;
    }
    h5{
    transfrom:transulate(-50%,-50%);
    text-align:center;
    align-items:center;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="form-container">
    <h5>Enter Your Username</h5>
    <form method="get" action="Forgot">
      <div class="form-group">
        <input type="text" class="form-control" name="username" placeholder="Enter your username">
      </div>
      <button type="submit" class="btn btn-submit btn-block">Submit</button>
    </form>
  </div>
</div>

</body>
</html>
