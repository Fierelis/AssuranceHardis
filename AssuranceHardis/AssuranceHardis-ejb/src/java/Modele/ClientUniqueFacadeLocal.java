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
public interface ClientUniqueFacadeLocal {

    void create(ClientUnique clientUnique);

    void edit(ClientUnique clientUnique);

    void remove(ClientUnique clientUnique);

    ClientUnique find(Object id);

    List<ClientUnique> findAll();

    List<ClientUnique> findRange(int[] range);

    int count();
    
}
