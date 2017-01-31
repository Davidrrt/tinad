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

    private String nom;
    private String prenom;
    private String titre;
    private String description;
    private Date dateDebut;
    private Date datefin;
    private String adresse;
    private double latitude;
    private double longitude;
    private String categorie;
    private String id;

    public Annonce() {

    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDatefin() {
        return datefin;
    }

    public void setDatefin(Date datefin) {
        this.datefin = datefin;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
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
    public String getCategorie() {
        return this.categorie;
    }
    public void setCategorie(String string) {
        this.categorie=string;
    }
    public String getId(){
        return this.id;
    }
    public void setId(String string) {
        this.id=string;
    }

}
