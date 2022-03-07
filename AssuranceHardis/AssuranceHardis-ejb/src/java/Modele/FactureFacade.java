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
public class FactureFacade extends AbstractFacade<Facture> implements FactureFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FactureFacade() {
        super(Facture.class);
    }

    @Override
    public void CreerFacture(String typePaiement, Date datePaiement, boolean validationPaiement) {
        Facture facture = new Facture();
        facture.setDatePaiement(datePaiement);
        facture.setTypePaiement(typePaiement);
        facture.setValidationPaiement(validationPaiement);
        getEntityManager().persist(facture);
    }

    @Override
    public Facture RechercherFacture(long id) {
        Facture facture = null;
        String txt="Select facture from Facture as f where f.id=:i";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("i",id);
        facture=(Facture)req.getSingleResult();
        return facture;
    }

    @Override
    public void SupprimerFacture(long id) {
        String txt="delete facture from Facture as f where f.id=:i";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("i",id);
        req.executeUpdate();
    }
    
    
}
