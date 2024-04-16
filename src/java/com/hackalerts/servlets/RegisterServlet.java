package com.hackalerts.servlets;

import com.hackalerts.dao.UserDao;
import com.hackalerts.entities.User;
import com.hackalerts.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch all form data
            String check = request.getParameter("check");
            if(check == null){
                out.println("Please Agree Terms & Conditions");
            }else{
                //baki ka data yahan nikalna hai..
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String clg = request.getParameter("user_clg");
                String password = request.getParameter("password");
                
                //create user object & set all the data to object
                User user = new User(name,email,clg,password);
                
                //create userDao object
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                if(userDao.saveUser(user)){
                    //saved
                    out.println("done");
                }
                else{
                    out.println("Email Already Exists..");
                }
            }
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
