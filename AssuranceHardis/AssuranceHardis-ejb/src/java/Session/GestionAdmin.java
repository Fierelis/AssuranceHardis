/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Administrateur;
import Modele.AdministrateurFacadeLocal;
import Modele.Assureur;
import Modele.AssureurFacadeLocal;
import Modele.ClientUnique;
import Modele.Contrat;
import Modele.Courtier;
import Modele.CourtierFacadeLocal;
import Modele.Entreprise;
import Modele.Logs;
import Modele.LogsFacadeLocal;
import Modele.Offre;
import Modele.UtilisateurClient;
import Modele.UtilisateurService;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionAdmin implements GestionAdminLocal {

    @EJB
    private AssureurFacadeLocal assureurFacade;

    @EJB
    private CourtierFacadeLocal courtierFacade;

    @EJB
    private LogsFacadeLocal logsFacade;

    @EJB
    private AdministrateurFacadeLocal administrateurFacade;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public Administrateur CreerAdministrateur(String NomAdmin, String PrenomAdmin, String MailAdmin, String LoginAdmin, String PasswordAdmin) {
        Administrateur admin = administrateurFacade.CreerAdministrateur(NomAdmin, PrenomAdmin, MailAdmin, LoginAdmin, PasswordAdmin, PasswordAdmin);
        return admin;
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
    @Override
    public void CreerLog(ClientUnique LeClient,Entreprise Lentreprise, Courtier LeCourtier, Assureur Lassureur, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog) {
            logsFacade.CreerLog(LeClient,Lentreprise,LeCourtier,Lassureur, Loffre, LeContrat, LAdmin, TypeLog);
        }
    @Override
    public List<Logs> GetAllLogs(){
        List<Logs> Logs= logsFacade.GetAllLogs();
        return Logs;
    }
    @Override
    public List<Courtier> GetListCourtier(){
        List<Courtier> Court= courtierFacade.GetListCourtier() ;
        return Court;
    }
    @Override
    public List<Assureur> GetListAssureur(){
        List<Assureur> Assur= assureurFacade.GetListAssureurs();
        return Assur;
    }
    
    @Override
     public List<Logs> RecupLogByType(String TypeLog){
         List<Logs> LesLogs = logsFacade.RecupLogByType(TypeLog);
         return LesLogs;
     }

    @Override
    public List getAllAdmin() {
        return administrateurFacade.getAllAdmin();
    }
}