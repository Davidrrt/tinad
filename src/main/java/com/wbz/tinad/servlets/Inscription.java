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

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDao;
import com.wbz.tinad.forms.InscriptionForm;
import java.io.PrintWriter;

public class Inscription extends HttpServlet {
    public static final String CONF_DAO_FACTORY = "daofactory";
    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_FORM         = "form";
    public static final String VUE              = "/inscription.jsp";
    public static final String VUES             ="/Connexionfront";

    private UtilisateurDao     utilisateurDao;

    @Override
    public void init() throws ServletException {
        /* Récupération d'une instance de notre DAO Utilisateur */
        this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute( CONF_DAO_FACTORY ) ).getUtilisateurDao();
    }

    @Override
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }

    @Override
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        
        InscriptionForm form = new InscriptionForm( utilisateurDao );
        Utilisateur utilisateur = form.inscrireUtilisateur( request );
        utilisateurDao.creer( utilisateur );
        //PrintWriter out = response.getWriter();
        //out.println(utilisateur.getAdresse());
        /*request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_USER, utilisateur );*/

        this.getServletContext().getRequestDispatcher( VUES ).forward( request, response );
    }
}