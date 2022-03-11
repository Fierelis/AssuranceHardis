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
public interface ClientUniqueFacadeLocal {

    void create(ClientUnique clientUnique);

    void edit(ClientUnique clientUnique);

    void remove(ClientUnique clientUnique);

    ClientUnique find(Object id);

    List<ClientUnique> findAll();

    List<ClientUnique> findRange(int[] range);

    int count();

    void CreationClientUnique(String prenom, String nom, String login, String mdp, Date dateCreationUser, String typeUser, String iban, String mail);

    ClientUnique RechercheClientUnique(long id);

    void SupprimerClientUnique(long id);

    ClientUnique AuthentificationClientUnique(String LoginClientUnique, String PasswordClientUnique);
    String HashageSha256(String mdp);

    public void ModificationClientUnique(ClientUnique Client, String prenom, String nom, String login, String mdp, String iban, String mail);

   
    
}
