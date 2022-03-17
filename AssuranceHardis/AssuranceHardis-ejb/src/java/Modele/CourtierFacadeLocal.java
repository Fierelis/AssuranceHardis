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
public interface CourtierFacadeLocal {

    void create(Courtier courtier);

    void edit(Courtier courtier);

    void remove(Courtier courtier);

    Courtier find(Object id);

    List<Courtier> findAll();

    List<Courtier> findRange(int[] range);

    int count();

    public Courtier CreerCourtier(String NomCourtier, String PrenomCourtier, Date DateNaissanceCourtier, String AdresseCourtier, String MailCourtier, String LoginUserServiceCourtier, String PasswordUserServiceCourtier, String TypeUserServiceCourtier, String VilleCourtier, String CPCourtier);

    public Courtier RechercherCourtier(long IdCourtier);

    public void SupprimerCourtier(long IdCourtier);

    Courtier AuthentificationCourtier(String LoginCourtier, String PasswordCourtier);

    List RechercheCourtierPartenaire(long idAssurance);

    public void ModifierInformationsCourtier(Courtier court, String NomCourtier, String PrenomCourtier, String AdresseCourtier, String MailCourtier, String LoginUserServiceCourtier, String PasswordUserServiceCourtier, String VilleCourtier, String CPCourtier);
    
}
