/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUnique;
import Modele.ClientUniqueFacadeLocal;
import Modele.Entreprise;
import Modele.EntrepriseFacadeLocal;
import java.util.Date;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionClient implements GestionClientLocal {

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

}
