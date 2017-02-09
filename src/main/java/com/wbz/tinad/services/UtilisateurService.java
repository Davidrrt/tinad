/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.services;


import com.google.gson.Gson;
import com.wbz.tinad.dao.UtilisateurDao;
import java.util.*;
import java.security.Key;
import io.jsonwebtoken.*;
import io.jsonwebtoken.impl.crypto.MacProvider;
import java.util.Date;

public class UtilisateurService {

    private UtilisateurDao utilisateurDao;
    private static final Key secret = MacProvider.generateKey(SignatureAlgorithm.HS256);  
    private static final byte[] secretBytes = secret.getEncoded();
    private static final String base64SecretBytes = Base64.getEncoder().encodeToString(secretBytes);

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
      
    public static String generateToken(String subject, String issuer, String username, boolean admin) {
        String id = UUID.randomUUID().toString().replace("-", "");
        Date now = new Date();
        Date exp = new Date(System.currentTimeMillis() + (1000 * 30)); // 30 seconds
        String token = Jwts.builder()
            .setId(id)
            .setIssuedAt(now)
            .setSubject(subject)
            .setIssuer(issuer)
            .setNotBefore(now)
            .setExpiration(exp)
            .claim("username", username)           
            .claim("admin", admin)
            .signWith(SignatureAlgorithm.HS256, base64SecretBytes)
            .compact();
        return token;
    }
    public static Claims verifyToken(String token) {
       return Jwts.parser()
            .setSigningKey(base64SecretBytes)
            .parseClaimsJws(token).getBody();     
    }

}
