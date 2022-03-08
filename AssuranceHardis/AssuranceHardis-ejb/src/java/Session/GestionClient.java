/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUniqueFacadeLocal;
import java.util.Date;
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

    
    
    
    

    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void CreerClientUnique(String nom, String prenom, String login, String mdp, Date dateCreationUser, String typeUser, String iban) {
        clientUniqueFacade.CreationClientUnique(prenom, nom, login, mdp, dateCreationUser, typeUser, iban);
    }

    @Override
    public String HashageSha256(String mdp) {
        return clientUniqueFacade.HashageSha256(mdp);
    }
    
    
}
