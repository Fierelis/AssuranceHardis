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
public class AdministrateurFacade extends AbstractFacade<Administrateur> implements AdministrateurFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministrateurFacade() {
        super(Administrateur.class);
    }
    
    
   public Administrateur CreerAdministrateur(String NomAdmin, String PrenomAdmin, String MailAdmin, String LoginAdmin, String PasswordAdmin, String TypeUserAdmin){
       Administrateur NouvelAdmin = new Administrateur();
       NouvelAdmin.setLoginAdmin(LoginAdmin);
       NouvelAdmin.setMailAdmin(MailAdmin);
       NouvelAdmin.setPrenomAdmin(PrenomAdmin);
       NouvelAdmin.setPasswordAdmin(PasswordAdmin);
       NouvelAdmin.setNomAdmin(NomAdmin);
       NouvelAdmin.setTypeUserAdmin("Admin");
       em.persist(NouvelAdmin);
       return NouvelAdmin;
   }
    public Administrateur RechercherAdministrateur(long IdAdmin){
        Administrateur Admin = null;
        String txt="SELECT Admin FROM Administrateur AS Admin WHERE Admin.id =:IdAdmin";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdAdmin",IdAdmin);
        List<Administrateur>result = req.getResultList();
        if(result.size()==1){
            Admin = (Administrateur)result.get(0);
        }
        return Admin;
    }

    public void SupprimerAdministrateur(String IdAdmin) {
        String txt="DELETE FROM Administrateur as Admin WHERE Admin.id = :IdAdmin ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdAdmin",IdAdmin);
        req.executeUpdate();
    }
    
}
