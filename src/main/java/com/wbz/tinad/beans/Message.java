package com.wbz.tinad.beans;
public class Message {
    private int idMessage;
    private int idAnnonce;
    private Utilisateur utilisateur=null;
    private Annonce annonce= null;
    private String description=null;
    private String contact=null;
    public Message(int idAnnonce,Utilisateur u, String description,String contact) {
        this.setContact(contact);
        this.setDescription(description);
        this.setIdAnnonce(idAnnonce);
        this.setUtilisateur(u);
    }    
    public Message(int idMessage, Annonce annonce,Utilisateur u, String description,String contact) {
        this.setIdMessage(idMessage);
        this.setAnnonce(annonce);
        this.setContact(contact);
        this.setDescription(description);
        this.setIdAnnonce(idAnnonce);
        this.setUtilisateur(u);
    }

    public Annonce getAnnonce() {
        return annonce;
    }

    public void setAnnonce(Annonce annonce) {
        this.annonce = annonce;
    }
    public Message() {
      
    }

    public void setIdMessage(int idMessage) {
        this.idMessage = idMessage;
    }

    public void setIdAnnonce(int idAnnonce) {
        this.idAnnonce = idAnnonce;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getIdMessage() {
        return idMessage;
    }

    public int getIdAnnonce() {
        return idAnnonce;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public String getDescription() {
        return description;
    }

    public String getContact() {
        return contact;
    }
   
}
