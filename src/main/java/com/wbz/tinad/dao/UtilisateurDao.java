/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Utilisateur;


public interface UtilisateurDao {

    void creer( Utilisateur utilisateur ) throws DAOException;

    Utilisateur trouver( String email ) throws DAOException;

    Utilisateur[] listeMembres() throws DAOException;

}