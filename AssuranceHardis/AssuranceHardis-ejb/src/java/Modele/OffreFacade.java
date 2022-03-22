/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.ArrayList;
import Modele.Assureur;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author alex_
 */
@Stateless
public class OffreFacade extends AbstractFacade<Offre> implements OffreFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OffreFacade() {
        super(Offre.class);
    }

    @Override
    public Offre CreerOffre(String TypeOffre, double PrixOffre, String DescriptionOffre, boolean OffreActive, UtilisateurService IdUtilisateurService, Assureur Assurance, TypeProduit LeTypeDeProduit, Courtier LeCourtier, String RSAssureurPartenaire){
        Offre nouvelleOffre = new Offre();
        nouvelleOffre.setDescriptionOffreContractuelle(DescriptionOffre);
        nouvelleOffre.setOffreActive(OffreActive);
        nouvelleOffre.setOffreDeUtilisateurService(IdUtilisateurService);
        nouvelleOffre.setPrixOffre(PrixOffre);
        nouvelleOffre.setLeTypeDeProduit(LeTypeDeProduit);
        nouvelleOffre.setLAssurance(Assurance);
        nouvelleOffre.setTypeOffre(TypeOffre);
        nouvelleOffre.setLeCourtier(LeCourtier);
        nouvelleOffre.setRSAssureurPartenaire(RSAssureurPartenaire);
        em.persist(nouvelleOffre);
        return nouvelleOffre;
    }

    @Override
    public List<Offre> RechercherOffreParType(String TypeOffre) {
        List<Offre> ListeOffre = new ArrayList();
        String txt = "SELECT O "
                + "FROM Offre as O "
                + "WHERE O.TypeOffre = :TypeOffre";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("TypeOffre", TypeOffre);
        List<Long> result = req.getResultList();
        if (result.size() >= 1) {
            ListeOffre = req.getResultList();
        }
        return ListeOffre;

    }

    @Override
    public List<Offre> RechercherOffreParTypeUtilisateur(String TypeUtilisateur) {
        List<Offre> ListeOffre = new ArrayList();
        String txt = "SELECT O "
                + "FROM Offre as O "
                + "WHERE O.UtilisateurService.TypeUserService = :TypeUtilisateur";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("TypeUtilisateur", TypeUtilisateur);
        List<Long> result = req.getResultList();
        if (result.size() >= 1) {
            ListeOffre = req.getResultList();
        }
        return ListeOffre;
    }

    @Override
    public void SupprimerOffre(long IdOffre) {
        String txt = "DELETE FROM Offre as O WHERE O.id = :IdOffre ";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("IdOffre", IdOffre);
        req.executeUpdate();
    }

    @Override
    public List<Offre> FiltrerOffre(String Filtre, Courtier Court, Assureur Assur) {
        List<Offre> ListeFiltree = new ArrayList();
        if (Court != null) {
            long IdCourtier = Court.getId();
            if (Filtre.equals("PartenariatsAssureurs")) {
                String txt =    "SELECT O " //SELECT PartenariatAssurance
                        +       "FROM Offre as O "
                        +       "WHERE O.LAssurance is not Null and O.OffreDeUtilisateurService.id =:IdCourtier";
                Query req = getEntityManager().createQuery(txt);
                req.setParameter("IdCourtier", IdCourtier);
                List<Long> result = req.getResultList();
                if (result.size() >= 1) {
                    ListeFiltree = req.getResultList();
                }
            }
            if (Filtre.equals("OffrePartenaires")) {
                String txt =    "SELECT O "
                        +       "FROM Offre as O "
                        +       "WHERE O.LAssurance is not Null and O.OffreDeUtilisateurService.id =:IdCourtier";
                Query req = getEntityManager().createQuery(txt);
                req.setParameter("IdCourtier", IdCourtier);
                List<Long> result = req.getResultList();
                if (result.size() >= 1) {
                    ListeFiltree = req.getResultList();
                }
            }
            //if (Filtre.equals("")) {     // si beosin
            //}
        }
        if (Assur != null) {
            long IdAssureur = Assur.getId();
            if (Filtre.equals("CourtierPartenaires")) {
                String txt =    "SELECT O " // SELECT UtilisateurService
                        +       "FROM Offre as O "
                        +       "WHERE O.LAssurance is not Null and O.OffreDeUtilisateurService.id =:IdAssureur";
                Query req = getEntityManager().createQuery(txt);
                req.setParameter("IdAssureur", IdAssureur);
                List<Long> result = req.getResultList();
                if (result.size() >= 1) {
                    ListeFiltree = req.getResultList();
                }
            }
        }
        return ListeFiltree;
    }
    @Override
    public List GetListOffreAll() {
        try {
            String txt = "Select o from Offre as o"
                    + " where o.OffreActive=:bool";
            Query req = getEntityManager().createQuery(txt);
            req.setParameter("bool", true);
            List<Offre> result = req.getResultList();
            return result;
        } catch (Exception e) {
             return null;
        }   
    }

    @Override
    public List GetAllOffreAssureur(long idAssureur) {
        try {
            String txt = "Select o from Offre as o"
                    + " where o.OffreActive=:bool and o.OffreDeUtilisateurService.id=:idAssureur";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("bool", true);
        req.setParameter("idAssureur", idAssureur);
        List<Offre> result = req.getResultList();
        return result; 
        } catch (Exception e) {
            return null;
        }
        
             
    }

    @Override
    public Offre RechercherOffre(long idOffre) {
        Offre Offer = null;
        String txt = "Select Offre from Offre as Offre where Offre.id=:idOffre";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("idOffre", idOffre);
        Offer = (Offre) req.getSingleResult();
        return Offer;

    }
    
    
}
