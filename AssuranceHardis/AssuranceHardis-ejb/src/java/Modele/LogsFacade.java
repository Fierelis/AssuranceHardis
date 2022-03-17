/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

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
public class LogsFacade extends AbstractFacade<Logs> implements LogsFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LogsFacade() {
        super(Logs.class);
    }

    @Override
    public void CreerLog(ClientUnique LeClient, Entreprise LEntreprise, Courtier LeCourtier, Assureur Lassureur, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog) {
    Logs LogEntrant = new Logs();
    Date d = new Date();
    LogEntrant.setDateLog(d);
    LogEntrant.setLogContrat(LeContrat);
    LogEntrant.setLogOffre(Loffre);
    LogEntrant.setLogUserAdmin(LAdmin);
    LogEntrant.setTypeLog(TypeLog);
    LogEntrant.setLogCourtier(LeCourtier);
    LogEntrant.setLogEntreprise(LEntreprise);
    LogEntrant.setLogAssureur(Lassureur);
    LogEntrant.setLogClientUnique(LeClient);
    em.persist(LogEntrant);
    }
    @Override
    public List<Logs> GetAllLogs(){
            String txt = "Select L from Logs as L";
            Query req = getEntityManager().createQuery(txt);
            List<Logs> result = req.getResultList();
            return result;  
    }
    @Override
    public List<Logs> RecupLogByType(String TypeLog){
        String txt = "Select L from Logs as L WHERE L.TypeLog =:Type AND (L.LogCourtier is not null OR L.LogAssureur Is not null OR L.LogClientUnique is not null OR L.LogEntreprise is not null) AND L.LogOffre is null AND L.LogContrat is null";
            Query req = getEntityManager().createQuery(txt);
            req.setParameter("Type",TypeLog);
            List<Logs> result = req.getResultList();
            return result;  
    }
}
