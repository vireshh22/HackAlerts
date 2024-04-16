package com.hackalerts.servlets;

import com.hackalerts.dao.OrganizeDao;
import com.hackalerts.entities.Organize;
import com.hackalerts.entities.User;
import com.hackalerts.helper.ConnectionProvider;
import static com.hackalerts.helper.ConnectionProvider.getConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OrganizeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrganizeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            
            int cid = 1;
            int userid = user.getId();
            String eName = request.getParameter("eName");
            String clgName = request.getParameter("clgName");
            String regProcess = request.getParameter("regProcess");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String tags = request.getParameter("tags");
            int min = Integer.parseInt(request.getParameter("min"));
            int max = Integer.parseInt(request.getParameter("max"));
            String implement = request.getParameter("implement");
            String rules = request.getParameter("rules");
            String organizer1 = request.getParameter("organizer1");
            String contact1 = request.getParameter("contact1");
            String organizer2 = request.getParameter("organizer2");
            String contact2 = request.getParameter("contact2");
            
            Organize o = new Organize(cid,userid,eName,clgName,regProcess,sDate,eDate,tags,min,max,implement,rules,organizer1,contact1,organizer2,contact2);
            OrganizeDao dao = new OrganizeDao(ConnectionProvider.getConnection());
            
            if (dao.saveOrganizedHacks(o)) {
                out.println("done");
            }
            else{
                out.println("error");
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
