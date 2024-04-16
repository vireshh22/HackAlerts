<%@page import="com.hackalerts.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HackAlerts</title>
        <link rel="icon" href="images/l1.png" type="image/x-icon">
        <%@include file="css/links.jsp" %>
    </head>
    <body>
        <%@include file="reusable/navbar.jsp" %> 

        <%@include file="reusable/slider.jsp" %>

        <h2 class="text-center mt-2 mb-2">Features</h2>

        <!--cards-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Explore a Variety of Hackathons Near You</h5>
                            <p class="card-text text-center">"Browse through a diverse range of hackathons, from coding challenges to design sprints, and find the perfect event to showcase your skills and creativity."</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Stay Informed with Personalized Notifications</h5>
                            <p class="card-text">"Receive personalized notifications about hackathons tailored to your preferences. Never miss an opportunity to participate in an event that matches your interests."</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Create or Join Teams&nbsp;&nbsp;&nbsp;&nbsp; Effortlessly</h5>
                            <p class="card-text"> "At participant side Form teams with ease or join existing teams to collaborate on exciting projects and tackle challenges together."</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Effortlessly Create and Manage Events</h5>
                            <p class="card-text text-center"> "Organizers can easily create and manage hackathon events, including setting up event details, dates, locations, and registration requirements."</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Engage with Participants and Collect Feedback</h5>
                            <p class="card-text">"Interact with participants by collecting feedback through surveys, and foster community engagement before, during, and after hackathon events."</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-center">Streamlined Registration and&nbsp;&nbsp;&nbsp; Login</h5>
                            <p class="card-text">"Seamless registration and login process for both participants and organizers, ensuring easy access to event information and management."</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--events-->
        <%@include file="reusable/event_cards.jsp" %>

        <%@include file="reusable/about.jsp" %>

        <%@include file="js/js_links.jsp" %>
    </body>
</html>
