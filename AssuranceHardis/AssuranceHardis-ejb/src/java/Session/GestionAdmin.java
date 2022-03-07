/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.AdministrateurFacadeLocal;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alex_
 */
@Stateless
public class GestionAdmin implements GestionAdminLocal {

    @EJB
    private AdministrateurFacadeLocal administrateurFacade;

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

}
