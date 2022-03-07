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
    @Column(nullable=false)
    private Long id; 
    @Column(nullable=false)
    private String typePaiement;
    @Column(nullable=false)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date datePaiement;
    @Column(nullable=false)
    private boolean validationPaiement;

    /**
     * Get the value of datePaiment
     *
     * @return the value of datePaiment
     */
    public boolean isValidationPaiement() {
        return validationPaiement;
    }

    /**
     * Set the value of datePaiment
     *
     * @param datePaiment new value of datePaiment
     */
    public void setValidationPaiement(boolean datePaiment) {
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
