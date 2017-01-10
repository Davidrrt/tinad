/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;
import static com.wbz.tinad.dao.DAOUtilitaire.*;
import com.wbz.tinad.beans.Utilisateur;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UtilisateurDaoImpl implements UtilisateurDao {

    private DAOFactory daoFactory;
    private static final String SQL_SELECT_LISTE = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE statut='11'";
    private static final String SQL_SELECT_PAR_EMAIL = "SELECT id, email, nom, mot_de_passe, date_inscription FROM Utilisateur WHERE email = ?";
    private static final String SQL_INSERT = "INSERT INTO Utilisateur (email, mot_de_passe, nom, date_inscription) VALUES (?, ?, ?, NOW())";

    UtilisateurDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    /* Implémentation de la méthode trouver() définie dans l'interface UtilisateurDao */

    @Override
    public Utilisateur trouver(String email) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur utilisateur = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_PAR_EMAIL, false, email);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            if (resultSet.next()) {
                utilisateur = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

        return utilisateur;
    }

    /* Implémentation de la méthode creer() définie dans l'interface UtilisateurDao */
    @Override
    public void creer(Utilisateur utilisateur) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT, true, utilisateur.getEmail(), utilisateur.getMotDePasse(), utilisateur.getNom());
            int statut = preparedStatement.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if (statut == 0) {
                throw new DAOException("Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table.");
            }
            /* Récupération de l'id auto-généré par la requête d'insertion */
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if (valeursAutoGenerees.next()) {
                /* Puis initialisation de la propriété id du bean Utilisateur avec sa valeur */
                utilisateur.setId(valeursAutoGenerees.getLong(1));
            } else {
                throw new DAOException("Échec de la création de l'utilisateur en base, aucun ID auto-généré retourné.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(valeursAutoGenerees, preparedStatement, connexion);
        }
    }
    /*
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */

  

    public Utilisateur[] listeMembres() throws DAOException {
       Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur[] utilisateur = null;
          
        ArrayList<Utilisateur> tab = new ArrayList<Utilisateur>();

        try {
       
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_LISTE, false, (Object) null);
            resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                tab.add(map(resultSet));
            }
            utilisateur = new Utilisateur[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                utilisateur[i] = (Utilisateur) tab.get(i);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

        return utilisateur;
    }
      private static Utilisateur map(ResultSet resultSet) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(resultSet.getLong("id"));
        utilisateur.setEmail(resultSet.getString("email"));
        utilisateur.setMotDePasse(resultSet.getString("mot_de_passe"));
        utilisateur.setNom(resultSet.getString("nom"));
        utilisateur.setDateInscription(resultSet.getTimestamp("date_inscription"));
        return utilisateur;
    }
}
