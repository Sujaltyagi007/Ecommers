<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container-fluid">
  <div class="row justify-content-start">
    <div class="col-3">
<div class="list-group">
  <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
    Menu
  </button>
  <a href="#" target="inf" class="list-group-item list-group-item-action">Details</a>
  <button type="button" class="list-group-item list-group-item-action">Sales</button>
  <button type="button" class="list-group-item list-group-item-action">Out of Stocks</button>
  <button type="button" class="list-group-item list-group-item-action" disabled>Delete products</button>
</div>
    </div>
    <div class="col-9">
     <iframe src="sellerinfo.jsp"  name="inf" width="100%" height="500px" style="border:none;">
</iframe>
    </div>
  </div>
  
  
</div>


</body>
</html>
  
