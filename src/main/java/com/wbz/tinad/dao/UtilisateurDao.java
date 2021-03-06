/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Utilisateur;

public interface UtilisateurDao {

    public void creer( Utilisateur utilisateur ) throws DAOException;

    public Utilisateur trouver( String email ) throws DAOException;
    
    public int verifierUtilisateur (Utilisateur utilisateur) throws DAOException;
    
    public Utilisateur[] getMembres () throws DAOException ;

    public void inserStatut(String id, String contenue) throws Exception;
    int getidUtilisateur(Utilisateur utilisateur) throws DAOException;

}