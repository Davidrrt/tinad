/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;

import com.google.gson.Gson;
import com.wbz.tinad.beans.Message;
import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.MessageDao;

public class MessageService {
    private final MessageDao messageDao;
    public MessageService(MessageDao messageDao){
        this.messageDao= messageDao;
    }
    
    public void createMessage(String idEnvoyeur, String description, String annonce_id, String contact) throws Exception {
                            //new MESSAGE//int idAnnonce,Utilisateur u, String description,String contact
        messageDao.crer(new Message(Integer.parseInt(annonce_id), new Utilisateur(idEnvoyeur), description, contact));
    }
    
    public String afficheMessage(String idUtilisateur) throws Exception{
        Gson json= new Gson();
        return json.toJson(messageDao.listMessage(new Utilisateur(idUtilisateur)));
    }
}
