/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUnique;
import Modele.Contrat;
import Modele.Entreprise;
import Modele.Facture;
import Modele.Offre;
import Modele.UtilisateurClient;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface GestionClientLocal {

    public ClientUnique CreerClientUnique(String nom, String prenom, String login, String mdp, Date dateCreationUser, String typeUser, String iban, String mail);

    ClientUnique RechercherClientUnique(long IdclientUnique);

    ClientUnique AuthentificationClientUnique(String LoginClientUnique, String PasswordClientUnique);

    public Entreprise AuthentificationEntreprise(String LoginEntreprise, String PasswordEntreprise);
    String HashageSha256(String mdp);

    Entreprise CreerEntreprise(String login, String mdp, Date dateCreationUser, String typeUser, String raisonSocial,String siegeSocial, Date dateCreationEntreprise, String tailleEntreprise, String mail);

    Contrat CreerContrat(Offre Loffre, UtilisateurClient Client, int DureeContrat);

    public List<Contrat> RecupererContratClientUnique(ClientUnique Client);

    public void ModificationClientUnique(ClientUnique Client, String prenom, String nom, String login, String mdp, String iban, String mail);

    Entreprise RechercherEntreprise(long Id);

    public void ModifierEntreprise(Entreprise Boite, String login, String mdp, String raisonSocial, String siegeSocial, String tailleEntreprise, String mail);

    Contrat RechercherContrat(long id);

    public List<Contrat> GetListContrat();

    public Facture CreerFacture(String typePaiement, Date datePaiement, boolean validationPaiement);

    void ValiderInscriptionClientUnique(ClientUnique client);

    public void ValiderInscriptionEntreprise(Entreprise boite);
    List RecupererContratSouscritEntreprise(Entreprise entreprise);

    public void ResilierContratEntreprise(Long numContrat);

    public void ResilierContratClient(Long numContrat);

  
}
