/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.ArrayList;
import java.util.Date;
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
    public Contrat CreerContrat(Offre Loffre, int DureeContrat, UtilisateurClient ClientDuContrat) {
        Contrat NewContrat = new Contrat();
        Date DateToday = new Date();
        NewContrat.setDateContrat(DateToday);
        NewContrat.setDureeContrat(DureeContrat);
        NewContrat.setDescriptionContrat(Loffre.getDescriptionOffreContractuelle());
        NewContrat.setPrixOffre(Loffre.getPrixOffre());
        NewContrat.setLoffreDuContrat(Loffre);
        NewContrat.setLeClientduContrat(ClientDuContrat);
        em.persist(NewContrat);
        return NewContrat;
    }

    @Override
    public List<Contrat> RecupererContratSouscritClient(ClientUnique Client) { // il risque de jamais rien retourner 
        try {
            long IdClient = Client.getId();
            List<Contrat> ListeContratsSouscrits = new ArrayList();
            String txt = "SELECT C FROM Contrat AS C WHERE C.LeClientduContrat.id =:IdClient ";
            Query req = getEntityManager().createQuery(txt);
            req.setParameter("IdClient", IdClient);
            // req.setParameter("Boite", Boite);
            List<Contrat> result = req.getResultList();
            if (result.size() >= 1) {
                ListeContratsSouscrits = req.getResultList();
            }
            return ListeContratsSouscrits;
        } catch (Exception e) {
            return null;
        }
    }
    
    

    @Override
    public Contrat RechercherContrat(long idContrat) {
        Contrat c = new Contrat();
        String txt = "SELECT C FROM Contrat AS C WHERE C.id =:idContrat";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("idContrat", idContrat);
        List<Contrat> result = req.getResultList();
        if (result.size() == 1) {
            c = (Contrat) result.get(0);
        }
        return c;
    }

    @Override
    public List RecupererContratSouscritEntreprise(Entreprise entreprise) {
         try {
            long IdEntreprise = entreprise.getId();
            List<Contrat> ListeContratsSouscrits = new ArrayList();
            String txt = "SELECT C FROM Contrat AS C WHERE C.LeClientduContrat.id =:IdEntreprise ";
            Query req = getEntityManager().createQuery(txt);
            req.setParameter("IdEntreprise", IdEntreprise);
            // req.setParameter("Boite", Boite);
            List<Contrat> result = req.getResultList();
            if (result.size() >= 1) {
                ListeContratsSouscrits = req.getResultList();
            }
            return ListeContratsSouscrits;
        } catch (Exception e) {
            return null;
        }
    }

}
