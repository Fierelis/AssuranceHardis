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
    public void CreerLog(UtilisateurClient LeClient, UtilisateurService LeService, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog) {
    Logs LogEntrant = new Logs();
    Date d = new Date();
    LogEntrant.setDateLog(d);
    LogEntrant.setLogContrat(LeContrat);
    LogEntrant.setLogOffre(Loffre);
    LogEntrant.setLogUserAdmin(LAdmin);
    LogEntrant.setLogUserClient(LeClient);
    LogEntrant.setLogUserService(LeService);
    LogEntrant.setTypeLog(TypeLog);
    em.persist(LogEntrant);
    }
    @Override
    public List<Logs> GetAllLogs(){
            String txt = "Select L from Logs as L";
            Query req = getEntityManager().createQuery(txt);
            List<Logs> result = req.getResultList();
            return result;  
    }
}
