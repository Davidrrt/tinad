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
    private static final String SQL_SELECT_OFFRE = "SELECT idutilisateur, nom, prenom, designation, titre, description, datedebutdisponibilite, datefindisponibilite,libelle,adresse,latitude,longitude,image,publication,idcategorie FROM annonce WHERE type = ?";
    private static final String SQL_SELECT_ALL_SINGLE_UI = "SELECT idutilisateur, nom, prenom, designation, titre, description, datedebutdisponibilite, datefindisponibilite,libelle,adresse,latitude,longitude,image,publication,idcategorie FROM annonce WHERE type = ? AND idutilisateur = ?";

    AnnonceDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public Annonce[] afficheOffre(int type, int id) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Annonce> tab = new ArrayList<Annonce>();

        try {

            connexion = daoFactory.getConnection();
            if (id == 0) {
                preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_OFFRE, false, type);
            } else {
                preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_ALL_SINGLE_UI, false, type,id);
            }
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tab.add(map(resultSet));
            }
            Annonce[] utilisateur = null;
            utilisateur = new Annonce[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                utilisateur[i] = (Annonce) tab.get(i);
            }
            return utilisateur;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

    }

    private static Annonce map(ResultSet resultSet) throws SQLException {
        Annonce utilisateur = new Annonce();
        Utilisateur user_annonceur = new Utilisateur();
        user_annonceur.setNom(resultSet.getString("nom"));
        user_annonceur.setPrenom(resultSet.getString("prenom"));
        user_annonceur.setAdresse(resultSet.getString("adresse"));
        user_annonceur.setLatitude(resultSet.getDouble("latitude"));
        user_annonceur.setLongitude(resultSet.getDouble("longitude"));
        user_annonceur.setImg(resultSet.getString("image"));
        user_annonceur.setPublication(resultSet.getString("publication"));
        utilisateur.setImg(resultSet.getString("libelle"));
        utilisateur.setidCategorie(resultSet.getString("idcategorie"));
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
