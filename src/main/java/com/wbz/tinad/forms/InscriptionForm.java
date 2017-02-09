
package com.wbz.tinad.forms;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.wbz.tinad.beans.Utilisateur;
import com.wbz.tinad.dao.DAOException;
import com.wbz.tinad.dao.UtilisateurDao;

public final class InscriptionForm {
    private static final String CHAMP_EMAIL           = "email";
    private static final String CHAMP_PASS            = "motdepasse";
    private static final String CHAMP_CONF            = "confirmation";
    private static final String CHAMP_NOM             = "nom";
    private static final String CHAMP_PRENOM          ="prenom";
    private static final String CHAMP_LATITUDE        ="lat";
    private static final String CHAMP_LONGITUDE       ="lng";
    private static final String CHAMP_ADRESSE         ="position";
    private static final String CHAMP_GENRE           ="genre";
    private static final String CHAMP_SPECIALITE      ="specialite";

    private static final String ALGO_CHIFFREMENT = "SHA-256";

    private String              resultat;
    private Map<String, String> erreurs          = new HashMap<String, String>();
    private UtilisateurDao      utilisateurDao;

    public InscriptionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Utilisateur inscrireUtilisateur( HttpServletRequest request ) {
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        String confirmation = getValeurChamp( request, CHAMP_CONF );
        String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String genre= getValeurChamp(request, CHAMP_GENRE);
        String adresse= getValeurChamp(request, CHAMP_ADRESSE);
        String latitude =  getValeurChamp(request, CHAMP_LATITUDE);
        String longitude =  getValeurChamp(request, CHAMP_LONGITUDE);
        String specialite = getValeurChamp(request, CHAMP_SPECIALITE );
        Utilisateur utilisateur = new Utilisateur();
        try {
            traiterEmail( email, utilisateur );
            traiterMotsDePasse( motDePasse, confirmation, utilisateur );
            traiterNom( nom,prenom,genre,utilisateur );
            traiterAdresse(adresse,latitude,longitude,utilisateur);
            utilisateur.setSpecialite(specialite);

            if ( erreurs.isEmpty() ) {
                
                resultat = "SuccÈs de l'inscription.";
            } else {
                resultat = "Èchec de l'inscription.";
            }
        } catch ( DAOException e ) {
            resultat = "Èchec de l'inscription : une erreur imprÈvue est survenue, merci de rÈssayer dans quelques instants.";
        }

        return utilisateur;
    }

    private void traiterEmail( String email, Utilisateur utilisateur ) {
        try {
            validationEmail( email );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );
    }

    private void traiterMotsDePasse( String motDePasse, String confirmation, Utilisateur utilisateur ) {
        try {
            validationMotsDePasse( motDePasse, confirmation );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
            setErreur( CHAMP_CONF, null );
        }
        ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        passwordEncryptor.setAlgorithm(ALGO_CHIFFREMENT);
        passwordEncryptor.setPlainDigest(true);
        String motDePasseChiffre = passwordEncryptor.encryptPassword(motDePasse);        
        utilisateur.setMotDePasse(motDePasseChiffre);
    }
    private void traiterNom( String nom,String prenom,String genre, Utilisateur utilisateur ) {
        try {
            validationNom( nom );
            validationNom(prenom);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }
        utilisateur.setNom( nom );
        utilisateur.setPrenom(prenom);
        utilisateur.setSexe(genre);
        utilisateur.setImg("avatar.png");
    }
    
    private void validationEmail( String email ) throws FormValidationException {
        if ( email != null ) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
                throw new FormValidationException( "Merci de saisir une adresse mail valide." );
            } else if ( utilisateurDao.trouver( email ) != null ) {
                throw new FormValidationException( "Cette adresse email est d√©j√  utilis√©e, merci d'en choisir une autre." );
            }
        } else {
            throw new FormValidationException( "Merci de saisir une adresse mail." );
        }
    }

    /* Validation des mots de passe */
    private void validationMotsDePasse( String motDePasse, String confirmation ) throws FormValidationException {
        if ( motDePasse != null && confirmation != null ) {
            if ( !motDePasse.equals( confirmation ) ) {
                throw new FormValidationException( "Les mots de passe entr√©s sont diff√©rents, merci de les saisir √  nouveau." );
            } else if ( motDePasse.length() < 3 ) {
                throw new FormValidationException( "Les mots de passe doivent contenir au moins 3 caract√®res." );
            }
        } else {
            throw new FormValidationException( "Merci de saisir et confirmer votre mot de passe." );
        }
    }

    /* Validation du nom */
    private void validationNom( String nom ) throws FormValidationException {
        if ( nom != null && nom.length() < 3 ) {
            throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 3 caract√®res." );
        }
    }


    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

    private void traiterAdresse(String adresse, String latitude, String longitude ,Utilisateur u) {
        u.setAdresse(adresse);
        u.setLatitude(Double.parseDouble(latitude));
        u.setLongitude(Double.parseDouble(longitude));
        u.setStatut("11");
    }


}