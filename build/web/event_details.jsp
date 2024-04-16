<%@page import="com.hackalerts.dao.UserDao"%>
<%@page import="com.hackalerts.entities.Message"%>
<%@page import="com.hackalerts.entities.Events"%>
<%@page import="com.hackalerts.dao.EventDao"%>
<%@page import="com.hackalerts.helper.ConnectionProvider"%>
<%@page import="com.hackalerts.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    int eventID = Integer.parseInt(request.getParameter("event_id"));
    EventDao dao = new EventDao(ConnectionProvider.getConnection());
    Events e = dao.getEventByEventId(eventID);
%>

<%

    UserDao d = new UserDao(ConnectionProvider.getConnection());
    User u = d.getUserByID(e.getUserID());
    String name1 = u.getName();
                String[] nameSurname1 = name1.split(" ");
                String pName1 = "";
                if (nameSurname1.length > 1) {
                    char n1 = nameSurname1[0].charAt(0);
                    char n2 = nameSurname1[nameSurname1.length-1].charAt(0);
                    pName1 += String.valueOf(n1).toUpperCase();
                    pName1 += String.valueOf(n2).toUpperCase();
                }
                else{
                    char n1 = nameSurname1[0].charAt(0);
                    pName1 += String.valueOf(n1).toUpperCase();
                }
%>

<%

    int cat = e.getCid();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= e.getEtitle()%> | | HackAlerts</title>

        <%@include file="css/links.jsp" %>
    </head>
    <body>

        <%@include  file="reusable/Profile_Navbar.jsp" %>
        <%            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>

        <div class="alert <%= msg.getCssClass()%> fade show text-center" role="alert">
            <%= msg.getContent()%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>

        <!--profile modal-->
        <%@include file="reusable/profileModal.jsp" %>

        <!--events modal-->
        <%@include file="reusable/eventModal.jsp" %>


        <!--in details event information-->

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="row">
                        <div class="col-md-5 p-0">
                            <div class="card border-right-0 pl-0" style="width: 100%;">
                                <div class="card-header pb-0">
                                    <div class="row">
                                        <div class="col-2 text-center mt-2">
                                            <div>
                                                <a class="text-center" href="#" title="Profile" style="display:flex;width:40px;height: 40px;justify-content: center;align-items: center;color:white;background: #FFDE59;border-radius: 50%;font-weight: bold;font-size: 16px;"><%= pName1 %></a>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <p style="font-weight: bold"><%= u.getName() %></p>
                                            <!--<hr>-->
                                            <p class="text-muted">Posted on <%= e.getPostedDate() %></p>
                                        </div>
                                    </div>

                                </div>

                                <div class="card-body" style="height: 384px;">
<!--                                    <div>
                                        <p style="font-weight: bold">Category: <%= e.getCid() %></p>
                                    </div>-->
                                    <div>
                                        <p style="font-weight: bold">Held At: <br><%= e.getClgName() %></p>
                                    </div>
                                    <div>
                                        <p style="font-weight: bold">Event Name: <br><%= e.getEtitle() %></p>
                                    </div>
                                    <div>
                                        <p style="font-weight: bold">Held On: <br><%= e.getEdate() %></p>
                                    </div>
                                    <br>
                                    <div>
                                        <p class="mb-0"><a href="<%= e.getLocation()%>" style="text-decoration: none">Location</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-7 p-0">
                            <div class="card border-left-0 pl-0" style="width: 100%;">
                                <div class="text-center" style="height: 391px; overflow: hidden;">
                                    <img src="Brochures/<%= e.getEpic()%>" class="card-img-top" style="max-height: 370px; width: auto;" alt="...">
                                </div>
                                <div class="card-body">
                                   <div class="row mt-2">
                                        <div class="col-6">
                                            <a href="<%= e.getRegLink() %>" style="text-decoration: none">Registration Link</a>
                                        </div>
                                        <div class="col-6 text-right">
                                            <a href="Brochures/<%= e.getEpic() %>" download class="btn" style="background: #FFDE59; color: white">Download Brochure</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>







        <!--javascript-->
        <%@include file="js/js_links.jsp" %>
        <script>
            $(document).ready(function () {

                let editStatus = false;

                $('#edit-profile-btn').click(function () {
                    if (editStatus == false) {

                        $('#profile-details').hide();

                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back")
                    } else {
                        $('#profile-details').show();

                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("EDIT");
                    }
                });
            });
        </script>

        <!--add event js-->
        <script>
            $(document).ready(function () {

                $('#add-events-form').on("submit", function (event) {
                    //this code gets called when form gets submitted
                    event.preventDefault();
                    console.log("done");
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddEventServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() === 'done') {
                                Swal.fire({
                                    title: "Done!",
                                    text: "Event Added Successfully..",
                                    icon: "success"
                                });
                            } else {
                                Swal.fire({
                                    title: "Error",
                                    text: "Something Went Wrong!",
                                    icon: "error"
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            Swal.fire({
                                title: "Error",
                                text: "Something Went Wrong!",
                                icon: "error"
                            });
                        },
                        processData: false,
                        contentType: false
                    });

                });

            });
        </script>


        <%@include file="js/js_links.jsp" %>
    </body>
</html>
