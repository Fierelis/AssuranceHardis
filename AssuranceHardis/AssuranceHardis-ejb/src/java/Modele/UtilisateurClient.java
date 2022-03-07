/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;

/**
 *
 * @author alex_
 */
@Entity

public class UtilisateurClient implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;  
    @Column(nullable=false)
    private String login;  
    @Column(nullable=false)
    private String mdp;
    @Temporal(javax.persistence.TemporalType.DATE)
    @Column(nullable=false)
    private Date dateCreationUser; 
    @Column(nullable=false)
    private String typeUser;

    /**
     * Get the value of typeUser
     *
     * @return the value of typeUser
     */
    public String getTypeUser() {
        return typeUser;
    }

    /**
     * Set the value of typeUser
     *
     * @param typeUser new value of typeUser
     */
    public void setTypeUser(String typeUser) {
        this.typeUser = typeUser;
    }


    /**
     * Get the value of dateCreationUser
     *
     * @return the value of dateCreationUser
     */
    public Date getDateCreationUser() {
        return dateCreationUser;
    }

    /**
     * Set the value of dateCreationUser
     *
     * @param dateCreationUser new value of dateCreationUser
     */
    public void setDateCreationUser(Date dateCreationUser) {
        this.dateCreationUser = dateCreationUser;
    }


    /**
     * Get the value of mdp
     *
     * @return the value of mdp
     */
    public String getMdp() {
        return mdp;
    }

    /**
     * Set the value of mdp
     *
     * @param mdp new value of mdp
     */
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }


    /**
     * Get the value of login
     *
     * @return the value of login
     */
    public String getLogin() {
        return login;
    }

    /**
     * Set the value of login
     *
     * @param login new value of login
     */
    public void setLogin(String login) {
        this.login = login;
    }

    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UtilisateurClient)) {
            return false;
        }
        UtilisateurClient other = (UtilisateurClient) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.UtilisateurClient[ id=" + id + " ]";
    }
    
}
