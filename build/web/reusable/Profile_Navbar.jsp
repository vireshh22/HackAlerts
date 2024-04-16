<nav class="navbar navbar-expand-lg navbar-light shadow-sm">
    <a class="navbar-brand" href="index.jsp"><img src="images/l1.png" alt="Icon" style="border-radius: 50%" height="30">HackAlerts</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <!--            <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                                <span class="fa-brands fa-wpexplorer fa-lg"></span> Explore
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="index.jsp">Home</a>
                                <a class="dropdown-item" href="#">Features</a>
                                <a class="dropdown-item" href="#">Upcoming Events</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">About Us</a>
                            </div>
                        </li>-->
            <!--      <li class="nav-item pr-2">
                      <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                  </li>-->
            <!--      <li class="nav-item pr-2">
                      <a class="nav-link" href="Login.jsp"><span class="fa fa-map-pin"></span> Login</a>
                  </li>-->

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <%
                String name = user.getName();
                String[] nameSurname = name.split(" ");
                String pName = "";
                if (nameSurname.length > 1) {
                    char n1 = nameSurname[0].charAt(0);
                    char n2 = nameSurname[nameSurname.length - 1].charAt(0);
                    pName += String.valueOf(n1).toUpperCase();
                    pName += String.valueOf(n2).toUpperCase();
                } else {
                    char n1 = nameSurname[0].charAt(0);
                    pName += String.valueOf(n1).toUpperCase();
                }
            %>
            <div class="dropdown dropleft">
                <a class="nav-link mr-3" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display:flex;width:40px;justify-content: center;align-items: center;color:white;background: #FFDE59;border-radius: 50%;font-weight: bold;font-size: 20px;"><span class="fa-solid fa-plus"></span></a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="nav-link mr-3 dropdown-item" href="#" data-toggle="modal" data-target="#add-event">Add Events</a>            
                    <a id="organizeLink" class="nav-link mr-3 dropdown-item" href="organize.jsp">Organize Hackathon</a>            
                </div>
            </div>
            
            <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal" title="Profile" style="display:flex;width:40px;justify-content: center;align-items: center;color:white;background: #FFDE59;border-radius: 50%;font-weight: bold;font-size: 16px;"><%= pName%></a>
        </form>

    </div>
</nav>