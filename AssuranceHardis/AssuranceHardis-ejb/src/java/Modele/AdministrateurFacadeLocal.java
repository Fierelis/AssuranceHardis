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
public interface AdministrateurFacadeLocal {

    void create(Administrateur administrateur);

    void edit(Administrateur administrateur);

    void remove(Administrateur administrateur);

    Administrateur find(Object id);

    List<Administrateur> findAll();

    List<Administrateur> findRange(int[] range);

    int count();

    public Administrateur CreerAdministrateur(String NomAdmin, String PrenomAdmin, String MailAdmin, String LoginAdmin, String PasswordAdmin, String TypeUserAdmin);

    public void SupprimerAdministrateur(long IdAdmin);

    public Administrateur RechercherAdministrateur(long IdAdmin);
    
}
