/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;

import com.google.gson.Gson;
import com.wbz.tinad.dao.UtilisateurDao;
import java.util.*;

public class UtilisateurService {

    private UtilisateurDao utilisateurDao;

    public UtilisateurService(UtilisateurDao utilisateurDao) {
        this.utilisateurDao = utilisateurDao;
    }

    public ArrayList<String> getallmembre() {

        Gson json = new Gson();
        String tab1 = json.toJson(utilisateurDao.getMembres());
        String jsa = tab1.substring(1, tab1.length() - 1);
        ArrayList<String> tab = new ArrayList<String>();
        tab.add("{\"membre\":[" + jsa + "]}");
        return tab;

    }
    
    public String printUserConnecte(String email) {
        Gson json = new Gson();
        return json.toJson(utilisateurDao.trouver(email));        
    }

}
