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
public class Profil extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";

    private AnnonceDao annonceDao;
    // private UtilisateurDao utilisateurDao;

    @Override
    public void init() throws ServletException {
        this.annonceDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getAnnonceDao();

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AnnonceService util = new AnnonceService(annonceDao);
        Gson t = new Gson();
        if(request.getParameter("id")!=null){
        ArrayList<String> json = util.infoprofil(Integer.parseInt(request.getParameter("id")));
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        }else{
            PrintWriter out = response.getWriter();
            out.print("404 not found");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
