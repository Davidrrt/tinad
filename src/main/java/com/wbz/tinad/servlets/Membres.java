/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.google.gson.Gson;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDao;
import com.wbz.tinad.services.AnnonceService;
import com.wbz.tinad.services.UtilisateurService;
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
public class Membres extends HttpServlet{
        public static final String CONF_DAO_FACTORY = "daofactory";

    private UtilisateurDao annonceDao;


    @Override
    public void init() throws ServletException {
        this.annonceDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getUtilisateurDao();
     
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtilisateurService util = new UtilisateurService(annonceDao);
        Gson t = new Gson();
        ArrayList<String> json = util.getallmembre();
        response.setContentType("application/json");
        PrintWriter out=response.getWriter();
        out.print(json);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
