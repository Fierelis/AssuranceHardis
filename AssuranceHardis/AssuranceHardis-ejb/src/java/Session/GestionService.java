/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.Assureur;
import Modele.AssureurFacadeLocal;
import Modele.Courtier;
import Modele.CourtierFacadeLocal;
import Modele.Offre;
import Modele.OffreFacadeLocal;
import Modele.TypeProduit;
import Modele.TypeProduitFacadeLocal;
import Modele.UtilisateurService;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionService implements GestionServiceLocal {

    @EJB
    private TypeProduitFacadeLocal typeProduitFacade;

    @EJB
    private OffreFacadeLocal offreFacade;

    @EJB
    private CourtierFacadeLocal courtierFacade;

    @EJB
    private AssureurFacadeLocal assureurFacade;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public Assureur CreerAssureur(String LoginUserService, String PasswordUserService, String TypeUserService, String RaisonSocialeAssureur, Date DateCreation, String MailAssurance, String SiegeSocialAssureur, long SIREN){
        Assureur Assur = assureurFacade.CreerAssureur(LoginUserService, PasswordUserService, TypeUserService, RaisonSocialeAssureur, DateCreation, MailAssurance, SiegeSocialAssureur, SIREN);
    return Assur;
    }

    @Override
    public Assureur RechercherAssureur(long IdAssureur) {
        Assureur Assur = assureurFacade.RechercherAssureur(IdAssureur);
        return Assur;
    }

    @Override
    public void SupprimerAssureur(long IdAssureur) {
        assureurFacade.SupprimerAssureur(IdAssureur);
    }

    @Override
    public Courtier CreerCourtier(String NomCourtier, String PrenomCourtier, Date DateNaissanceCourtier, String MailCourtier, String LoginCourtier, String PasswordCourtier, String TypeUserCourtier, String AdresseCourtier, String VilleCourtier, String CPCourtier) {
        Courtier court = courtierFacade.CreerCourtier(NomCourtier, PrenomCourtier, DateNaissanceCourtier, AdresseCourtier, MailCourtier, LoginCourtier, PasswordCourtier, TypeUserCourtier, VilleCourtier, CPCourtier);
    return court;
    }

    @Override
    public Courtier RechercherCourtier(long IdCourtier) {
        Courtier Court = courtierFacade.RechercherCourtier(IdCourtier);
        return Court;
    }

    @Override
    public void SupprimerCourtier(long IdCourtier) {
        courtierFacade.SupprimerCourtier(IdCourtier);
    }

    @Override
    public Courtier AuthentificationCourtier(String LoginCourtier, String PasswordCourtier) {
        Courtier Court = courtierFacade.AuthentificationCourtier(LoginCourtier, PasswordCourtier);
        return Court;
    }

    @Override
    public Assureur AuthentificationAssureur(String LoginAssureur, String PasswordAssureur) {
        Assureur Assur = assureurFacade.AuthentificationAssureur(LoginAssureur, PasswordAssureur);
        return Assur;
    }

    @Override
    public List<Offre> FiltrerOffre(String filtre, Courtier Court, Assureur Assur) {
        List <Offre> ListeFiltree = offreFacade.FiltrerOffre(filtre, Court, Assur);
        return ListeFiltree;
    }
    
    
    @Override
    public Offre CreerOffre(String TypeOffre, double PrixOffre, String DescriptionOffre, boolean OffreActive, UtilisateurService IdUtilisateurService, Assureur PartenariatAssurance , TypeProduit LeTypeDeProduit, Courtier LeCourtier, String RSAssureurPartenaire) {
        Offre offer = offreFacade.CreerOffre(TypeOffre, PrixOffre, DescriptionOffre, OffreActive, IdUtilisateurService, PartenariatAssurance, LeTypeDeProduit, LeCourtier, RSAssureurPartenaire);
        return offer;
    }

    @Override
    public List RechercheTypeOffre(String typeOffre) {
        return offreFacade.RechercherOffreParType(typeOffre);
    }

    
    @Override
    public List RechercheParTypeUtilisateur(String typeUser) {
        return offreFacade.RechercherOffreParTypeUtilisateur(typeUser);
    }

    @Override
    public List GetListOffreAll() {
        return offreFacade.GetListOffreAll();
    }

    @Override
    public List RechercheCourtierPartenaire(long idAssurance) {
        return courtierFacade.RechercheCourtierPartenaire(idAssurance);
    }

    @Override
    public void CreerTypeProduit(String nom) {
        typeProduitFacade.CreerTypeProduit(nom);
    }

    @Override
    public TypeProduit rechercheTypeProduit(String nom) {
        return typeProduitFacade.RechercherTypeProduit(nom);
    }

    
    @Override
    public void ModifierInformationsCourtier(Courtier court, String NomCourtier, String PrenomCourtier,  String AdresseCourtier, String MailCourtier, String LoginUserServiceCourtier, String PasswordUserServiceCourtier,  String VilleCourtier, String CPCourtier) {
        courtierFacade.ModifierInformationsCourtier(court, NomCourtier, PrenomCourtier, AdresseCourtier, MailCourtier, LoginUserServiceCourtier, PasswordUserServiceCourtier,  VilleCourtier, CPCourtier);
    }

    @Override
    public List GetAllOffreAssureur(long idAssureur) {
        return offreFacade.GetAllOffreAssureur(idAssureur);
    }

    @Override
    public Offre RechercherOffre(long id) {
        return offreFacade.RechercherOffre(id);
    }
    
}
