/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Administrateur;
import Modele.Contrat;
import Modele.Offre;
import Modele.UtilisateurClient;
import Modele.UtilisateurService;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface GestionAdminLocal {

    void CreerAdministrateur(String NomAdmin, String PrenomAdmin, String MailAdmin, String LoginAdmin, String PasswordAdmin);

    Administrateur RechercherAdministrateur(long IdAdmin);

    void SupprimerAdministrateur(long IdAdmin);

    Administrateur AuthentificationAdmin(String LoginAdmin, String PasswordAdmin);

    public void CreerLog(UtilisateurClient LeClient, UtilisateurService LeService, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog);
    
}
