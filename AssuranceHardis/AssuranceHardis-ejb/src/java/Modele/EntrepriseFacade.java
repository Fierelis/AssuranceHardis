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
import javax.persistence.Query;

/**
 *
 * @author alex_
 */
@Stateless
public class EntrepriseFacade extends AbstractFacade<Entreprise> implements EntrepriseFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EntrepriseFacade() {
        super(Entreprise.class);
    }

    @Override
    public void CreerEntreprise(String nom, String raisonSocial, String siegeSocial, String tailleEntreprise, Date dateCreationEntreprise, String login, String mdp, Date dateCreationUser, String typeUser) {
        Entreprise entreprise= new Entreprise();
        entreprise.setDateCreationEntreprise(dateCreationEntreprise);
        entreprise.setDateCreationUser(dateCreationUser);
        entreprise.setLogin(login);
        entreprise.setMdp(mdp);
        entreprise.setNom(nom);
        entreprise.setRaisonSocial(raisonSocial);
        entreprise.setSiegeSocial(siegeSocial);
        entreprise.setTailleEntreprise(tailleEntreprise);
        entreprise.setTypeUser(typeUser);
        getEntityManager().persist(login);
        
    }

    @Override
    public Entreprise RechercheEntreprise(long id) {
       Entreprise entreprise =null;
       String txt="Select entreprise from Entreprise as e where e.id=:i";
       Query req=getEntityManager().createQuery(txt);
       req=req.setParameter("i",id);
       entreprise=(Entreprise)req.getSingleResult();
       return entreprise;  
    }

    @Override
    public void SupprimerEntreprise(long id) {
    }

    

    
}
