/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.google.gson.Gson;
import com.wbz.tinad.dao.AnnonceDao;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.services.AnnonceService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author davra
 */
public class Publication extends HttpServlet {
    public static final String CONF_DAO_FACTORY = "daofactory";
    private AnnonceDao annonceDao;
   // private UtilisateurDao utilisateurDao;

    @Override
    public void init() throws ServletException {
        this.annonceDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getAnnonceDao();
       // this.utilisateurDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getUtilisateurDao();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AnnonceService util = new AnnonceService(annonceDao);
        Gson t = new Gson();
        //String json = new String[2];
        ArrayList<String> json = util.offrepublic();
        //ArrayList<String> js = util.demandepublic();
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out=response.getWriter();
        out.print(json);        
    }
    @Override
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("application/text");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out= response.getWriter();         
        out.print("miditra!");         
            
            AnnonceService annonceService = new AnnonceService(annonceDao);
            if(!request.getParameter("idUtilisateur").isEmpty() && !request.getParameter("titre").isEmpty() &&!request.getParameter("description").isEmpty() && !request.getParameter("date_debut").isEmpty()&& !request.getParameter("date_fin").isEmpty()) {
                try {
                    out.print("reussi!");
                    //idUser,idCategorie,type,titre, description, dateDebut, dateFin, image                
                    annonceService.creer(request.getParameter("idUtilisateur"),
                            request.getParameter("categorie"),
                            request.getParameter("type"),
                            request.getParameter("titre"),
                            request.getParameter("description"),
                            request.getParameter("date_debut"),
                            request.getParameter("date_fin"),
                            request.getParameter("image"));
                    out.print("reussi!");
                } catch (Exception ex) {
                    ex.printStackTrace();
                     out.print("echec!");
                }
            }
         
    }
}
