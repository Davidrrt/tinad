package com.wbz.tinad.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.DAOException;
import com.wbz.tinad.dao.UtilisateurDao;

public final class ConnexionForm {

    private static final String CHAMP_EMAIL = "email";
    private static final String CHAMP_PASS = "motdepasse";
    private Map<String, String> erreurs = new HashMap<String, String>();
    private UtilisateurDao utilisateurDao;
    private String resultat;
    private static final String ALGO_CHIFFREMENT = "SHA-256";

    public ConnexionForm(UtilisateurDao utilisateurDao) {
        this.utilisateurDao = utilisateurDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Utilisateur connexionUtilisateur(HttpServletRequest request) {
        String email = getValeurChamp(request, CHAMP_EMAIL);
        String motDePasse = getValeurChamp(request, CHAMP_PASS);

        Utilisateur utilisateur = new Utilisateur();
        traiterEmail(email, utilisateur);
        traiterMotdepasse(motDePasse, utilisateur);
        int i = utilisateurDao.verifierUtilisateur(utilisateur);
        try {
            if (i > 0) {
                utilisateur.setId(i);
                resultat = "SuccÈs";
            }

        } catch (DAOException e) {
                resultat = "Èchec de connexion";
        }
        return utilisateur;
    }

    private void traiterEmail(String email, Utilisateur utilisateur) {
        try {
            validationEmail(email);
        } catch (FormValidationException e) {
            setErreur(CHAMP_EMAIL, e.getMessage());
        }
        utilisateur.setEmail(email);
    }

    private void validationEmail(String email) throws FormValidationException {
        if (email != null) {
            if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
                throw new FormValidationException("Merci de saisir une adresse mail valide.");
            } else if (utilisateurDao.trouver(email) != null){
                throw new FormValidationException("Cette adresse email est d√©j√  utilis√©e, merci d'en choisir une autre.");
            }
        } else {
            throw new FormValidationException("Merci de saisir une adresse mail.");
        }
    }

    private void setErreur(String champ, String message) {
        erreurs.put(champ, message);
    }

    private static String getValeurChamp(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter(nomChamp);
        if (valeur == null || valeur.trim().length() == 0) {
            return null;
        } else {
            return valeur;
        }
    }

    public void traiterMotdepasse(String motDePasse, Utilisateur utilisateur) {
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm(ALGO_CHIFFREMENT);
        passwordEncryptor.setPlainDigest(true);
        String motDePasseChiffre = passwordEncryptor.encryptPassword(motDePasse);        
        utilisateur.setMotDePasse(motDePasseChiffre);
    }    
    
}
