package com.hackalerts.servlets;

import com.hackalerts.dao.EventDao;
import com.hackalerts.entities.Events;
import com.hackalerts.entities.User;
import com.hackalerts.helper.ConnectionProvider;
import com.hackalerts.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddEventServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //fetch data
            int cid = Integer.parseInt(request.getParameter("cid"));
            String eTitle = request.getParameter("eName");
            String clgName = request.getParameter("clgName");
            Part ePic = request.getPart("eBrochure");
            String regLink = request.getParameter("regLink");
            String eDate = request.getParameter("eDate");
            Date postedDate = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = dateFormat.format(postedDate);
            String eVenue = request.getParameter("eVenue");

            //getting userID
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            Events e = new Events(eTitle, ePic.getSubmittedFileName(), regLink, eDate, cid, clgName, eVenue, user.getId(),dateString);
            EventDao dao = new EventDao(ConnectionProvider.getConnection());
            if (dao.saveEvents(e)) {
                out.println("done");

                String path = request.getRealPath("/") + "Brochures" + File.separator + e.getEpic();
                //deleting existing Brochure
//                Helper.deleteFile(path);
//                if (Helper.saveFile(ePic.getInputStream(), path)) {
//                    out.println("Profile Uploded");
//                } else {
//                    out.println("not uploaded");
//                }
                Helper.saveFile(ePic.getInputStream(), path);

            } else {
                out.println("error");
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
