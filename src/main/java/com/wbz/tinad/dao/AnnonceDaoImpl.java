/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;
import com.wbz.tinad.beans.Utilisateur;
import static com.wbz.tinad.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.wbz.tinad.dao.DAOUtilitaire.initialisationRequetePreparee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnnonceDaoImpl implements AnnonceDao {
    private DAOFactory daoFactory;
    private static final String SQL_SELECT_OFFRE = "SELECT idutilisateur, nom, prenom, designation, titre, description, datedebutdisponibilite, datefindisponibilite FROM annonce WHERE type = ?";

    AnnonceDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    @Override
    public Annonce[] afficheOffre(int type) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;  
        ArrayList<Annonce> tab = new ArrayList<Annonce>();

        try {
           
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_OFFRE, false, type);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                tab.add(map(resultSet));
            }
             Annonce[] utilisateur = null;
            utilisateur = new Annonce[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                utilisateur[i] = (Annonce) tab.get(i);
            }
            return utilisateur;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

        
    }

    private static Annonce map(ResultSet resultSet) throws SQLException {
        Annonce utilisateur = new Annonce();
        Utilisateur user_annonceur= new Utilisateur();
        user_annonceur.setNom(resultSet.getString("nom"));
        user_annonceur.setPrenom(resultSet.getString("prenom"));        
        
        //utilisateur.setIdCategorie(resultSet.getInt("idcategorie"));
        utilisateur.setCategorie(resultSet.getString("designation"));//categorie
        utilisateur.setIdutilisateur(resultSet.getInt("idutilisateur"));
        utilisateur.setTitre(resultSet.getString("titre"));
        utilisateur.setDescription(resultSet.getString("description"));
        utilisateur.setDateDebut(resultSet.getDate("datedebutdisponibilite"));
        utilisateur.setDateFin(resultSet.getDate("datefindisponibilite"));   
        
               
        
        utilisateur.setUtilisateur(user_annonceur);
        return utilisateur;
    }

}
