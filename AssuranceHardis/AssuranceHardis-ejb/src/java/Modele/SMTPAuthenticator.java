/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
/**
 *
 * @author alex_
 */
public class SMTPAuthenticator extends Authenticator {
    private String username;
    private String password;
    private boolean needAuth;
                     
    public SMTPAuthenticator(String username, String password,boolean needAuth)
                        {
                            this.username = username;
                            this.password = password;
                            this.needAuth = needAuth;
                        }
                     
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        if (needAuth){
            return new PasswordAuthentication(username, password);    
        }
        return null;
    }
    
}
