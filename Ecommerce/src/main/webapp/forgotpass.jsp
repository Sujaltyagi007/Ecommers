<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "segoe ui", verdana, helvetica, arial, sans-serif;
  font-size: 16px;
  transition: all 500ms ease; }

body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
  -moz-font-feature-settings: "liga" on; }

.row {
  background-color: rgba(20, 120, 200, 0.6);
  color: #fff;
  text-align: center;
  padding: 2em 2em 0.5em;
  width: 90%;
  margin: 2em	auto;
  border-radius: 5px; }
  .row h1 {
    font-size: 2.5em; }
  .row .form-group {
    margin: 0.5em 0; }
    .row .form-group label {
      display: block;
      color: #fff;
      text-align: left;
      font-weight: 600; }
    .row .form-group input, .row .form-group button {
      display: block;
      padding: 0.5em 0;
      width: 100%;
      margin-top: 1em;
      margin-bottom: 0.5em;
      background-color: inherit;
      border: none;
      border-bottom: 1px solid #555;
      color: #eee; }
      .row .form-group input:focus, .row .form-group button:focus {
        background-color: #fff;
        color: #000;
        border: none;
        padding: 1em 0.5em; animation: pulse 1s infinite ease;}
    .row .form-group button {
      border: 1px solid #fff;
      border-radius: 5px;
      outline: none;
      -moz-user-select: none;
      user-select: none;
      color: #333;
      font-weight: 800;
      cursor: pointer;
      margin-top: 2em;
      padding: 1em; }
      .row .form-group button:hover, .row .form-group button:focus {
        background-color: #fff; }
      .row .form-group button.is-loading::after {
        animation: spinner 500ms infinite linear;
        content: "";
        position: absolute;
        margin-left: 2em;
        border: 2px solid #000;
        border-radius: 100%;
        border-right-color: transparent;
        border-left-color: transparent;
        height: 1em;
        width: 4%; }
  .row .footer h5 {
    margin-top: 1em; }
  .row .footer p {
    margin-top: 2em; }
    .row .footer p .symbols {
      color: #444; }
  .row .footer a {
    color: inherit;
    text-decoration: none; }

.information-text {
  color: #ddd; }

@media screen and (max-width: 320px) {
  .row {
    padding-left: 1em;
    padding-right: 1em; }
    .row h1 {
      font-size: 1.5em !important; } }
@media screen and (min-width: 900px) {
  .row {
    width: 50%; } }

</style>
<body>
<form action="Forgot" method="POST">
<!-- https://api.web3forms.com/submit -->
    <input type="hidden" name="access_key" value="4416d1da-a6ca-47c5-856f-a639e7db8c9e	">
	<div class="row">
		<h1>Forgot Password</h1>
		<h6 class="information-text">Enter your registered email to reset your password.</h6>
		<div class="form-group">
			<input type="email" name="email" id="user_email">
			<p><label for="username">Email</label></p>
			<button onclick="showSpinner()">Reset Password</button>
		</div>
		<div class="footer">
			<h5>Go to Login?<a href="#">Login Page</a></h5>
		</div>
	</div>	
</form>
<script src="https://web3forms.com/client/script.js" ></script>
</body>
</html>