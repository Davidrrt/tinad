
package com.wbz.tinad.dao;
 
import com.wbz.tinad.beans.Annonce;
import com.wbz.tinad.beans.Message;
import com.wbz.tinad.beans.Utilisateur;
import static com.wbz.tinad.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.wbz.tinad.dao.DAOUtilitaire.initialisationRequetePreparee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageDaoImpl implements MessageDao{
    private DAOFactory daoFactory;
    private static final String SQL_INSERT_MESSAGE ="INSERT INTO message (idmessage, envoyeur, description, date_message, annonce_id, contact) VALUES (DEFAULT,?,?,NOW(),?,?)";
    private static final String SQL_SELECT_MESSAGE ="SELECT idmessage ,idservice, envoyeur,datepublication, description,date_message, contact, idutilisateur, nom,prenom, image,designation, titre,descri,idenvoyeur,nomenvoyeur,prenomenvoyeur,emailenvoyeur,sexeenvoyeur,adresseenvoyeur,latitudeenvoyeur,longitudeenvoyeur,imageenvoyeur FROM mess WHERE idutilisateur=?";
  
    public MessageDaoImpl(DAOFactory daoFactory) {
        this.daoFactory= daoFactory;
    }
    public void crer(Message m) throws Exception {   
        Connection connexion = null;
        PreparedStatement preparedStatement = null;         
        ResultSet valeursAutoGenerees = null;
        try {            
                                                                                //idmessage,envoyeur,description,date_message,annonce_id,contact
            connexion = daoFactory.getConnection(); 
            connexion.setAutoCommit(false);
            preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT_MESSAGE,true,   m.getUtilisateur().getId(),
                                                                                                    m.getDescription(),
                                                                                                    m.getIdAnnonce(),
                                                                                                    m.getContact()                                                                                            
                                                                                                    );
           
            int statusMessage = preparedStatement.executeUpdate();           
            if ( statusMessage == 0) {
                throw new DAOException("Échec de la création de l'annonce, aucune ligne ajoutée dans la table.");
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
    

    public Message[] listMessage(Utilisateur utilisateur) throws Exception {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Message> tab = new ArrayList<Message>();
        try {
            connexion = daoFactory.getConnection();            
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_MESSAGE, false, utilisateur.getId());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tab.add(map(resultSet));
            }
            Message[] messages = null;
            messages = new Message[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                messages[i] = tab.get(i);
            }
            return messages;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
    }
    
    private static Message map(ResultSet resultSet) throws SQLException {       
        Utilisateur utilisateur = new Utilisateur();
                    utilisateur.setId(Integer.parseInt(resultSet.getString("idutilisateur")));
                    utilisateur.setNom(resultSet.getString("nom"));
                    utilisateur.setPrenom(resultSet.getString("prenom"));
                    utilisateur.setImg(resultSet.getString("image"));
         Annonce annonce= new Annonce();
                 annonce.setIdAnnonce(resultSet.getInt("idService"));
                 annonce.setUtilisateur(utilisateur);
                 annonce.setTitre(resultSet.getString("titre"));
                 annonce.setDescription(resultSet.getString("descri")); 
                 annonce.setDatePublication(resultSet.getDate("datepublication"));                 
            /*idenvoyeur,nomenvoyeur ,prenomenvoyeur, emailenvoyeur, adresseenvoyeur,latitudeenvoyeur,
            longitudeenvoyeur,  sexeenvoyeur,  specialiteenvoyeur, dateinscriptionenvoyeur,
            statusenvoyeur,*/
                 Utilisateur envoyeur= new Utilisateur();
                             envoyeur.setId(resultSet.getInt("idenvoyeur"));
                             envoyeur.setNom(resultSet.getString("nomenvoyeur"));
                             envoyeur.setPrenom(resultSet.getString("prenomenvoyeur"));
                             envoyeur.setEmail(resultSet.getString("emailenvoyeur"));
                             envoyeur.setAdresse(resultSet.getString("adresseenvoyeur"));
                             envoyeur.setSexe(resultSet.getString("sexeenvoyeur"));
                             envoyeur.setLatitude(resultSet.getDouble("latitudeenvoyeur"));
                             envoyeur.setLongitude(resultSet.getDouble("longitudeenvoyeur"));
                             envoyeur.setImg(resultSet.getString("imageenvoyeur"));
                 
                           //NEW MESSAGE //idmessage, Annonce,Utilisateur u, description, contact
        return new Message( resultSet.getInt("idmessage"), annonce, envoyeur, resultSet.getString("description"), resultSet.getString("contact") );
    }
    
}
