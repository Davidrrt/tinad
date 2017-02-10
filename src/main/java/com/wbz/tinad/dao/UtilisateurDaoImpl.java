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


public class UtilisateurDaoImpl implements UtilisateurDao {
    private final UtilisateurService utilisateurService=null ;
    private final DAOFactory daoFactory;    
    private static final String SQL_SELECT_PAR_EMAIL = "SELECT utilisateur_id, image, nom, prenom, email, adresse, latitude, longitude, sexe, specialite, dateinscription FROM profil WHERE email = ?";
    
    private static final String SQL_INSERT = "INSERT INTO utilisateur(nom, prenom, email, adresse, latitude, longitude,sexe, specialite, dateinscription, statut) VALUES (?, ?, ?, ?, ?, ?, ?, ?,NOW(), '11');";
    private static final String SQL_INSERT_MOTDEPASSE = "INSERT INTO motdepasse(idutilisateur, datemodification, motdepasse) VALUES ( ?,NOW(), ?);";
    private static final String SQL_INSERT_IMAGE= "INSERT INTO photoprofil(utilisateur_id, libelle, dateprofil, datejour) VALUES (?, ?,NOW(),NOW())";
    
      
    private static final String SQL_SELECT_CONNEXION = "SELECT COUNT(*) AS NOMBREUTILISATEUR FROM UTILISATEUR JOIN MOTDEPASSE ON MOTDEPASSE.IDUTILISATEUR = UTILISATEUR.IDUTILISATEUR WHERE UTILISATEUR.EMAIL = ? AND MOTDEPASSE.MOTDEPASSE= ?"; 
    private static final String SQL_SELECT_TOUT_MEMBRE ="SELECT utilisateur_id, image, nom, prenom, email, adresse, latitude, longitude, sexe, specialite, dateinscription FROM profil";
    private static final String SQL_INSERT_STATUT ="INSERT INTO publication (utilisateur_id, info, datepubl) VALUES (?, ?,NOW())";
  
    private static final String SQL_SELECT_CONNEXION_FRONT ="SELECT UTILISATEUR.IDUTILISATEUR FROM UTILISATEUR JOIN MOTDEPASSE ON MOTDEPASSE.IDUTILISATEUR = UTILISATEUR.IDUTILISATEUR WHERE UTILISATEUR.EMAIL = ? AND MOTDEPASSE.MOTDEPASSE= ?"; 
    
    public UtilisateurDaoImpl(DAOFactory daoFactory) {
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
            if (resultSet.next()) {
                utilisateur = mapMembres(resultSet);
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
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_CONNEXION, false,utilisateur.getEmail() , utilisateur.getMotDePasse());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
               return resultSet.getInt("NOMBREUTILISATEUR");
            }
        }catch (SQLException e) {
            e.printStackTrace();
           throw new DAOException(e.getMessage());
        }finally {
             fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
        return 0;
    }
       public int getidUtilisateur(Utilisateur utilisateur) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;        
        ResultSet resultSet = null;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_CONNEXION_FRONT, false,utilisateur.getEmail() , utilisateur.getMotDePasse());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
               return resultSet.getInt("IDUTILISATEUR");
            }
        }catch (SQLException e) {
            e.printStackTrace();
           throw new DAOException(e.getMessage());
        }finally {
             fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
        return 0;
    }
    /* Implémentation de la méthode creer() définie dans l'interface UtilisateurDao */
    @Override
    public void creer(Utilisateur utilisateur) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatementPass= null;
        PreparedStatement preparedStatementImage= null;
        ResultSet valeursAutoGenerees = null;
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            //UTILISATEUR (IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,MOTDEPASSE,SPECIALITE,LATITUDE,LONGITUDE,DATEINSCRIPTION)
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT, true, utilisateur.getNom(),
                                                                                           utilisateur.getPrenom(),
                                                                                           utilisateur.getEmail(),
                                                                                           utilisateur.getAdresse(),
                                                                                           utilisateur.getLatitude(),
                                                                                           utilisateur.getLongitude(),
                                                                                           utilisateur.getSexe(),
                                                                                           utilisateur.getSpecialite());
                                                                                           
              int statut = preparedStatement.executeUpdate();
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if (valeursAutoGenerees.next()) {
                /* Puis initialisation de la propriété id du bean Utilisateur avec sa valeur */
                utilisateur.setId(valeursAutoGenerees.getInt(1));
            } else {
                throw new DAOException("Échec de la création de l'utilisateur en base, aucun ID auto-généré retourné.");
            }
            preparedStatementPass = initialisationRequetePreparee(connexion, SQL_INSERT_MOTDEPASSE,true,utilisateur.getId(),utilisateur.getMotDePasse());
            preparedStatementImage= initialisationRequetePreparee(connexion,SQL_INSERT_IMAGE,true,utilisateur.getId(),utilisateur.getImg());
            int statusPass = preparedStatementPass.executeUpdate();
            int statusimage=preparedStatementImage.executeUpdate();
            /* Analyse du statut retourné par la requête d'insertion */
            if (statut == 0 ) {
                throw new DAOException("Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table.");
            }
            /* Récupération de l'id auto-généré par la requête d'insertion */
            
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {           
            fermeturesSilencieuses(valeursAutoGenerees, preparedStatement, connexion);
        }
    }
    
     public Utilisateur[] getMembres() throws DAOException {
        ArrayList<Utilisateur> listUser = new ArrayList<Utilisateur>();
        Utilisateur[] tab=null;
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_TOUT_MEMBRE, false);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Utilisateur perso=mapMembres(resultSet);
                listUser.add(perso) ;
            }
            tab=new Utilisateur[listUser.size()];
            for(int i=0;i<listUser.size();i++){
                tab[i]=listUser.get(i);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
        return tab;
    }
       public void inserStatut(String id, String contenue) throws Exception  {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet valeursAutoGenerees = null;

        try {
            // idservice, idcategorie, idutilisateur,titre, description, datepublication,datedebutdisponibilite ,datefindisponibilite, type , image
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT_STATUT,false,Integer.parseInt(id),contenue);
            preparedStatement.executeUpdate();
            connexion.commit();
        } catch (Exception e) {
            connexion.rollback();
            e.printStackTrace();
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
    //IDUTILISATEUR,NOM,PRENOM,SEXE,EMAIL,ADRESSE,SPECIALITE,LATITUDE,LONGITUDE
    private static Utilisateur map(ResultSet resultSet) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(resultSet.getInt("IDUTILISATEUR"));
        utilisateur.setNom(resultSet.getString("NOM"));
        utilisateur.setPrenom(resultSet.getString("PRENOM"));
        utilisateur.setSexe(resultSet.getString("SEXE"));
        utilisateur.setEmail(resultSet.getString("EMAIL"));
        utilisateur.setAdresse(resultSet.getString("ADRESSE"));
        utilisateur.setSpecialite(resultSet.getString("SPECIALITE"));
        utilisateur.setLatitude(resultSet.getDouble("LATITUDE"));
        utilisateur.setLongitude(resultSet.getDouble("LONGITUDE"));       
        return utilisateur;
    }


      private static Utilisateur mapMembres(ResultSet resultSet) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(resultSet.getInt("utilisateur_id"));
        utilisateur.setNom(resultSet.getString("NOM"));
        utilisateur.setPrenom(resultSet.getString("PRENOM"));
        utilisateur.setSexe(resultSet.getString("SEXE"));
        utilisateur.setEmail(resultSet.getString("EMAIL"));
        utilisateur.setAdresse(resultSet.getString("ADRESSE"));
        utilisateur.setSpecialite(resultSet.getString("SPECIALITE"));
        utilisateur.setLatitude(resultSet.getDouble("LATITUDE"));
        utilisateur.setLongitude(resultSet.getDouble("LONGITUDE")); 
        utilisateur.setImg(resultSet.getString("image"));
        return utilisateur;
    }

  

    
}
