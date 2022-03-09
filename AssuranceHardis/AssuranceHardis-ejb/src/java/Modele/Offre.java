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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author alex_
 */
@Entity
public class Offre implements Serializable {

    @OneToMany(mappedBy = "LogOffre")
    private List<Logs> AssociatedLogs;

    @OneToMany(mappedBy = "LoffreDuContrat")
    private List<Contrat> LesContrats;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String TypeOffre;//groupé ou simple
    @Column(nullable=false)
    private double PrixOffre;
    @Column(nullable=false)
    private String DescriptionOffreContractuelle;
    @Column(nullable=false)
    private boolean OffreActive;

    @ManyToOne
    private UtilisateurService OffreDeUtilisateurService;
    
    @ManyToOne
    private Assureur PartenariatAssurance;

    /**
     * Get the value of PartenariatAssurance
     *
     * @return the value of PartenariatAssurance
     */
    public Assureur getPartenariatAssurance() {
        return PartenariatAssurance;
    }

    /**
     * Set the value of PartenariatAssurance
     *
     * @param PartenariatAssurance new value of PartenariatAssurance
     */
    public void setPartenariatAssurance(Assureur PartenariatAssurance) {
        this.PartenariatAssurance = PartenariatAssurance;
    }

    @ManyToOne
    private TypeProduit LeTypeDeProduit;

    /**
     * Get the value of LeTypeDeProduit
     *
     * @return the value of LeTypeDeProduit
     */
    public TypeProduit getLeTypeDeProduit() {
        return LeTypeDeProduit;
    }

    /**
     * Set the value of LeTypeDeProduit
     *
     * @param LeTypeDeProduit new value of LeTypeDeProduit
     */
    public void setLeTypeDeProduit(TypeProduit LeTypeDeProduit) {
        this.LeTypeDeProduit = LeTypeDeProduit;
    }

    /**
     * Get the value of OffreDeUtilisateurService
     *
     * @return the value of OffreDeUtilisateurService
     */
    public UtilisateurService getOffreDeUtilisateurService() {
        return OffreDeUtilisateurService;
    }

    /**
     * Set the value of OffreDeUtilisateurService
     *
     * @param OffreDeUtilisateurService new value of OffreDeUtilisateurService
     */
    public void setOffreDeUtilisateurService(UtilisateurService OffreDeUtilisateurService) {
        this.OffreDeUtilisateurService = OffreDeUtilisateurService;
    }

    /**
     * Get the value of OffreActive
     *
     * @return the value of OffreActive
     */
    public boolean isOffreActive() {
        return OffreActive;
    }

    /**
     * Set the value of OffreActive
     *
     * @param OffreActive new value of OffreActive
     */
    public void setOffreActive(boolean OffreActive) {
        this.OffreActive = OffreActive;
    }


    /**
     * Get the value of DescriptionOffreContractuelle
     *
     * @return the value of DescriptionOffreContractuelle
     */
    public String getDescriptionOffreContractuelle() {
        return DescriptionOffreContractuelle;
    }

    /**
     * Set the value of DescriptionOffreContractuelle
     *
     * @param DescriptionOffreContractuelle new value of
     * DescriptionOffreContractuelle
     */
    public void setDescriptionOffreContractuelle(String DescriptionOffreContractuelle) {
        this.DescriptionOffreContractuelle = DescriptionOffreContractuelle;
    }


    /**
     * Get the value of PrixOffre
     *
     * @return the value of PrixOffre
     */
    public double getPrixOffre() {
        return PrixOffre;
    }

    /**
     * Set the value of PrixOffre
     *
     * @param PrixOffre new value of PrixOffre
     */
    public void setPrixOffre(double PrixOffre) {
        this.PrixOffre = PrixOffre;
    }


    /**
     * Get the value of TypeOffre
     *
     * @return the value of TypeOffre
     */
    public String getTypeOffre() {
        return TypeOffre;
    }

    /**
     * Set the value of TypeOffre
     *
     * @param TypeOffre new value of TypeOffre
     */
    public void setTypeOffre(String TypeOffre) {
        this.TypeOffre = TypeOffre;
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
        if (!(object instanceof Offre)) {
            return false;
        }
        Offre other = (Offre) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Offre[ id=" + id + " ]";
    }
    
}
