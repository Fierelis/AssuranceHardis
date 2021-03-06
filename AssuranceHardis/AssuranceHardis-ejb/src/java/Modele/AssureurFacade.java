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
    public void CreerAssureur(String LoginUserService, String PasswordUserService, String TypeUserService, String RaisonSocialeAssureur, Date DateCreation, String MailAssurance, String SiegeSocialAssureur, long SIREN){
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
    }
    
    @Override
    public Assureur RechercherAssureur(long IdAssureur){
        Assureur Assur = null;
        String txt="SELECT Assur FROM Assureur AS Assur WHERE Assur.id =:IdAssureur";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdAssureur",IdAssureur);
        List<Assureur>result = req.getResultList();
        if(result.size()==1){
            Assur = (Assureur)result.get(0);
        }
        return Assur;
    }

    @Override
    public void SupprimerAssureur(String IdAssureur) {
        String txt="DELETE FROM Assureur as Assur WHERE Assur.id = :IdAssureur ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdAssureur",IdAssureur);
        req.executeUpdate();
    }
    
    public void CreerAssureur(String NomAssureur){
        Assureur Assur = new Assureur();
        Assur.setNomAssureur(NomAssureur);
        em.persist(Assur);
    }

}
