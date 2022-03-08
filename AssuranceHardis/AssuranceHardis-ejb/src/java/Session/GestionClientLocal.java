/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Modele.ClientUnique;
import Modele.Entreprise;
import java.util.Date;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface GestionClientLocal {

    public void CreerClientUnique(String nom, String prenom, String login, String mdp, Date dateCreationUser, String typeUser, String iban);

    ClientUnique RechercherClientUnique(long IdclientUnique);

    ClientUnique AuthentificationClientUnique(String LoginClientUnique, String PasswordClientUnique);

    public Entreprise AuthentificationEntreprise(String LoginEntreprise, String PasswordEntreprise);
  
}
