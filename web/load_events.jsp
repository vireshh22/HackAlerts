<%@page import="java.util.List"%>
<%@page import="com.hackalerts.entities.Events"%>
<%@page import="com.hackalerts.dao.EventDao"%>
<%@page import="com.hackalerts.helper.ConnectionProvider"%>

<div class="row">

    <%
        
//        Thread.sleep(1000);
        
        EventDao dao = new EventDao(ConnectionProvider.getConnection());
        List<Events> events =null;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if(cid == 0){
        events = dao.getAllEvents();
        }
        else{
            events = dao.getEventsCid(cid);
        }
        
        if(events.size() == 0){
            out.println("<h4 class='display-3 text-center'>No Events..</h4>");
            return ;
        }

        for (Events e : events) {
    %>    
    <div class="col-md-4 mt-2"> 
        <div class="card shadow-sm" style="height: 400px">
            <div class="card-header">
                <h5 class="mb-0"><%= e.getClgName()%></h5>
                <p class="card-subtitle mt-2 text-muted"><%= e.getEtitle()%></p>
            </div>
            <div style="height: 200px; overflow: hidden;">
                <img src="Brochures/<%= e.getEpic()%>" class="card-img-top" alt="...">
            </div>
            <div class="card-body">
                <!--<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>-->
                <div class="row">
                    <div class="col-5">                       
                        <p class="mb-0"><%= e.getEdate()%></p>
                    </div>
                    <div class="col-7 text-right">
                        <p class="mb-0"><a href="<%= e.getLocation()%>" style="text-decoration: none">Location</a></p>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a class="btn" href="event_details.jsp?event_id=<%= e.getEid() %>" style="background: #FFDE59;color:white;font-weight:bold">See More</a>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>