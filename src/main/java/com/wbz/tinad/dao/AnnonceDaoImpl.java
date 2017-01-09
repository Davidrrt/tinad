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
    private static final String SQL_SELECT_OFFRE = "SELECT * FROM service WHERE type = ?";

    AnnonceDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    @Override
    public Annonce[] afficheOffre(int type) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Annonce[] utilisateur = null;
        ArrayList<Annonce> tab = new ArrayList<Annonce>();

        try {
           
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_OFFRE, false, type);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                tab.add(map(resultSet));
            }
            utilisateur = new Annonce[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                utilisateur[i] = (Annonce) tab.get(i);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

        return utilisateur;
    }

    private static Annonce map(ResultSet resultSet) throws SQLException {
        Annonce utilisateur = new Annonce();
        utilisateur.setIdCategorie(resultSet.getInt("idCategorie"));
        utilisateur.setIdutilisateur(resultSet.getInt("Idutilisateur"));
        utilisateur.setTitre(resultSet.getString("Titre"));
        utilisateur.setDescription(resultSet.getString("Description"));
        utilisateur.setDateDebut(resultSet.getDate("dateDebutDisponibilite"));
        utilisateur.setDateFin(resultSet.getDate("dateFinDisponibilite"));
        return utilisateur;
    }

}
