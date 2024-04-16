<!--profile modal-->
<div class="modal" id="profileModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <img src="images/l1.png" alt="Icon" style="border-radius: 50%" height="30">
                <h5 class="modal-title">HackAlerts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <%                                String modalName = user.getName();
                        modalName = modalName.toUpperCase();
                    %>
                    <h5 class="modal-title" id="profileLabel"><%= modalName%></h5>
                    <br>
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%= user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">College</th>
                                    <td><%= user.getClg()%></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--profile edit-->
                    <div id="profile-edit" style="display: none">
                        <h3>Please Edit Carefully..</h3>

                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table"> 
                                <tr>
                                    <td>ID:</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" /></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" /></td>
                                </tr>
                                <tr>
                                    <td>College:</td>
                                    <td><input type="text" class="form-control" name="user_clg" value="<%= user.getClg()%>"</td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn" style="background: #FFDE59;color:white;font-weight: bold;">Save</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <a href="LogoutServlet" class="btn btn-secondary">Logout</a>
                <button type="button" id="edit-profile-btn" class="btn" style="background: #FFDE59;color: white;font-weight: bold;">EDIT</button>
            </div>
        </div>
    </div>
</div>