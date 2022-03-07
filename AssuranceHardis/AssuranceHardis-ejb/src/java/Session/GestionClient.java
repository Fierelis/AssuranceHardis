/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUniqueFacadeLocal;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionClient implements GestionClientLocal {

    @EJB
    private ClientUniqueFacadeLocal clientUniqueFacade;

    
    
    @Override
    public void CreerClientUnique(String nom) {
        //clientUniqueFacade.CreerClientUnique(nom);
    }

    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
