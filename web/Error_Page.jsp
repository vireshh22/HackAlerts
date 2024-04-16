<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry</title>
        
        <%@include file="css/links.jsp" %>
    </head>
    <body>
        
        <div class="container text-center">
            <br>
            <img src="images/error.png" class="img-fluid" style="height: 380px; width: 400px">
            <br>
            <h3 class="mt-2">Sorry! Something Went Wrong...</h3>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn btn-lg text-white mt-3" style="background: #FFDE59">Home</a>
        </div>
    </body>
</html>
