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
    public void CreerEntreprise(String login, String mdp, Date dateCreationUser, String typeUser, String raisonSocial, Date dateCreationEntreprise, String siegeSocial, String tailleEntreprise, String parameter1) {
        Entreprise entreprise=new Entreprise();
        entreprise.setLogin(login);
        entreprise.setMdp(mdp);
        entreprise.setDateCreationUser(dateCreationUser);
        entreprise.setTypeUser(typeUser);
        entreprise.setNom(mdp);
        entreprise.setDateCreationEntreprise(dateCreationEntreprise);
        entreprise.setRaisonSocialSocial(raisonSocial);
        entreprise.setSiegeSocialEntreprise(tailleEntreprise);
        entreprise.setTailleEntreprise(tailleEntreprise);
        getEntityManager().persist(entreprise);
    }

    @Override
    public Entreprise RechercheEntreprise(long id) {
        Entreprise entreprise=null;
        String txt="Select entreprise from Entreprise as e where e.id=:i";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("i",id);
        entreprise=(Entreprise)req.getSingleResult();
        return entreprise;
    }

    @Override
    public void SupprimerEntreprise(long id) {
        String txt="delete entreprise from Entreprise as e where e.id=:i";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("i",id);
        req.executeUpdate();
    }


    
    
}