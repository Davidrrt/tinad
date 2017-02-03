/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class Connexion extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Connexion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Connexion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out=response.getWriter();        
        UtilisateurDaoImpl uDao= new UtilisateurDaoImpl(DAOFactory.getInstance());      
        
        out.print("{\"USER_COUNT\":\""+uDao.verifierUtilisateur(new Utilisateur("faneva@gmail.com","faneva"))+"\"}");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out=response.getWriter();   
        UtilisateurDaoImpl uDao= new UtilisateurDaoImpl(DAOFactory.getInstance());
        if(!request.getParameter("username").isEmpty() && !request.getParameter("password").isEmpty()) {
           out.print("{\"USER_COUNT\":\""+uDao.verifierUtilisateur(new Utilisateur(request.getParameter("username"),request.getParameter("username")))+"\"}");
        }    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
