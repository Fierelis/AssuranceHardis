/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author alex_
 */
@Stateless
public class ClientUniqueFacade extends AbstractFacade<ClientUnique> implements ClientUniqueFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClientUniqueFacade() {
        super(ClientUnique.class);
    }

    @Override
    public void CreerClientUnique(String login, String mdp, Date dateCreation, String typeUser, String nom, String prenom, String iban) {
        ClientUnique clientUnique=new ClientUnique();
        clientUnique.setLogin(login);
        clientUnique.setMdp(mdp);
        clientUnique.setDateCreationUser(dateCreation);
        clientUnique.setTypeUser(typeUser);
        clientUnique.setPrenom(prenom);
        clientUnique.setNom(nom);
        clientUnique.setIban(nom);
        getEntityManager().persist(nom);
    }

    @Override
    public ClientUnique RechercheClientUnique(long id) {
       ClientUnique clientUnique =null;
       String txt="Select clientUnique from ClientUnique as cu where cu.id=:i";
       Query req=getEntityManager().createQuery(txt);
       req=req.setParameter("i",id);
       clientUnique=(ClientUnique)req.getSingleResult();
       return clientUnique;  
    }

    @Override
    public void supprimerClientUnique(long id) {
    }
    
    
    
    
}
