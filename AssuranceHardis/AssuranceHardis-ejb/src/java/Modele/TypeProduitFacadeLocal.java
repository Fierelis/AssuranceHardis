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
public interface TypeProduitFacadeLocal {

    void create(TypeProduit typeProduit);

    void edit(TypeProduit typeProduit);

    void remove(TypeProduit typeProduit);

    TypeProduit find(Object id);

    List<TypeProduit> findAll();

    List<TypeProduit> findRange(int[] range);

    int count();
    
}
