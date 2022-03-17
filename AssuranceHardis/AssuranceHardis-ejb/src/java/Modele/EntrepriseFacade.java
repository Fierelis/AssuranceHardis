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
    public Entreprise CreerEntreprise(String login, String mdp, Date dateCreationUser, String typeUser, String raisonSocial,String siegeSocial, Date dateCreationEntreprise, String tailleEntreprise, String mail) {
        Entreprise entreprise = new Entreprise();
        entreprise.setLogin(login);
        entreprise.setMdp(mdp);
        entreprise.setDateCreationUser(dateCreationUser);
        entreprise.setTypeUser(typeUser);
        entreprise.setActivationUser(false);
        entreprise.setRaisonSocialeEntreprise(raisonSocial);
        entreprise.setSiegeSocialEntreprise(siegeSocial);
        entreprise.setDateCreationEntreprise(dateCreationEntreprise);
        entreprise.setTailleEntreprise(tailleEntreprise);
        entreprise.setMail(mail);
        getEntityManager().persist(entreprise);
        return entreprise;
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

    @Override
    public Entreprise AuthentificationEntreprise(String LoginEntreprise, String PasswordEntreprise) {
        
        try {
            Entreprise Boite = null;
        String txt="Select Boite from UtilisateurClient as Boite where Boite.login=:LoginEntreprise and Boite.mdp=:PasswordEntreprise and Boite.typeUser=:entreprise";
        Query req=getEntityManager().createQuery(txt);
        req=req.setParameter("LoginEntreprise",LoginEntreprise);
        req=req.setParameter("PasswordEntreprise", PasswordEntreprise);
        req=req.setParameter("entreprise", "Entreprise");
        List<Entreprise>result = req.getResultList();
        if(result.size()==1){
            Boite=(Entreprise)result.get(0);
        }
        return Boite;
        } catch (Exception e) {
            return null;
        }
    } 
    @Override
    public void ModifierEntreprise(Entreprise Boite, String login, String mdp, String raisonSocial, String siegeSocial, String tailleEntreprise, String mail) {
        Boite.setLogin(login);
        Boite.setMdp(mdp);
        Boite.setRaisonSocialeEntreprise(raisonSocial);
        Boite.setSiegeSocialEntreprise(siegeSocial);
        Boite.setTailleEntreprise(tailleEntreprise);
        Boite.setMail(mail);    
        em.merge(Boite);
    }

         @Override
    public void ValiderInscription(Entreprise boite) {
        boite.setActivationUser(true);
        em.merge(boite);
    }

}
