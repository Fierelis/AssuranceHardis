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
public class Assureur extends UtilisateurService implements Serializable{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String RaisonSocialeAssureur;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateCreation;
    @Column(nullable=false)
    private String MailAssureur;
    @Column(nullable=false)
    private String SiegeSocialAssureur;
    @Column(nullable=false)
    private Long SirenAssureur;
    

    /**
     * Get the value of SirenAssureur
     *
     * @return the value of SirenAssureur
     */
    public Long getSirenAssureur() {
        return SirenAssureur;
    }

    /**
     * Set the value of SirenAssureur
     *
     * @param SirenAssureur new value of SirenAssureur
     */
    public void setSirenAssureur(Long SirenAssureur) {
        this.SirenAssureur = SirenAssureur;
    }

    /**
     * Get the value of SiegeSocialAssureur
     *
     * @return the value of SiegeSocialAssureur
     */
    public String getSiegeSocialAssureur() {
        return SiegeSocialAssureur;
    }

    /**
     * Set the value of SiegeSocialAssureur
     *
     * @param SiegeSocialAssureur new value of SiegeSocialAssureur
     */
    public void setSiegeSocialAssureur(String SiegeSocialAssureur) {
        this.SiegeSocialAssureur = SiegeSocialAssureur;
    }

    /**
     * Get the value of MailAssureur
     *
     * @return the value of MailAssureur
     */
    public String getMailAssureur() {
        return MailAssureur;
    }

    /**
     * Set the value of MailAssureur
     *
     * @param MailAssureur new value of MailAssureur
     */
    public void setMailAssureur(String MailAssureur) {
        this.MailAssureur = MailAssureur;
    }

    

    /**
     * Get the value of DateCreation
     *
     * @return the value of DateCreation
     */
    public Date getDateCreation() {
        return DateCreation;
    }

    /**
     * Set the value of DateCreation
     *
     * @param DateCreation new value of DateCreation
     */
    public void setDateCreation(Date DateCreation) {
        this.DateCreation = DateCreation;
    }

    

    /**
     * Get the value of NomAssureur
     *
     * @return the value of NomAssureur
     */
    public String getRaisonSocialeAssureur() {
        return RaisonSocialeAssureur;
    }

    /**
     * Set the value of NomAssureur
     *
     * @param RaisonSocialeAssureur new value of RaisonSocialeAssureur
     */
    public void setRaisonSocialeAssureur(String RaisonSocialeAssureur) {
        this.RaisonSocialeAssureur = RaisonSocialeAssureur;
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
        if (!(object instanceof Assureur)) {
            return false;
        }
        Assureur other = (Assureur) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Assureur[ id=" + id + " ]";
    }
    
}
