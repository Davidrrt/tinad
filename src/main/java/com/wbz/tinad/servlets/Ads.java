package com.wbz.tinad.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ads extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";
    public static final String ATT_SESSION_USER = "admin";
    private static String VUE = "/admin/connexion.jsp";

    @Override
    public void init() throws ServletException {

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mdp = request.getParameter("mdp");
        String nom = request.getParameter("nom");
        HttpSession session = request.getSession();
        if (mdp.compareTo("3x2awnTuVZ") == 0) {
            session.setAttribute(ATT_SESSION_USER, "ok");
            response.sendRedirect("admin/membres.jsp");
        } else {
        }
    }
}
