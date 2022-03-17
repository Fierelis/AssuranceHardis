/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;
import Modele.Offre;
import Modele.Assureur;
import Modele.Courtier;
import Modele.TypeProduit;
import Modele.UtilisateurService;
import java.util.Date;
import java.util.List;
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

    public List<Offre> FiltrerOffre(String filtre, Courtier Court, Assureur Assur);

    List RechercheTypeOffre(String typeOffre);

    List RechercheParTypeUtilisateur(String typeUser);

    List GetListOffreAll();

    List RechercheCourtierPartenaire(long idAssurance);

    void CreerTypeProduit(String nom);

    TypeProduit rechercheTypeProduit(String nom);
    
    public void ModifierInformationsCourtier(Courtier court, String NomCourtier, String PrenomCourtier, String AdresseCourtier, String MailCourtier, String LoginUserServiceCourtier, String PasswordUserServiceCourtier, String VilleCourtier, String CPCourtier);

    public void CreerOffre(String TypeOffre, double PrixOffre, String DescriptionOffre, boolean OffreActive, UtilisateurService IdUtilisateurService, Assureur PartenariatAssurance, TypeProduit LeTypeDeProduit, Courtier LeCourtier,String RSAssureurPartenaire);
    List GetAllOffreAssureur(long idAssureur);

    Offre RechercherOffre(long id);
    
    
    
}
