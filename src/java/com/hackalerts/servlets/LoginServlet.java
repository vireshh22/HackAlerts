package com.hackalerts.servlets;

import com.hackalerts.dao.UserDao;
import com.hackalerts.entities.Message;
import com.hackalerts.entities.User;
import com.hackalerts.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //login
            //fetch user name password from request
            String userEmail = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            
            User user = dao.getUserByEmailPassword(userEmail, password);
            if(user == null){
                //error
                //out.println("Invalid Details");
                
                Message msg = new Message("Invalid Details! Try With Another", "error", "alert-warning alert-dissmisible");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                
                response.sendRedirect("login.jsp");
                
            }else{
                //success login
                HttpSession session = request.getSession();
                session.setAttribute("currentUser",user);
                response.sendRedirect("profile.jsp");
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
