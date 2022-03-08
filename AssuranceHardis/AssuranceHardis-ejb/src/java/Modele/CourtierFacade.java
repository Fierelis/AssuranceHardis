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
public class CourtierFacade extends AbstractFacade<Courtier> implements CourtierFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
 }

    public CourtierFacade() {
        super(Courtier.class);
    }

    @Override
    public void CreerCourtier(String NomCourtier, String PrenomCourtier, Date DateNaissanceCourtier, String AdresseCourtier, String MailCourtier, String LoginUserServiceCourtier, String PasswordUserServiceCourtier, String TypeUserServiceCourtier, String VilleCourtier, String CPCourtier) {
    Courtier NouveauCourtier = new Courtier();
    NouveauCourtier.setAdresseCourtier(AdresseCourtier);
    NouveauCourtier.setDateNaissanceCourtier(DateNaissanceCourtier);
    NouveauCourtier.setMailCourtier(MailCourtier);
    NouveauCourtier.setLoginUserService(LoginUserServiceCourtier);
    NouveauCourtier.setPasswordUserService(PasswordUserServiceCourtier);
    NouveauCourtier.setPrenomCourtier(PrenomCourtier);
    NouveauCourtier.setNomCourtier(NomCourtier);
    NouveauCourtier.setVilleCourtier(VilleCourtier);
    NouveauCourtier.setCPCourtier(CPCourtier);
    NouveauCourtier.setTypeUserService("Courtier");
    em.persist(NouveauCourtier);
    }
    
    @Override
    public Courtier RechercherCourtier(long IdCourtier){
        Courtier SearchedCourtier = null;
        String txt="SELECT Courtier FROM Courtier AS Courtier WHERE Courtier.id =:IdCourtier";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdCourtier",IdCourtier);
        List<Courtier>result = req.getResultList();
        if(result.size()==1){
            SearchedCourtier = (Courtier)result.get(0);
        }
        return SearchedCourtier;
    }

    @Override
    public void SupprimerCourtier(long IdCourtier) {
        String txt="DELETE FROM Courtier as Assur WHERE Courtier.id = :IdCourtier ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdCourtier",IdCourtier);
        req.executeUpdate();
    }

    @Override
    public Courtier AuthentificationCourtier(String LoginCourtier, String PasswordCourtier) {
        Courtier Court = null;
        String txt="Select Court from Courtier as Court where Court.LoginUserService=:LoginCourtier and Court.PasswordUserService=:PasswordCourtier";
        Query req=getEntityManager().createQuery(txt);
        req=req.setParameter("LoginCourtier",LoginCourtier);
        req=req.setParameter("PasswordCourtier", PasswordCourtier);
        List<Courtier>result = req.getResultList();
        if(result.size()==1){
            Court=(Courtier)result.get(0);
        }
        return Court;
    }
    
    
}
