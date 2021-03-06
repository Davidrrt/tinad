/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

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
public class Pub extends HttpServlet {

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
        ArrayList<String> json = util.offrepub();
        response.setContentType("application/json");
        response.setHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = response.getWriter();
        out.print(json);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }
}
