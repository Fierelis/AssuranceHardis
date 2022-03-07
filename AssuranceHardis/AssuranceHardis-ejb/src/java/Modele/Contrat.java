/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author alex_
 */
@Entity
public class Contrat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id; 
    @Column(nullable=false)
    private String typeOffre;   
    @Column(nullable=false)
    private double prixOffre;  
    @Column(nullable=false)
    private String descriptionContrat;  
    @Column(nullable=false)
    private String raisonSocialAssurance;
    @Column(nullable=false)
    private int dureeContrat;

    /**
     * Get the value of dureeContrat
     *
     * @return the value of dureeContrat
     */
    public int getDureeContrat() {
        return dureeContrat;
    }

    /**
     * Set the value of dureeContrat
     *
     * @param dureeContrat new value of dureeContrat
     */
    public void setDureeContrat(int dureeContrat) {
        this.dureeContrat = dureeContrat;
    }

    /**
     * Get the value of raisonSocialAssurance
     *
     * @return the value of raisonSocialAssurance
     */
    public String getRaisonSocialAssurance() {
        return raisonSocialAssurance;
    }

    /**
     * Set the value of raisonSocialAssurance
     *
     * @param raisonSocialAssurance new value of raisonSocialAssurance
     */
    public void setRaisonSocialAssurance(String raisonSocialAssurance) {
        this.raisonSocialAssurance = raisonSocialAssurance;
    }


    /**
     * Get the value of descriptionContrat
     *
     * @return the value of descriptionContrat
     */
    public String getDescriptionContrat() {
        return descriptionContrat;
    }

    /**
     * Set the value of descriptionContrat
     *
     * @param descriptionContrat new value of descriptionContrat
     */
    public void setDescriptionContrat(String descriptionContrat) {
        this.descriptionContrat = descriptionContrat;
    }


    /**
     * Get the value of prixOffre
     *
     * @return the value of prixOffre
     */
    public double getPrixOffre() {
        return prixOffre;
    }

    /**
     * Set the value of prixOffre
     *
     * @param prixOffre new value of prixOffre
     */
    public void setPrixOffre(double prixOffre) {
        this.prixOffre = prixOffre;
    }


    /**
     * Get the value of typeOffre
     *
     * @return the value of typeOffre
     */
    public String getTypeOffre() {
        return typeOffre;
    }

    /**
     * Set the value of typeOffre
     *
     * @param typeOffre new value of typeOffre
     */
    public void setTypeOffre(String typeOffre) {
        this.typeOffre = typeOffre;
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
        if (!(object instanceof Contrat)) {
            return false;
        }
        Contrat other = (Contrat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Contrat[ id=" + id + " ]";
    }
    
}
