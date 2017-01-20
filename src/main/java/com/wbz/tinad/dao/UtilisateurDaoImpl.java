/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import static com.wbz.tinad.dao.DAOUtilitaire.*;
import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.services.UtilisateurService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDaoImpl implements UtilisateurDao {
    private final UtilisateurService utilisateurService=null ;
    private final DAOFactory daoFactory;    
    private static final String SQL_SELECT_PAR_EMAIL = "SELECT IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,SPECIALITE,LATITUDE,LONGITUDE FROM UTILISATEUR WHERE EMAIL = ?";
    private static final String SQL_INSERT = "INSERT INTO UTILISATEUR (IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,MOTDEPASSE,SPECIALITE,LATITUDE,LONGITUDE,DATEINSCRIPTION) VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
    private static final String SQL_INSERT_MOTDEPASSE = " INSERT INTO MOTDEPASSE (IDMOTDEPASSE,MOTDEPASSE,DATEMODIFICATION) VALUES (DEFAULT, ?, NOW())";
    
    private static final String SQL_SELECT_CONNEXION = "SELECT COUNT(*) AS NOMBREUTILISATEUR FROM UTILISATEUR JOIN MOTDEPASSE ON MOTDEPASSE.IDMOTDEPASSE = UTILISATEUR.IDMOTDEPASSE WHERE UTILISATEUR.EMAIL = ? AND MOTDEPASSE.MOTDEPASSE= ?";
    private static final String SQL_SELECT_TOUT_MEMBRE = "SELECT IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,MOTDEPASSE,SPECIALITE,LATITUDE,LONGITUDE,DATEINSCRIPTION FROM UTILISATEUR ";
    UtilisateurDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    /* Impl�mentation de la m�thode trouver() d�finie dans l'interface UtilisateurDao */
    @Override
    public Utilisateur trouver(String email) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur utilisateur = null;
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_PAR_EMAIL, false, email);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
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
    @Override
    public int verifierUtilisateur(Utilisateur utilisateur) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;        
        ResultSet resultSet = null;
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_CONNEXION, false,utilisateur.getEmail() , utilisateur.getMotDePasse());
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            if (resultSet.next()) {
               return resultSet.getInt("NOMBREUTILISATEUR");
            }
        }catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException("");
        }finally {
             fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
        return 0;
    }
    /* Impl�mentation de la m�thode creer() d�finie dans l'interface UtilisateurDao */
    @Override
    public void creer(Utilisateur utilisateur) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatementPass= null;
        ResultSet valeursAutoGenerees = null;
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            //UTILISATEUR (IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,MOTDEPASSE,SPECIALITE,LATITUDE,LONGITUDE,DATEINSCRIPTION)
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT, true, utilisateur.getNom(),
                                                                                           utilisateur.getPrenom(),
                                                                                           utilisateur.getSexe(),
                                                                                           utilisateur.getEmail(),
                                                                                           utilisateur.getAdresse(),
                                                                                           utilisateur.getMotDePasse(),
                                                                                           utilisateur.getSpecialite(),
                                                                                           utilisateur.getLatitude(),
                                                                                           utilisateur.getLongitude(),
                                                                                           utilisateur.getStatut());
                                                                                           
            preparedStatementPass = initialisationRequetePreparee(connexion, SQL_INSERT,true,utilisateur.getMotDePasse());
            int statut = preparedStatement.executeUpdate();
            int statusPass = preparedStatementPass.executeUpdate();
            /* Analyse du statut retourn� par la requ�te d'insertion */
            if (statut == 0 || statusPass == 0) {
                throw new DAOException("�chec de la cr�ation de l'utilisateur, aucune ligne ajout�e dans la table.");
            }
            /* R�cup�ration de l'id auto-g�n�r� par la requ�te d'insertion */
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if (valeursAutoGenerees.next()) {
                /* Puis initialisation de la propri�t� id du bean Utilisateur avec sa valeur */
                utilisateur.setId(valeursAutoGenerees.getLong(1));
            } else {
                throw new DAOException("�chec de la cr�ation de l'utilisateur en base, aucun ID auto-g�n�r� retourn�.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {           
            fermeturesSilencieuses(valeursAutoGenerees, preparedStatement, connexion);
        }
    }
    
     public List<Utilisateur> getMembres() throws DAOException {
        List<Utilisateur> listUser = new ArrayList<Utilisateur>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;        
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_TOUT_MEMBRE, false, (Object) null);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            if (resultSet.next()) {
                listUser.add(map(resultSet)) ;
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
        return listUser;
    }
    /*
     * Simple m�thode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     */
    //IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,SPECIALITE,LATITUDE,LONGITUDE
    private static Utilisateur map(ResultSet resultSet) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(resultSet.getLong("IDUTILISATEUR"));
        utilisateur.setNom(resultSet.getString("NOM"));
        utilisateur.setPrenom(resultSet.getString("PRENOM"));
        utilisateur.setSexe(resultSet.getString("SEXE"));
        utilisateur.setEmail(resultSet.getString("EMAIL"));
        utilisateur.setAdresse(resultSet.getString("ADRESSE"));
        utilisateur.setSpecialite(resultSet.getString("SPECIALITE"));
        utilisateur.setLatitude(resultSet.getLong("LATITUDE"));
        utilisateur.setLongitude(resultSet.getLong("LONGITUDE"));
        utilisateur.setMotDePasse(resultSet.getString("MOTDEPASSE"));        
        utilisateur.setDateInscription(resultSet.getDate("DATEINSCRIPTION"));
        return utilisateur;
    }

   

    
}
