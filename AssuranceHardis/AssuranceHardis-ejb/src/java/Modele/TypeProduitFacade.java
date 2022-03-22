/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author alex_
 */
@Stateless
public class TypeProduitFacade extends AbstractFacade<TypeProduit> implements TypeProduitFacadeLocal {

    @PersistenceContext(unitName = "AssuranceHardis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TypeProduitFacade() {
        super(TypeProduit.class);
    }
    @Override
    public void CreerTypeProduit(String NomTypeProduit){
        TypeProduit NewTypeProduit = new TypeProduit();
        NewTypeProduit.setNomTypeProduit(NomTypeProduit);
        em.persist(NewTypeProduit);
    }
    
    @Override
    public TypeProduit RechercherTypeProduit(String NomTypeProduit) {
        try {
            TypeProduit SearchedTypeProduit = null;
            String txt = "SELECT T FROM TypeProduit AS T WHERE T.NomTypeProduit =:NomTypeProduit";
            Query req = getEntityManager().createQuery(txt);
            req.setParameter("NomTypeProduit", NomTypeProduit);
            List<TypeProduit> result = req.getResultList();
            if (result.size() == 1) {
                SearchedTypeProduit = (TypeProduit) result.get(0);
            }
            return SearchedTypeProduit;
        } catch (Exception e) {
            return null;
        }

    }
    @Override
    public void SupprimerTypeProduit(long IdTypeProduit){
        String txt="DELETE FROM TypeProduit as TP WHERE TP.id = :IdTypeProduit ";
        Query req =getEntityManager().createQuery(txt);
        req.setParameter("IdTypeProduit",IdTypeProduit);
        req.executeUpdate();
    }
}
