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
public class UtilisateurClientFacade extends AbstractFacade<UtilisateurClient> implements UtilisateurClientFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UtilisateurClientFacade() {
        super(UtilisateurClient.class);
    }

    @Override
    public void CreerUtilisateurClient(String login, String mdp, Date dateCreationUser, String typeUser) {
        UtilisateurClient utilisateurClient=new UtilisateurClient();
        utilisateurClient.setLogin(login);
        utilisateurClient.setMdp(mdp);
        utilisateurClient.setDateCreationUser(dateCreationUser);
        utilisateurClient.setTypeUser(typeUser);
        getEntityManager().persist(utilisateurClient);
    }

    @Override
    public UtilisateurClient RechercheUtilisateurClient(long id) {
       UtilisateurClient utilisateurClient =null;
       String txt="Select utilisateurClient from UtilisateurClient as uc where uc.id=:i";
       Query req=getEntityManager().createQuery(txt);
       req=req.setParameter("i",id);
       utilisateurClient=(UtilisateurClient)req.getSingleResult();
       return utilisateurClient;  
    }

    @Override
    public void SupprimerUtilisateurClient(long id) {
        
    }

    @Override
    public List AllUtilisateurClient() {
        String txt="Select utilisateurClient from UtilisateurClient as uc";
        Query req=getEntityManager().createQuery(txt);
        List<UtilisateurClient>result = req.getResultList();
        return result;
    }
    
    
    
    
    
}
