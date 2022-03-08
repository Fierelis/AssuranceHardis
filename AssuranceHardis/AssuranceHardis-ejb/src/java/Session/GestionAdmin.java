/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Administrateur;
import Modele.AdministrateurFacadeLocal;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionAdmin implements GestionAdminLocal {

    @EJB
    private AdministrateurFacadeLocal administrateurFacade;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void CreerAdministrateur(String NomAdmin, String PrenomAdmin, String MailAdmin, String LoginAdmin, String PasswordAdmin) {
        administrateurFacade.CreerAdministrateur(NomAdmin, PrenomAdmin, MailAdmin, LoginAdmin, PasswordAdmin, PasswordAdmin);
    }

    @Override
    public Administrateur RechercherAdministrateur(long IdAdmin) {
        Administrateur Admin = administrateurFacade.RechercherAdministrateur(IdAdmin);
        return Admin;
    }

    @Override
    public void SupprimerAdministrateur(long IdAdmin) {
        administrateurFacade.SupprimerAdministrateur(IdAdmin);
    }

    @Override
    public Administrateur AuthentificationAdmin(String LoginAdmin, String PasswordAdmin) {
        Administrateur Admin = administrateurFacade.AuthentificationAdmin(LoginAdmin, PasswordAdmin);
        return Admin;
    }
    
    
    
    
}
