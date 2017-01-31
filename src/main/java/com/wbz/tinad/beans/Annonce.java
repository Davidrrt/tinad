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
    private Long latitude;
    private Long longitude;

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

    public Long getLatitude() {
        return latitude;
    }

    public void setLatitude(Long latitude) {
        this.latitude = latitude;
    }

    public Long getLongitude() {
        return longitude;
    }

    public void setLongitude(Long longitude) {
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

}
