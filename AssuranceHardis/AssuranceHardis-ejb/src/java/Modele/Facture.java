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
public class Facture implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable=false)
    private String typePaiement;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date datePaiement;
    @Column(nullable=false)

    
    private String typeFacture;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date datePaiement;

    private boolean validationPaiement;

    /**
     * Get the value of validationPaiement
     *
     * @return the value of validationPaiement
     */
    public boolean isValidationPaiement() {
        return validationPaiement;
    }

    /**
     * Set the value of validationPaiement
     *
     * @param validationPaiement new value of validationPaiement
     */
    public void setValidationPaiement(boolean validationPaiement) {
        this.validationPaiement = validationPaiement;
    }


    /**
     * Get the value of datePaiement
     *
     * @return the value of datePaiement
     */
    public Date getDatePaiement() {
        return datePaiement;
    }

    /**
     * Set the value of datePaiement
     *
     * @param datePaiement new value of datePaiement
     */
    public void setDatePaiement(Date datePaiement) {
        this.datePaiement = datePaiement;
    }


    /**

     * Get the value of typePaiement
     *
     * @return the value of typePaiement
     */
    public String getTypePaiement() {
        return typePaiement;
    }

    /**
     * Set the value of typePaiement
     *
     * @param typePaiement new value of typePaiement
     */
    public void setTypePaiement(String typePaiement) {
        this.typePaiement = typePaiement;

     * Get the value of typeFacture
     *
     * @return the value of typeFacture
     */
    public String getTypeFacture() {
        return typeFacture;
    }

    /**
     * Set the value of typeFacture
     *
     * @param typeFacture new value of typeFacture
     */
    public void setTypeFacture(String typeFacture) {
        this.typeFacture = typeFacture;

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
        if (!(object instanceof Facture)) {
            return false;
        }
        Facture other = (Facture) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Facture[ id=" + id + " ]";
    }
    
}
