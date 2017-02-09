/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDao;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Statut extends HttpServlet {
    public static final String CONF_DAO_FACTORY = "daofactory";
    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_FORM         = "form";
    public static final String VUES             ="/Connexionfront";

    private UtilisateurDao     utilisateurDao;

    @Override
    public void init() throws ServletException {
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    @Override
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        
    }

    @Override
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        
        String id=request.getParameter("id");
        String contenue=request.getParameter("contenu");
        try {
            utilisateurDao.inserStatut(id,contenue);
        } catch (Exception ex) {
            Logger.getLogger(Statut.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("acceuil.jsp");
    }
}