/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface UtilisateurClientFacadeLocal {

    void create(UtilisateurClient utilisateurClient);

    void edit(UtilisateurClient utilisateurClient);

    void remove(UtilisateurClient utilisateurClient);

    UtilisateurClient find(Object id);

    List<UtilisateurClient> findAll();

    List<UtilisateurClient> findRange(int[] range);

    int count();

    void CreerUtilisateurClient(String login, String mdp, Date dateCreationUser, String typeUser);

    UtilisateurClient RechercheUtilisateurClient(long id);

    void SupprimerUtilisateurClient(long id);

   

   
    
}
