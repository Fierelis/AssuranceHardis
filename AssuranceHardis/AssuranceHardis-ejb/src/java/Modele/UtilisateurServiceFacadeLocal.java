/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface UtilisateurServiceFacadeLocal {

    void create(UtilisateurService utilisateurService);

    void edit(UtilisateurService utilisateurService);

    void remove(UtilisateurService utilisateurService);

    UtilisateurService find(Object id);

    List<UtilisateurService> findAll();

    List<UtilisateurService> findRange(int[] range);

    int count();

    public void CreerUtilisateurService(String LoginUtilisateurService, String PasswordUtilisateurService, String TypeUserService);

    public UtilisateurService RechercherUtilisateurService(long IdUS);
    
}
