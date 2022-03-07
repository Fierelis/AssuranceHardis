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
public interface ContratFacadeLocal {

    void create(Contrat contrat);

    void edit(Contrat contrat);

    void remove(Contrat contrat);

    Contrat find(Object id);

    List<Contrat> findAll();

    List<Contrat> findRange(int[] range);

    int count();

    void CreerContrat(String typeOffre, double prixOffre, String descriptionContrat, String raisonSocialAssurance, int dureeContrat);

    Contrat RechercheContrat(long id);

    void SupprimerContrat(long id);
    
}
