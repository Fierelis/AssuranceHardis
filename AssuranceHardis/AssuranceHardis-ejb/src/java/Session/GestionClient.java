/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUnique;
import Modele.ClientUniqueFacadeLocal;
import Modele.Contrat;
import Modele.ContratFacadeLocal;
import Modele.Entreprise;
import Modele.EntrepriseFacadeLocal;
import Modele.Facture;
import Modele.FactureFacadeLocal;
import Modele.Offre;
import Modele.UtilisateurClient;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionClient implements GestionClientLocal {

    @EJB
    private FactureFacadeLocal factureFacade;

    @EJB
    private ContratFacadeLocal contratFacade;

    @EJB
    private EntrepriseFacadeLocal entrepriseFacade;

    @EJB
    private ClientUniqueFacadeLocal clientUniqueFacade;
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public ClientUnique CreerClientUnique(String nom, String prenom, String login, String mdp, Date dateCreationUser, String typeUser, String iban, String mail) {
        ClientUnique ClientU = clientUniqueFacade.CreationClientUnique(prenom, nom, login, mdp, dateCreationUser, typeUser, iban, mail);
        return ClientU;
    }

    @Override
    public ClientUnique RechercherClientUnique(long IdclientUnique) {
        ClientUnique ClientU = clientUniqueFacade.RechercheClientUnique(IdclientUnique);
        return ClientU;
    }

    @Override
    public ClientUnique AuthentificationClientUnique(String LoginClientUnique, String PasswordClientUnique) {
        ClientUnique Clientu = clientUniqueFacade.AuthentificationClientUnique(LoginClientUnique, PasswordClientUnique);
        return Clientu;
    }

    @Override
    public Entreprise AuthentificationEntreprise(String LoginEntreprise, String PasswordEntreprise) {
        Entreprise Boite = entrepriseFacade.AuthentificationEntreprise(LoginEntreprise, PasswordEntreprise);
        return Boite;
    }

    @Override
    public String HashageSha256(String mdp) {
        return clientUniqueFacade.HashageSha256(mdp);
    }

    @Override
    public Entreprise CreerEntreprise(String login, String mdp, Date dateCreationUser, String typeUser, String raisonSocial,String siegeSocial, Date dateCreationEntreprise, String tailleEntreprise, String mail) {
        //String login, String mdp, Date dateCreationUser, String typeUser, String raisonSocial, Date dateCreationEntreprise, String siegeSocial, String tailleEntreprise, String mail) {
        Entreprise Boite = entrepriseFacade.CreerEntreprise(login, mdp, dateCreationUser,typeUser, raisonSocial, siegeSocial,dateCreationEntreprise, tailleEntreprise, mail);
        return Boite;
    }

    @Override
    public Contrat CreerContrat(Offre Loffre, UtilisateurClient Client, int DureeContrat) {
        Contrat con = contratFacade.CreerContrat(Loffre, DureeContrat, Client);
        return con;
    }

    @Override
    public List<Contrat> RecupererContratClientUnique(ClientUnique Client) {
        List<Contrat> ContratClient = contratFacade.RecupererContratSouscritClient(Client);
        return ContratClient;
    }
    @Override
    public void ModificationClientUnique(ClientUnique Client, String prenom, String nom, String login, String mdp, String iban, String mail){
        clientUniqueFacade.ModificationClientUnique(Client, prenom, nom, login, mdp, iban, mail);
    }
    @Override
    public void ModifierEntreprise(Entreprise Boite,String login, String mdp,String raisonSocial, String siegeSocial, String tailleEntreprise, String mail) {
        entrepriseFacade.ModifierEntreprise(Boite, login, mdp, raisonSocial,  siegeSocial, tailleEntreprise, mail);
    }

    @Override
    public Entreprise RechercherEntreprise(long Id) {
        return entrepriseFacade.RechercheEntreprise(Id) ;
    }

    @Override
    public Contrat RechercherContrat(long id) {
        return contratFacade.RechercherContrat(id);
    }
    @Override
    public List<Contrat> GetListContrat(){
        return contratFacade.GetListContrat();
    }
    
    @Override
     public Facture CreerFacture(String typePaiement, Date datePaiement, boolean validationPaiement) {
         Facture f = factureFacade.CreerFacture(typePaiement, datePaiement, validationPaiement);
         return f;
     }

    @Override
    public void ValiderInscriptionClientUnique(ClientUnique client) {
        clientUniqueFacade.ValiderInscription(client);
    }
     @Override
    public void ValiderInscriptionEntreprise(Entreprise boite) {
        entrepriseFacade.ValiderInscription(boite);
    }

    public List RecupererContratSouscritEntreprise(Entreprise entreprise) {
        return contratFacade.RecupererContratSouscritEntreprise(entreprise);
    }
    @Override
    public void ResilierContratClient(Long numContrat) {
    clientUniqueFacade.ResilierContratClient(numContrat);
}
    @Override
    public void ResilierContratEntreprise(Long numContrat) {
    entrepriseFacade.ResilierContratEntreprise(numContrat);
}
}
