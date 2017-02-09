/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.beans;

/**
 *
 * @author davra
 */
public class Evenement {

    private String img;
    private String titre;
    private String contenu;
    private String datevent;

    public String getImg() {
        return img;
    }

    public String getTitre() {
        return titre;
    }

    public String getContenu() {
        return contenu;
    }

    public String getDatevent() {
        return datevent;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public void setDatevent(String datevent) {
        this.datevent = datevent;
    } 
}
