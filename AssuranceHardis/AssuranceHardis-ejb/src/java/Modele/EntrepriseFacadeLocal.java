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
public interface EntrepriseFacadeLocal {

    void create(Entreprise entreprise);

    void edit(Entreprise entreprise);

    void remove(Entreprise entreprise);

    Entreprise find(Object id);

    List<Entreprise> findAll();

    List<Entreprise> findRange(int[] range);

    int count();

    void CreerEntreprise(String nom, String raisonSocial, String siegeSocial, String tailleEntreprise, Date dateCreationEntreprise, String login, String mdp, Date dateCreationUser, String typeUser);

    Entreprise RechercheEntreprise(long id);

    void SupprimerEntreprise(long id);


}
