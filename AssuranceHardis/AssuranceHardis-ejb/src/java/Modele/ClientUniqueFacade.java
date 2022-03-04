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
public class ClientUniqueFacade extends AbstractFacade<ClientUnique> implements ClientUniqueFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClientUniqueFacade() {
        super(ClientUnique.class);
    }
    
}
