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

    public List<Logs> GetAllLogs();

    public List<Logs> RecupLogByType(String TypeLog);

    public void CreerLog(ClientUnique LeClient, Entreprise LEntreprise, Courtier LeCourtier, Assureur Lassureur, Offre Loffre, Contrat LeContrat, Administrateur LAdmin, String TypeLog);
    
}
