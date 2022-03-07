/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author alex_
 */
@Stateless
public class ContratFacade extends AbstractFacade<Contrat> implements ContratFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContratFacade() {
        super(Contrat.class);
    }

    @Override
    public void CreerContrat(String typeOffre, double prixOffre, String descriptionContrat, String raisonSocialAssurance, int dureeContrat) {
        Contrat contrat= new Contrat();
        contrat.setDescriptionContrat(descriptionContrat);
        contrat.setDureeContrat(dureeContrat);
        contrat.setPrixOffre(prixOffre);
        contrat.setRaisonSocialAssurance(raisonSocialAssurance);
        contrat.setTypeOffre(typeOffre);
        getEntityManager().persist(contrat);
    }

    @Override
    public Contrat RechercheContrat(long id) {
       Contrat contrat =null;
       String txt="Select contrat from Contrat as c where c.id=:i";
       Query req=getEntityManager().createQuery(txt);
       req=req.setParameter("i",id);
       contrat=(Contrat)req.getSingleResult();
       return contrat;  
    }

    @Override
    public void SupprimerContrat(long id) {
        
    }
    
   
}
