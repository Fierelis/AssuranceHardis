/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import java.util.Date;
import javax.ejb.Local;

/**
 *
 * @author alex_
 */
@Local
public interface GestionServiceLocal {


    public void CreerAssureur(String LoginUserService, String PasswordUserService, String TypeUserService, String RaisonSocialeAssureur, Date DateCreation, String MailAssurance, String SiegeSocialAssureur, long SIREN);
    
}
