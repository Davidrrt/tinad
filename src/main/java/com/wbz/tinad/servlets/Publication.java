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
        PrintWriter out=response.getWriter();
        out.print(json);
        //out.print(js);
        //json[2]=t.toJson(utilisateurDao.listeMembres());
        //request.setAttribute("json", json);
       // request.getRequestDispatcher("annonces.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
