/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class UtilisateurService {     
    public boolean sendMail(String to, String from, String host, String subject, String message) throws MessagingException {
      //Get the session object  
      Properties properties = System.getProperties();  
      properties.setProperty("mail.smtp.host", host);  
      Session session = Session.getDefaultInstance(properties); 
        try{  
            MimeMessage mimeMessage = new MimeMessage(session);  
            mimeMessage.setFrom(new InternetAddress(from));  
            mimeMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            mimeMessage.setSubject(subject);  
            mimeMessage.setText(message); 
         // Send message  
            Transport.send(mimeMessage);            
        }catch (MessagingException mex) {
            //mex.printStackTrace();
            throw new MessagingException("Mail non envoye!");
        }
        return true;
    }
}
