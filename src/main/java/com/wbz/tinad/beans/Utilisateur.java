/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.beans;

import java.sql.Date;

public class Utilisateur {

    private int id;
    public String email;
    private String motDePasse;
    private String nom;
    private String prenom;
    private String sexe;
    private Date dateInscription;
    private String specialite;
    private String adresse;
    private double latitude;
    private double longitude;
    private String publication;
    private String statut;
    private String img;

    public Utilisateur(String email, String password) {
        this.setEmail(email);
        this.setMotDePasse(password);
    }

    public Utilisateur() {

    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatut() {
        return this.statut;
    }

    public void setStatut(String newStatut) {
        this.statut = newStatut;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setPublication(String publica) {
        this.publication = publica;
    }

    public String getPublication() {
        return this.publication;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setSexe(String nom) {
        this.sexe = nom;
    }

    public String getSexe() {
        return this.sexe;
    }

    public void setPrenom(String nom) {
        this.prenom = nom;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public Date getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(Date dateInscription) {
        this.dateInscription = dateInscription;
    }

    public String getSpecialite() {
        return this.specialite;
    }

    public void setSpecialite(String newSpecialite) {
        this.specialite = newSpecialite;
    }

    public String getAdresse() {
        return this.adresse;
    }

    public void setAdresse(String newAdresse) {
        this.adresse = newAdresse;
    }

    public double getLatitude() {
        return this.latitude;
    }

    public void setLatitude(double newLatitude) {
        this.latitude = newLatitude;
    }

    public double getLongitude() {
        return this.longitude;
    }

    public void setLongitude(double newLongitude) {
        this.longitude = newLongitude;
    }

    public String getImg() {
        return this.img;
    }

    public void setImg(String image) {
        this.img = image;
    }

}
