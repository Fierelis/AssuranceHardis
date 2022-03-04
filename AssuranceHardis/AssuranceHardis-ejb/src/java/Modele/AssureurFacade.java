/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    
    public void CreerAssureur(String NomAssureur){
        Assureur Assur = new Assureur();
        Assur.setNomAssureur(NomAssureur);
        em.persist(Assur);
    }
    
}
