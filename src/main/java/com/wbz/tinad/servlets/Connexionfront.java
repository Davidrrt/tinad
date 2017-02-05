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
import javax.servlet.http.HttpSession;

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.DAOFactory;
import com.wbz.tinad.dao.UtilisateurDao;
import com.wbz.tinad.forms.ConnexionForm;
import java.io.PrintWriter;

public class Connexionfront extends HttpServlet {

    public static final String CONF_DAO_FACTORY = "daofactory";
    public static final String ATT_USER = "utilisateur";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String VUE = "/connexion.jsp";
    public static final String VUES = "/acceuil.jsp";
    private UtilisateurDao utilisateurDao;

    @Override
    public void init() throws ServletException {
        /* R�cup�ration d'une instance de notre DAO Utilisateur */
        this.utilisateurDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getUtilisateurDao();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* Affichage de la page de connexion */
        this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnexionForm form = new ConnexionForm(utilisateurDao);

        /* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
        Utilisateur utilisateur = form.connexionUtilisateur(request);

        /* R�cup�ration de la session depuis la requ�te */
        HttpSession session = request.getSession();
         // PrintWriter out = response.getWriter();
           // out.print(utilisateur.getId());
        /**
         * Si aucune erreur de validation n'a eu lieu, alors ajout du bean
         * Utilisateur � la session, sinon suppression du bean de la session.
         */
        if (utilisateur.getId()>0) {
            session.setAttribute(ATT_SESSION_USER, utilisateur);
          
            //this.getServletContext().getRequestDispatcher(VUES).forward(request, response);
            response.sendRedirect("acceuil.jsp");
        } else {
            session.setAttribute(ATT_SESSION_USER, null);
            request.setAttribute(ATT_FORM, form);
            request.setAttribute(ATT_USER, utilisateur);

            this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
        }

        /* Stockage du formulaire et du bean dans l'objet request */
    }
}
