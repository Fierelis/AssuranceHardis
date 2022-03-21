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
public class AssureurFacade extends AbstractFacade<Assureur> implements AssureurFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssureurFacade() {
        super(Assureur.class);
    }

    @Override
    public Assureur CreerAssureur(String LoginUserService, String PasswordUserService, String TypeUserService, String RaisonSocialeAssureur, Date DateCreation, String MailAssurance, String SiegeSocialAssureur, long SIREN) {
        Assureur Assur = new Assureur();
        Assur.setLoginUserService(LoginUserService);
        Assur.setPasswordUserService(PasswordUserService);
        Assur.setTypeUserService(TypeUserService);
        Assur.setDateCreation(DateCreation);
        Assur.setMailAssureur(MailAssurance);
        Assur.setSiegeSocialAssureur(SiegeSocialAssureur);
        Assur.setSirenAssureur(SIREN);
        Assur.setRaisonSocialeAssureur(RaisonSocialeAssureur);
        em.persist(Assur);
        return Assur;
    }

    @Override
    public Assureur RechercherAssureur(long IdAssureur) {
        Assureur Assur = null;
        String txt = "SELECT Assur FROM Assureur AS Assur WHERE Assur.id =:IdAssureur";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("IdAssureur", IdAssureur);
        List<Assureur> result = req.getResultList();
        if (result.size() == 1) {
            Assur = (Assureur) result.get(0);
        }
        return Assur;
    }

    @Override
    public void SupprimerAssureur(long IdAssureur) {
        String txt = "DELETE FROM Assureur as Assur WHERE Assur.id = :IdAssureur ";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("IdAssureur", IdAssureur);
        req.executeUpdate();
    }

    @Override
    public Assureur AuthentificationAssureur(String LoginAssureur, String PasswordAssureur) {

        try {
            Assureur Assur = null;
            String txt = "Select Assur from UtilisateurService as Assur where Assur.LoginUserService=:LoginAssureur and Assur.PasswordUserService=:PasswordAssureur and Assur.TypeUserService=:Assureur";
            Query req = getEntityManager().createQuery(txt);
            req = req.setParameter("LoginAssureur", LoginAssureur);
            req = req.setParameter("PasswordAssureur", PasswordAssureur);
            req = req.setParameter("Assureur", "Assureur");
            List<Assureur> result = req.getResultList();
            if (result.size() == 1) {
                Assur = (Assureur) result.get(0);
            }
            return Assur;

        } catch (Exception e) {

            return null;
        }

    }
    @Override
    public List<Assureur> GetListAssureurs(){
         try {
            String txt = "Select A from Assureur as A";
            Query req = getEntityManager().createQuery(txt);
            List<Assureur> result = req.getResultList();
            return result;
        } catch (Exception e) {
             return null;
        }   
    }
     @Override
    public void ValiderInscription(Assureur Assur) {
        Assur.setActivationUser(true);
        em.merge(Assur);
    }

    @Override
    public void ModifierAssureur(Assureur Assur, String Login, String mdp, String RaisonSociale, String SiegeSocial, String Mail) {
        Assur.setLoginUserService(Login);
        Assur.setMailAssureur(Mail);
        Assur.setSiegeSocialAssureur(SiegeSocial);
        Assur.setRaisonSocialeAssureur(RaisonSociale);
        Assur.setPasswordUserService(mdp);
        em.merge(Assur);
    }
    
}
