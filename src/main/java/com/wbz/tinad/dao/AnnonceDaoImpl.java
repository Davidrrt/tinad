/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;
import static com.wbz.tinad.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.wbz.tinad.dao.DAOUtilitaire.initialisationRequetePreparee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnnonceDaoImpl implements AnnonceDao {

    private DAOFactory daoFactory;
    private static final String SQL_SELECT_OFFRE = "SELECT idutilisateur, nom, prenom, designation, titre, description,datepublication, datedebutdisponibilite, datefindisponibilite,adresse, latitude, longitude, type FROM annonce WHERE type=?";

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
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

        
    }

    private static Annonce map(ResultSet resultSet) throws SQLException {
        Annonce utilisateur = new Annonce();
        utilisateur.setId(resultSet.getString("idutilisateur"));
        utilisateur.setNom(resultSet.getString("nom"));
        utilisateur.setPrenom(resultSet.getString("prenom"));
        utilisateur.setTitre(resultSet.getString("titre"));
        utilisateur.setDescription(resultSet.getString("description"));
        utilisateur.setDateDebut(resultSet.getDate("datedebutdisponibilite"));
        utilisateur.setDateFin(resultSet.getDate("datefindisponibilite"));
         utilisateur.setAdresse(resultSet.getString("adresse"));
         utilisateur.setLatitude(resultSet.getDouble("latitude"));
         utilisateur.setLongitude(resultSet.getDouble("longitude"));
         utilisateur.setCategorie(resultSet.getString("designation"));
        return utilisateur;
    }

}
