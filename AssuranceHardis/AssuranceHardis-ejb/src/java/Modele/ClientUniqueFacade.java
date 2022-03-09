/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    public void CreationClientUnique(String prenom, String nom, String login, String mdp, Date dateCreationUser, String typeUser, String iban, String mail) {
        ClientUnique clientUnique = new ClientUnique();
        clientUnique.setLogin(login);
        clientUnique.setMdp(mdp);
        clientUnique.setDateCreationUser(dateCreationUser);
        clientUnique.setTypeUser(typeUser);
        clientUnique.setNom(nom);
        clientUnique.setPrenom(prenom);
        clientUnique.setIban(iban);
        clientUnique.setMail(mail);
        getEntityManager().persist(clientUnique);
    }

    @Override
    public ClientUnique RechercheClientUnique(long id) {
        ClientUnique clientUnique = null;
        String txt = "Select clientUnique from ClientUnique as cu where cu.id=:i";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("i", id);
        clientUnique = (ClientUnique) req.getSingleResult();
        return clientUnique;
    }

    @Override
    public void SupprimerClientUnique(long id) {
        String txt = "delete clientUnique from ClientUnique as cu where cu.id=:i";
        Query req = getEntityManager().createQuery(txt);
        req.setParameter("i", id);
        req.executeUpdate();
    }

    @Override
    public ClientUnique AuthentificationClientUnique(String LoginClientUnique, String PasswordClientUnique) {
       
        try {
           ClientUnique ClientU = null;
        String txt = "Select ClientU from UtilisateurClient as ClientU where ClientU.login=:LoginClientUnique and ClientU.mdp=:PasswordClientUnique and ClientU.typeUser=:ClientUnique";
        Query req = getEntityManager().createQuery(txt);
        req = req.setParameter("LoginClientUnique", LoginClientUnique);
        req = req.setParameter("PasswordClientUnique", PasswordClientUnique);
        req = req.setParameter("ClientUnique", "Client Unique");
        List<ClientUnique> result = req.getResultList();
        if (result.size() == 1) {
            ClientU = (ClientUnique) result.get(0);
        }
        return ClientU; 
        } catch (Exception e) {
            return null;
        }
        
        
    }

    @Override
    public String HashageSha256(String mdp) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
            md.update(mdp.getBytes());
            byte byteData[] = md.digest();

            //convertir le tableau de bits en une format hexadécimal - méthode 1
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            //System.out.println("En format hexa : " + sb.toString());
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ClientUniqueFacade.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

}
