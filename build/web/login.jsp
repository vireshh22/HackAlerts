<%@page import="com.hackalerts.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="css/links.jsp" %>
    </head>
    <body>
        <!--navbar-->
        <%@include file="reusable/navbar.jsp" %>

        <!--form design-->
        <main class="d-flex align-items-center" style="height: 80vh"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-4">

                        <div class="card">
                            <div class="card-header text-center" style="background: #FFDE59; color: white">
                                <span class="fa-solid fa-user-tag fa-2x"></span>
                                <br>
                                <p style="font-size: 28px; font-weight: bold">Login Here</p>
                            </div>

                            <%
                                Message msg = (Message) session.getAttribute("msg");
                                if (msg != null) {
                            %>

                            <div class="alert <%= msg.getCssClass()%> fade show" role="alert">
                                <%= msg.getContent()%>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <%
                                    session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" required class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn" style="background: #FFDE59; color: white">Login</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer" style="background: #FFDE59; color: white"></div>
                        </div>

                    </div>
                </div>
            </div>
        </main>

        <%@include file="js/js_links.jsp" %>
    </body>
</html>
