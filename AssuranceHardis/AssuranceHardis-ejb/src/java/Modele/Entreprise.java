/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import java.util.Date;
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
    private String nom;  
    private String raisonSocial;  
    private String siegeSocial; 
    private String tailleEntreprise;   
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateCreationEntreprise;

    /**
     * Get the value of dateCreationEntreprise
     *
     * @return the value of dateCreationEntreprise
     */
    public Date getDateCreationEntreprise() {
        return dateCreationEntreprise;
    }

    /**
     * Set the value of dateCreationEntreprise
     *
     * @param dateCreationEntreprise new value of dateCreationEntreprise
     */
    public void setDateCreationEntreprise(Date dateCreationEntreprise) {
        this.dateCreationEntreprise = dateCreationEntreprise;
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
     * Get the value of siegeSocial
     *
     * @return the value of siegeSocial
     */
    public String getSiegeSocial() {
        return siegeSocial;
    }

    /**
     * Set the value of siegeSocial
     *
     * @param siegeSocial new value of siegeSocial
     */
    public void setSiegeSocial(String siegeSocial) {
        this.siegeSocial = siegeSocial;
    }

    
 
    

    /**
     * Get the value of raisonSocial
     *
     * @return the value of raisonSocial
     */
    public String getRaisonSocial() {
        return raisonSocial;
    }

    /**
     * Set the value of raisonSocial
     *
     * @param raisonSocial new value of raisonSocial
     */
    public void setRaisonSocial(String raisonSocial) {
        this.raisonSocial = raisonSocial;
    }

    
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
