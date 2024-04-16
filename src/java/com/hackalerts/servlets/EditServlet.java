package com.hackalerts.servlets;

import com.hackalerts.dao.UserDao;
import com.hackalerts.entities.Message;
import com.hackalerts.entities.User;
import com.hackalerts.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch all data
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String clg = request.getParameter("user_clg");

            //get user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setEmail(email);
            user.setPassword(password);
            user.setClg(clg);

            //update in db also
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean result = userDao.updateUser(user);
            if (result) {
                out.println("done");
                Message msg = new Message("Profile Updated Successfully..", "success", "alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            } else {
                Message msg = new Message("Profile Not Updated..", "error", "alert-error");
                session.setAttribute("msg", msg);
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
