/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;

import com.google.gson.Gson;
import com.wbz.tinad.dao.AnnonceDao;

/**
 *
 * @author davra
 */
public class AnnonceService {

    private AnnonceDao annonceDao;

    public String offrepublic() {
        Gson json = new Gson();
        String wawa=json.toJson(annonceDao.afficheOffre(0));
        return wawa;
    }

    public String demandepublic() {
        Gson json = new Gson();
        return json.toJson(annonceDao.afficheOffre(1));
    }
}
