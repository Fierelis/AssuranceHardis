/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.AssureurFacadeLocal;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionService implements GestionServiceLocal {

    @EJB
    private AssureurFacadeLocal assureurFacade;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void CreerAssureur(String NomAssureur) {
        assureurFacade.CreerAssureur(NomAssureur);
    }
    
    
    
}
