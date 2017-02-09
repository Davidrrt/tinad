/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.CategorieDao;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDao;
import com.wbz.tinad.dao.UtilisateurDaoImpl;
import com.wbz.tinad.forms.ConnexionForm;
import com.wbz.tinad.services.UtilisateurService;
import static com.wbz.tinad.servlets.Categorie.CONF_DAO_FACTORY;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connexion extends HttpServlet {
    public static final String CONF_DAO_FACTORY = "daofactory";
    private UtilisateurDao utilisateurDao;
    
    public void init() throws ServletException {
        this.utilisateurDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getUtilisateurDao();     
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        UtilisateurDaoImpl uDao = new UtilisateurDaoImpl(DAOFactory.getInstance());       

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = response.getWriter();
        ConnexionForm form = new ConnexionForm(utilisateurDao);        
        UtilisateurDaoImpl uDao = new UtilisateurDaoImpl(DAOFactory.getInstance());
        UtilisateurService uService= new UtilisateurService(this.utilisateurDao);        
        
        if (!request.getParameter("username").isEmpty() && !request.getParameter("password").isEmpty()) {
            Utilisateur utilisateur= new Utilisateur(request.getParameter("username"), request.getParameter("password"));
                        form.traiterMotdepasse(request.getParameter("password"), utilisateur);
            int user_count= uDao.verifierUtilisateur(utilisateur);
            if(user_count==1) {                
                //out.print("{\"USER_CONNECTE\":" + uService.printUserConnecte(request.getParameter("username"))+ "}");
                                        //String subject, String issuer, String username, boolean admin
                out.print("{\"token\":\"" + UtilisateurService.generateToken("tinad","heroku",request.getParameter("username"),false)+"\","+"\"USER_CONNECTE\":" + uService.printUserConnecte(request.getParameter("username"))+"}");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
