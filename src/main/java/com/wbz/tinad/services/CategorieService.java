/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;
 
import com.google.gson.Gson;
import com.wbz.tinad.dao.CategorieDao;

public class CategorieService {
    private  CategorieDao categorieDao = null;
    public CategorieService(CategorieDao categorieDao) {
        this.categorieDao = categorieDao;
    }
    public String printCategories() {         
        Gson json = new Gson();        
        return json.toJson(categorieDao.getAllCategorie());
    }
}
