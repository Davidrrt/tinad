/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.beans;

import java.sql.Date;

/**
 *
 * @author davra
 */
public class Annonce {

    private int idCategorie;
    private int idutilisateur;
    
    private String categorie= null;
    private Utilisateur utilisateur= null;
    
    private String titre;
    private String description;
    private Date dateDebut;
    private Date datefin;
    private String img;
    private String idcategorie;

    public Annonce() {

    }
    
    
    public void setCategorie(String newCategorie) {
        this.categorie= newCategorie;
    }
    public String getCategorie() {
        return this.categorie;
    }
    public void setUtilisateur(Utilisateur u) {
        this.utilisateur=u;
    }
    public Utilisateur getUtilisateur(){
        return this.utilisateur;
    }
    
    public void setIdCategorie(int aInt) {
        this.idCategorie = aInt;
    }
    
    
    public int getIdCategorie() {
        return this.idCategorie;
    }

    public void setIdutilisateur(int aInt) {
        this.idutilisateur = aInt;
    }

    public int getIdutilisateur() {
        return this.idutilisateur;
    }

    public void setTitre(String string) {
        this.titre = string;
    }

    public String getTitre() {
        return this.titre;
    }

    public void setDescription(String string) {
        this.description = string;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDateDebut(Date timestamp) {
        this.dateDebut = timestamp;
    }

    public Date getDateDebut() {
        return this.dateDebut;
    }

    public void setDateFin(Date timestamp) {
        this.datefin = timestamp;
    }

    public Date getDateFin() {
        return this.datefin;
    }

    public void setImg(String string) {
        this.img=string;
    }
     public String getImg() {
        return this.img;
    }
    public String getidCategorie() {
       return this.idcategorie;
    }
    public void setidCategorie(String string) {
        this.idcategorie=string;
    }
}
