/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Annonce;
import com.wbz.tinad.beans.Publicite;
import com.wbz.tinad.beans.Utilisateur;

/**
 *
 * @author davra
 */
public interface AnnonceDao {
    
    Annonce[] afficheOffre(int type,int id) throws DAOException;
    void creer(Annonce annonce, int type) throws Exception;
    Utilisateur getUser(int id) throws DAOException;
    Publicite[] affichepub()throws DAOException;
    
}
