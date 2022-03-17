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
public class Entreprise extends UtilisateurClient implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;   
    @Column
    private String raisonSocialeEntreprise;
    @Column(nullable=false)
    private String siegeSocialEntreprise;
    @Column(nullable=false)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateCreationEntreprise;
    @Column(nullable=false)
    private String tailleEntreprise;
    @Column(nullable=false)
    private String mail;

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
     * Get the value of tailleEntreprise
     *
     * @return the value of tailleEntreprise
     */
    public String getTailleEntreprise() {
        return tailleEntreprise;
    }

    /**
     * Set the value of tailleEntreprise
     *
     * @param tailleEntreprise new value of tailleEntreprise
     */
    public void setTailleEntreprise(String tailleEntreprise) {
        this.tailleEntreprise = tailleEntreprise;
    }


    /**
     * Get the value of siegeSocialEntreprise
     *
     * @return the value of siegeSocialEntreprise
     */
    public String getSiegeSocialEntreprise() {
        return siegeSocialEntreprise;
    }

    /**
     * Set the value of siegeSocialEntreprise
     *
     * @param siegeSocialEntreprise new value of siegeSocialEntreprise
     */
    public void setSiegeSocialEntreprise(String siegeSocialEntreprise) {
        this.siegeSocialEntreprise = siegeSocialEntreprise;
    }

    
    

    /**
     * Get the value of DateCreationEntreprise
     *
     * @return the value of DateCreationEntreprise
     */
    public Date getDateCreationEntreprise() {
        return DateCreationEntreprise;
    }

    /**
     * Set the value of DateCreationEntreprise
     *
     * @param DateCreationEntreprise new value of DateCreationEntreprise
     */
    public void setDateCreationEntreprise(Date DateCreationEntreprise) {
        this.DateCreationEntreprise = DateCreationEntreprise;
    }


    /**
     * Get the value of raisonSocialSocial
     *
     * @return the value of raisonSocialSocial
     */
    public String getRaisonSocialeEntreprise() {
        return raisonSocialeEntreprise;
    }

    /**
     * Set the value of raisonSocialSocial
     *
     * @param raisonSocialeEntreprise
     */
    public void setRaisonSocialeEntreprise(String raisonSocialeEntreprise) {
        this.raisonSocialeEntreprise = raisonSocialeEntreprise;
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
        if (!(object instanceof Entreprise)) {
            return false;
        }
        Entreprise other = (Entreprise) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Entreprise[ id=" + id + " ]";
    }
    
}
