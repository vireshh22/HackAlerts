<%@page import="com.hackalerts.entities.Message"%>
<%@page import="com.hackalerts.entities.User"%>
<%@page errorPage="Error_Page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile</title>
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

        <!--main body-->
        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2">
                        <!--categories-->
                        <ul class="list-group mt-4">
                            <a href="#" onclick="getEvents(0, this)" class="c-link list-group-item list-group-item-action active">All Events</a>
                            <%                                EventDao dao = new EventDao(ConnectionProvider.getConnection());
                                ArrayList<Categories> list1 = dao.getAllCategories();
                                for (Categories c : list1) {

                            %>
                            <a href="#" onclick="getEvents(<%= c.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= c.getName()%></a> 
                            <%
                                }
                            %>

                        </ul>

                    </div>
                    <div class="col-md-10 mt-2">
                        <!--events-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">loading..</h3>
                        </div>

                        <div class="container-fluid" id="events-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>

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
                                    title: "Oops!",
                                    text: "Someone Has Already Added This Event",
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

        <!--loading events using ajax-->
        <script>
            function getEvents(catid, temp) {

                $(".c-link").removeClass('active');

                $.ajax({
                    url: "load_events.jsp",
                    data: {cid: catid},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#events-container').html(data);
                        $(temp).addClass('active');
                    }
                });
            }
            $(document).ready(function () {
                
                let allEventRef = $('.c-link')[0]
                getEvents(0,allEventRef);

            });
        </script>

    </body>
</html>
