/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

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
public class UtilisateurServiceFacade extends AbstractFacade<UtilisateurService> implements UtilisateurServiceFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UtilisateurServiceFacade() {
        super(UtilisateurService.class);
    }
    @Override
    public void CreerUtilisateurService(String LoginUtilisateurService, String PasswordUtilisateurService, String TypeUserService){
        UtilisateurService US = new UtilisateurService();
        US.setLoginUserService(TypeUserService);
        US.setPasswordUserService(PasswordUtilisateurService);
        US.setTypeUserService(TypeUserService);
        em.persist(US);
    }
    @Override
    public UtilisateurService RechercherUtilisateurService(long IdUS){
        UtilisateurService US = null;
        String txt="SELECT US FROM UtilisateurService AS US WHERE US.id =:IdUS";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdUS",IdUS);
        List<UtilisateurService>result = req.getResultList();
        if(result.size()==1){
            US = (UtilisateurService)result.get(0);
        }
        return US;
    }
    
    public void SupprimerUtilisateurService(long IdUS){
        String txt="DELETE FROM UtilisateurService as US WHERE US.id = :IdUS ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdUS",IdUS);
        req.executeUpdate();
    }
}
