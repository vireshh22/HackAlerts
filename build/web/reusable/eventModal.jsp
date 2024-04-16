<%@page import="java.util.ArrayList"%>
<%@page import="com.hackalerts.entities.Categories"%>
<%@page import="com.hackalerts.dao.EventDao"%>
<%@page import="com.hackalerts.helper.ConnectionProvider"%>
<!-- Event Modal -->
<div class="modal fade" id="add-event" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide Event Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="add-events-form" action="AddEventServlet" method="post">

                    <div class="form-group">
                        <select class="form-control" name="cid">
                            <option selected disabled>-- Select Category--</option>
                            <%
                                EventDao pd = new EventDao(ConnectionProvider.getConnection());
                                ArrayList<Categories> list = pd.getAllCategories();
                                for (Categories c : list) {
                            %>
                            <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="text" name="eName" required class="form-control" placeholder="Enter Event Name">    
                    </div>
                    <div class="form-group">
                        <input type="text" name="clgName" required class="form-control" placeholder="Enter College Name Where The Event Is Being Held">    
                    </div>
                    <div class="form-group">
                        <label>Upload Event Brochure</label>
                        <input type="file" name="eBrochure" required class="form-control">    
                    </div>
                    <div class="form-group">
                        <label>Provide Registration Link</label>
                        <input type="text" name="regLink" required class="form-control">    
                    </div>
                    <div class="form-group">
                        <label>Select Event Date</label>
                        <input type="date" name="eDate" required class="form-control">    
                    </div>
                    <div class="form-group">
                        <label>Please Provide Venue</label>
                        <input type="url" required name="eVenue" placeholder="Paste Google Map Link/City,State" class="form-control">    
                    </div>

                    <!--                        <div class="container text-center">
                                                <button type="submit" class="btn"style="background: #FFDE59">ADD</button>
                                            </div>-->


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn" style="background:#FFDE59">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>