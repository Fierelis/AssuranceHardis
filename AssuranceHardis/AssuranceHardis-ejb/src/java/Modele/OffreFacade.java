/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.ArrayList;
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
    public void CreerOffre(String TypeOffre, double PrixOffre, String DescriptionOffre, boolean OffreActive, UtilisateurService IdUtilisateurService){
        Offre nouvelleOffre = new Offre();
        nouvelleOffre.setDescriptionOffreContractuelle(DescriptionOffre);
        nouvelleOffre.setOffreActive(OffreActive);
        nouvelleOffre.setOffreDeUtilisateurService(IdUtilisateurService);
        nouvelleOffre.setPrixOffre(PrixOffre);
        nouvelleOffre.setTypeOffre(TypeOffre);
        em.persist(nouvelleOffre);
    }
    
    @Override
    public List<Offre> RechercherOffreParType(String TypeOffre){
          List<Offre> ListeOffre = new ArrayList();
        String txt = "SELECT O "
           + "FROM Offre as O "
           + "WHERE O.TypeOffre = :TypeOffre";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("TypeOffre", TypeOffre);
        List<Long>result = req.getResultList();
        if(result.size()>= 1){
           ListeOffre = req.getResultList();
            }
        return ListeOffre;

    }
    @Override
     public List<Offre> RechercherOffreParTypeUtilisateur(String TypeUtilisateur){
          List<Offre> ListeOffre = new ArrayList();
        String txt = "SELECT O "
           + "FROM Offre as O "
           + "WHERE O.UtilisateurService.TypeUserService = :TypeUtilisateur";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("TypeUtilisateur", TypeUtilisateur);
        List<Long>result = req.getResultList();
        if(result.size()>= 1){
           ListeOffre = req.getResultList();
            }
        return ListeOffre;
    }
     
    @Override
     public void SupprimerOffre(long IdOffre){
        String txt="DELETE FROM Offre as O WHERE O.id = :IdOffre ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdOffre",IdOffre);
        req.executeUpdate();
     }
    
}
