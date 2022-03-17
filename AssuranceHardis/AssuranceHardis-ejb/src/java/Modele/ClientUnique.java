/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author alex_
 */
@Entity
public class ClientUnique extends UtilisateurClient implements Serializable {

    @OneToMany(mappedBy = "LogClientUnique")
    private List<Logs> LesLogs;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String nom; 
    @Column(nullable=false)
    private String prenom;
    @Column(nullable=false)
    private String iban;
    @Column(nullable=false)
    private String mail;
@Column(nullable=false)
    private boolean ActivationUser;

    /**
     * Get the value of ActivationUser
     *
     * @return the value of ActivationUser
     */
    public boolean isActivationUser() {
        return ActivationUser;
    }

    /**
     * Set the value of ActivationUser
     *
     * @param ActivationUser new value of ActivationUser
     */
    public void setActivationUser(boolean ActivationUser) {
        this.ActivationUser = ActivationUser;
    }

    /**
     * Get the value of mail
     *
     * @return the value of mail
     */
    public String getMail() {
        return mail;
    }

    /**
     * Set the value of mail
     *
     * @param mail new value of mail
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * Get the value of iban
     *
     * @return the value of iban
     */
    public String getIban() {
        return iban;
    }

    /**
     * Set the value of iban
     *
     * @param iban new value of iban
     */
    public void setIban(String iban) {
        this.iban = iban;
    }


    /**
     * Get the value of prenom
     *
     * @return the value of prenom
     */
    public String getPrenom() {
        return prenom;
    }

    /**
     * Set the value of prenom
     *
     * @param prenom new value of prenom
     */
    public void setPrenom(String prenom) {
        this.prenom = prenom;
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
        if (!(object instanceof ClientUnique)) {
            return false;
        }
        ClientUnique other = (ClientUnique) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }
    
        

    /**
     * Get the value of nom
     *
     * @return the value of nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * Set the value of nom
     *
     * @param nom new value of nom
     */
    public void setNom(String nom) {
        this.nom = nom;
    }


    @Override
    public String toString() {
        return "Modele.ClientUnique[ id=" + id + " ]";
    }
    
}
