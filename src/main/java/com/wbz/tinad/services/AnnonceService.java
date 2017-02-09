/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;

import Utilitaire.DateUtil;
import com.google.gson.Gson;
import com.wbz.tinad.beans.Annonce;
import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.AnnonceDao;
import java.util.ArrayList;

/**
 *
 * @author davra
 */
public class AnnonceService {

    private AnnonceDao annonceDao;

    public AnnonceService(AnnonceDao annonceDao) {
        this.annonceDao = annonceDao;
    }

    public ArrayList<String> offrepublic() {
        Gson json = new Gson();
        String wawa = json.toJson(annonceDao.afficheOffre(0, 0));
        String tab1 = json.toJson(annonceDao.afficheOffre(1, 0));
        String js = wawa.substring(1, wawa.length() - 1);
        String jsa = tab1.substring(1, tab1.length() - 1);
        ArrayList<String> tab = new ArrayList<String>();
        tab.add("{\"wawa\":[" + js + "]},{\"demande\":[" + jsa + "]}");
        return tab;
    }
     public ArrayList<String> offrepub() {
        Gson json = new Gson();
        String wawa = json.toJson(annonceDao.affichepub());
        String js = wawa.substring(1, wawa.length() - 1);
        ArrayList<String> tab = new ArrayList<String>();
        tab.add("{\"publicite\":[" + js + "]}");
        return tab;
    }

    public ArrayList<String> infoprofil(int id) {
        Gson json = new Gson();
        String wawa = json.toJson(annonceDao.afficheOffre(0, id));
        String tab1 = json.toJson(annonceDao.afficheOffre(1, id));
        String tab2= json.toJson(annonceDao.getUser(id));
        String js = wawa.substring(1, wawa.length() - 1);
        String jsa = tab1.substring(1, tab1.length() - 1);
        String jsp=tab2.substring(1, tab2.length() - 1);
        ArrayList<String> tab = new ArrayList<String>();
        tab.add("{\"offre\":[" + js + "]},{\"demande\":[" + jsa + "]},{\"utilisateur\":[{" + jsp + "}]}");
        return tab;
    }

    public void creer(String idUser, String idCategorie, String type, String titre, String description, String dateDebut, String dateFin, String image) throws Exception {
        Annonce annonce = new Annonce();
        annonce.setUtilisateur(new Utilisateur(idUser));
        annonce.setidCategorie(idCategorie);
        annonce.setIdCategorie(Integer.parseInt(idCategorie));
        annonce.setTitre(titre);
        annonce.setDescription(description);
        annonce.setDateDebut(DateUtil.convertToDateWithException(dateDebut));
        annonce.setDateFin(DateUtil.convertToDateWithException(dateFin));
        annonce.setImg(image);
        System.out.print(annonce.getIdCategorie());
        annonceDao.creer(annonce, Integer.valueOf(type));
    }

}
