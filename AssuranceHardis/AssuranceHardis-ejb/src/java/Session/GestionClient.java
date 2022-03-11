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
    private ContratFacadeLocal contratFacade;

    @EJB
    private EntrepriseFacadeLocal entrepriseFacade;

    @EJB
    private ClientUniqueFacadeLocal clientUniqueFacade;
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @Override
    public void CreerClientUnique(String nom, String prenom, String login, String mdp, Date dateCreationUser, String typeUser, String iban, String mail) {
        clientUniqueFacade.CreationClientUnique(prenom, nom, login, mdp, dateCreationUser, typeUser, iban, mail);
    }

    @Override
    public ClientUnique RechercherClientUnique(long IdclientUnique) {
        return null;
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
    public void CreerEntreprise(String nom, String login, String mdp, String typeUser, String raisonSocial, Date dateCreationEntreprise, String siegeSocial, String tailleEntreprise, String mail, Date dateCreationCompte) {
        entrepriseFacade.CreerEntreprise(nom, login, mdp, dateCreationCompte, typeUser, raisonSocial, dateCreationEntreprise, siegeSocial, tailleEntreprise, mail);
    }

    @Override
    public void CreerContrat(Offre Loffre, UtilisateurClient Client, int DureeContrat) {
        contratFacade.CreerContrat(Loffre, DureeContrat, Client);
    }

    @Override
    public List<Contrat> RecupererContratClient(UtilisateurClient Client) {
        List<Contrat> ContratClient = new ArrayList();
        ContratClient = contratFacade.RecupererContratSouscrit(Client);
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

}
