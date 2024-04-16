<%@page import="com.hackalerts.dao.EventDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hackalerts.entities.Categories"%>
<%@page import="com.hackalerts.helper.ConnectionProvider"%>
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
        <title>Organize Hackathons</title>
        <%@include file="css/links.jsp" %>
    </head>
    <body>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12 offset-md-0">
                    <form action="OrganizeServlet" id="add-events-form" action="#" method="post">
                        <div class="row">
                            <div class="col-md-6 p-0">

                                <div class="card border-right-0 pl-0" style="height: 580px; width: 100%">

                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4 text-center mt-2">
                                                <div class="form-group">
                                                    <p style="font-size: 24px; font-weight: bold; font-style: italic">Hackathon</p>
                                                </div>
                                            </div>
                                            <div class="col-8 text-center mt-2"">
                                                <div class="form-group">
                                                    <input type="text" name="eName" required class="form-control" placeholder="Enter Event Name">    
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" name="clgName" required class="form-control" placeholder="Enter College Name">    
                                        </div>

                                        <p>Registration Details</p>
                                        <div class="form-group">
                                            <textarea rows="4" cols="50" name="regProcess" required class="form-control" placeholder="Information about registration process" style="resize: none"></textarea>    
                                        </div>
                                        <div class="row">                                           
                                            <div class="col-6 text-center mt-2">
                                                <div class="form-group">
                                                    <label>Start Date</label>
                                                    <input type="date" name="sDate" required class="form-control">    
                                                </div>
                                            </div>
                                            <div class="col-6 text-center mt-2"">
                                                <div class="form-group">
                                                    <label>End Date</label>
                                                    <input type="date" name="eDate" required class="form-control">    
                                                </div>
                                            </div>
                                        </div>

                                        <p>Category</p>
                                        <div class="form-group">
                                            <input type="text" name="tags" required class="form-control" placeholder="Ex: Coding,Design,AI">    
                                        </div>

                                        <div class="row">                                           
                                            <div class="col-4 text-center mt-2">
                                                <div class="container">
                                                    <p>Group Members :</p>    
                                                </div>
                                            </div>
                                            <div class="col-4 text-center mt-2">
                                                <div class="form-group">
                                                    <input type="text" name="min" placeholder="Min" required class="form-control">    
                                                </div>
                                            </div>
                                            <div class="col-4 text-center mt-2"">
                                                <div class="form-group">
                                                    <input type="text" name="max" placeholder="Max" required class="form-control">    
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 p-0">
                                <div class="card border-left-0 pl-0" style="width: 100%; height: 580px">
                                    
                                    <div class="card-body">
                                        <p>Implementation Round Details</p>
                                        <div class="form-group">
                                            <textarea rows="4" cols="50" name="implement" required class="form-control" placeholder="Information about implementation round" style="resize: none"></textarea>    
                                        </div>
                                        <p>Rules and Guidelines</p>
                                        <div class="form-group">
                                            <textarea rows="4" cols="50" name="rules" required class="form-control" placeholder="Rules & Guidelines To Follow During Hackathon" style="resize: none"></textarea>    
                                        </div>

                                        <p>Organizer Details</p>
                                        <div class="row">                                           
                                            <div class="col-6 text-center mt-2">
                                                <div class="form-group">
                                                    <input type="text" name="organizer1" required placeholder="Organizer Name" class="form-control">    
                                                </div>
                                            </div>
                                            <div class="col-6 text-center mt-2"">
                                                <div class="form-group">
                                                    <input type="text" name="contact1" required placeholder="Organizer Contact" class="form-control">    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">                                           
                                            <div class="col-6 text-center mt-2">
                                                <div class="form-group">
                                                    <input type="text" name="organizer2" required placeholder="Organizer Name" class="form-control">    
                                                </div>
                                            </div>
                                            <div class="col-6 text-center mt-2"">
                                                <div class="form-group">
                                                    <input type="text" name="contact2" required placeholder="Organizer Contact" class="form-control">    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container text-right">
                                            <button type="submit" class="btn" style="background: #FFDE59; color: white; font-weight: bold; font-size: 16px">Organize</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="js/js_links.jsp" %>   

    </body>
</html>
