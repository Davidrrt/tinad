package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;
import com.wbz.tinad.beans.Publicite;
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
    private static final String SQL_SELECT_OFFRE = "SELECT idservice, idutilisateur,datepublication, nom, prenom, designation, titre, description, datedebutdisponibilite, datefindisponibilite,libelle,adresse,latitude,longitude,image,publication,idcategorie FROM annonce WHERE type = ? ORDER BY idservice DESC";
    private static final String SQL_SELECT_ALL_SINGLE_UI = "SELECT idservice, idutilisateur, nom, prenom, designation, titre, description, datedebutdisponibilite, datefindisponibilite,libelle,adresse,latitude,longitude,image,publication,datepublication ,idcategorie FROM annonce WHERE type = ? AND idutilisateur = ? ORDER BY idservice DESC";
    private static final String SQL_INSERT_ANNONCE = "INSERT INTO service(idservice, idcategorie, idutilisateur,titre, description, datepublication,datedebutdisponibilite ,datefindisponibilite, type , image) VALUES (DEFAULT,?,?,?,?,NOW(),?,?,?,currval('photo_idphoto_seq'))";
    private static final String SQL_INSERT_PHOTO = "INSERT INTO photo(idphoto, libelle) VALUES (DEFAULT,?)";
    private static final String SQL_SELECT_USER = "SELECT utilisateur.idutilisateur,utilisateur.nom, utilisateur.prenom, utilisateur.adresse, utilisateur.latitude, utilisateur.longitude,profilimg.libelle,publiall.info  FROM utilisateur,profilimg,publiall WHERE utilisateur.idutilisateur=? AND publiall.utilisateur_id=utilisateur.idutilisateur AND profilimg.utilisateur_id=utilisateur.idutilisateur";
    private static final String SQL_SELECT_PUB = "SELECT img,titre,type FROM pub";
    
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
                preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_ALL_SINGLE_UI, false, type, id);
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

    public Utilisateur getUser(int id) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Utilisateur perso = null;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_USER, false, id);
            resultSet = preparedStatement.executeQuery();
             while(resultSet.next()) {
                perso = mapinfo(resultSet);
            }
            return perso;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }

    }

    public void creer(Annonce annonce, int type) throws Exception {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement preparedStatementPhoto = null;
        ResultSet valeursAutoGenerees = null;
        try {
            // idservice, idcategorie, idutilisateur,titre, description, datepublication,datedebutdisponibilite ,datefindisponibilite, type , image
            connexion = daoFactory.getConnection();
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT_ANNONCE, true, annonce.getIdCategorie(),
                    annonce.getUtilisateur().getId(),
                    annonce.getTitre(),
                    annonce.getDescription(),
                    annonce.getDateDebut(),
                    annonce.getDateFin(),
                    type
            );

            preparedStatementPhoto = initialisationRequetePreparee(connexion, SQL_INSERT_PHOTO, true, annonce.getImg());
            int statusPhoto = preparedStatementPhoto.executeUpdate();
            int statusPass = preparedStatement.executeUpdate();
            //System.out.println("fdfd");
            if (statusPass == 0 && statusPhoto == 0) {
                throw new DAOException("Échec de la création de l'annonce, aucune ligne ajoutée dans la table.");
            }
            valeursAutoGenerees = preparedStatement.getGeneratedKeys();
            if (valeursAutoGenerees.next()) {
                // annonce.setIdAnnonce(valeursAutoGenerees.getLong(1));
            } else {
                throw new DAOException("Échec de la création de l'annonce en base, aucun ID auto-généré retourné.");
            }
            connexion.commit();
        } catch (Exception e) {
            connexion.rollback();
            e.printStackTrace();
            throw new DAOException(e);
        } finally {
            fermeturesSilencieuses(valeursAutoGenerees, preparedStatement, connexion);
        }
    }
    public Publicite[] affichepub() throws DAOException {
           Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Publicite perso = null;
        ArrayList<Publicite> tab = new ArrayList<Publicite>();
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion,SQL_SELECT_PUB, false);
            resultSet = preparedStatement.executeQuery();
             while(resultSet.next()) {
                perso = mappub(resultSet);
                tab.add(perso);
            }
            Publicite[] persoliste = new Publicite[tab.size()];
            for(int i=0;i<tab.size();i++){
                persoliste[i]=tab.get(i);
            }
            return persoliste;
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

        utilisateur.setIdAnnonce(resultSet.getInt("idservice"));
        utilisateur.setImg(resultSet.getString("libelle"));
        utilisateur.setidCategorie(resultSet.getString("idcategorie"));
        utilisateur.setCategorie(resultSet.getString("designation"));//categorie
        utilisateur.setIdutilisateur(resultSet.getInt("idutilisateur"));
        utilisateur.setTitre(resultSet.getString("titre"));
        utilisateur.setDescription(resultSet.getString("description"));
        utilisateur.setDatePublication(resultSet.getDate("datepublication"));
        utilisateur.setDateDebut(resultSet.getDate("datedebutdisponibilite"));
        utilisateur.setDateFin(resultSet.getDate("datefindisponibilite"));
        utilisateur.setUtilisateur(user_annonceur);
        return utilisateur;
    }

    private static Utilisateur mapinfo(ResultSet resultSet) throws SQLException {
        Utilisateur user_annonceur = new Utilisateur();
        user_annonceur.setId(resultSet.getInt("idutilisateur"));
        user_annonceur.setNom(resultSet.getString("nom"));
        user_annonceur.setPrenom(resultSet.getString("prenom"));
        user_annonceur.setAdresse(resultSet.getString("adresse"));
        user_annonceur.setLatitude(resultSet.getDouble("latitude"));
        user_annonceur.setLongitude(resultSet.getDouble("longitude"));
        user_annonceur.setImg(resultSet.getString("libelle"));
        user_annonceur.setPublication(resultSet.getString("info"));
        return user_annonceur;
    }
    private static Publicite  mappub(ResultSet resultSet)throws SQLException {
        Publicite pub=new Publicite ();
        pub.setImg(resultSet.getString("img"));
        pub.setTitre(resultSet.getString("titre"));
        pub.setType(resultSet.getInt("type"));
        return pub;
    }
    
}
