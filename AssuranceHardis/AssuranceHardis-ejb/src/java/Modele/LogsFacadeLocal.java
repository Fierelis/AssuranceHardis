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
public interface LogsFacadeLocal {

    void create(Logs logs);

    void edit(Logs logs);

    void remove(Logs logs);

    Logs find(Object id);

    List<Logs> findAll();

    List<Logs> findRange(int[] range);

    int count();

    public void CreerLog(UtilisateurClient LeClient, UtilisateurService LeService, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog);

    public List<Logs> GetAllLogs();
    
}
