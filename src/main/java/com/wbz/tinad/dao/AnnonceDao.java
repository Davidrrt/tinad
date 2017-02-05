/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;

/**
 *
 * @author davra
 */
public interface AnnonceDao {
    
    Annonce[] afficheOffre(int type,int id) throws DAOException;
    
}
