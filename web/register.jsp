<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="css/links.jsp" %>
    </head>
    <body>
        <%@include file="reusable/navbar.jsp" %>

        <main class="d-flex align-items-center" style="height: 110vh">
            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <div class="card-header text-center"style="background: #FFDE59;color: white;">
                            <span class="fa-solid fa-user-plus fa-2x"></span>
                            <br>
                            <p style="font-size: 28px; font-weight: bold">Register Here</p>
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="post" id="reg-form">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="clg_name">College Name</label>
                                    <input type="text" name="user_clg" class="form-control" id="clg_name" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="form-group form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa-solid fa-arrows-rotate fa-spin fa-2x"></i></span>
                                    <h4>Please Wait..</h4>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" id="submit-btn" class="btn" style="background: #FFDE59; color: white">Register</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer" style="background: #FFDE59;color: white"></div>
                    </div>
                </div>
            </div>
        </main>


        <%@include file="js/js_links.jsp" %>
        <script>
            $(document).ready(function () {
                console.log("loaded");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault(); //servlet pe nahi jayega
                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();


                    //send to registerServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done') {

                                Swal.fire({
                                    title: "Done!",
                                    text: "Registered Successfully.. We are redirecting to login page",
                                    icon: "success"
                                }).then((result) => {
                                    // Redirect to a new page
                                    window.location.href = "login.jsp";
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: data,
                                    icon: "error"
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $('submit-btn').show();
                            $('loader').hide();
                            Swal.fire({
                                title: "Error",
                                text: "Something Went Wrong",
                                icon: "error"
                            });
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
