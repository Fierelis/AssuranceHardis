/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Assureur;
import Modele.Courtier;
import java.util.Date;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface GestionServiceLocal {


    public void CreerAssureur(String LoginUserService, String PasswordUserService, String TypeUserService, String RaisonSocialeAssureur, Date DateCreation, String MailAssurance, String SiegeSocialAssureur, long SIREN);

    Assureur RechercherAssureur(long IdAssureur);

    void SupprimerAssureur(long IdAssureur);

    public void CreerCourtier(String NomCourtier, String PrenomCourtier, Date DateNaissanceCourtier, String MailCourtier, String LoginCourtier, String PasswordCourtier, String TypeUserCourtier, String AdresseCourtier, String VilleCourtier, String CPCourtier);

    Courtier RechercherCourtier(long IdCourtier);

    void SupprimerCourtier(long IdCourtier); 

    Courtier AuthentificationCourtier(String LoginCourtier, String PasswordCourtier);

    Assureur AuthentificationAssureur(String LoginAssureur, String PasswordAssureur);
    
    
    
}
