/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    public void CreerContrat(Offre Loffre, int DureeContrat, UtilisateurClient ClientDuContrat) {
        Contrat NewContrat = new Contrat();
        Date DateToday = new Date();
        NewContrat.setDateContrat(DateToday);
        NewContrat.setDureeContrat(DureeContrat);
        NewContrat.setDescriptionContrat(Loffre.getDescriptionOffreContractuelle());
        NewContrat.setPrixOffre(Loffre.getPrixOffre());
        NewContrat.setLoffreDuContrat(Loffre);
        NewContrat.setLeClientduContrat(ClientDuContrat);
        em.persist(NewContrat);
    }
    
}
