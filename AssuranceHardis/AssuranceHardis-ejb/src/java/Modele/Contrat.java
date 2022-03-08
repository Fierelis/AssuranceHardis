/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import java.util.List;
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
public class Contrat implements Serializable {

    @OneToMany(mappedBy = "LogContrat")
    private List<Logs> AssociatedLogs;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private double PrixOffre;

    private String DescriptionContrat;

    private int DureeContrat;
    
    @ManyToOne
    private Offre LoffreDuContrat;

    @ManyToOne
    private UtilisateurClient LeClientduContrat;

    /**
     * Get the value of LeClientduContrat
     *
     * @return the value of LeClientduContrat
     */
    public UtilisateurClient getLeClientduContrat() {
        return LeClientduContrat;
    }

    /**
     * Set the value of LeClientduContrat
     *
     * @param LeClientduContrat new value of LeClientduContrat
     */
    public void setLeClientduContrat(UtilisateurClient LeClientduContrat) {
        this.LeClientduContrat = LeClientduContrat;
    }

    /**
     * Get the value of LoffreDuContrat
     *
     * @return the value of LoffreDuContrat
     */
    public Offre getLoffreDuContrat() {
        return LoffreDuContrat;
    }

    /**
     * Set the value of LoffreDuContrat
     *
     * @param LoffreDuContrat new value of LoffreDuContrat
     */
    public void setLoffreDuContrat(Offre LoffreDuContrat) {
        this.LoffreDuContrat = LoffreDuContrat;
    }


    /**
     * Get the value of DureeContrat
     *
     * @return the value of DureeContrat
     */
    public int getDureeContrat() {
        return DureeContrat;
    }

    /**
     * Set the value of DureeContrat
     *
     * @param DureeContrat new value of DureeContrat
     */
    public void setDureeContrat(int DureeContrat) {
        this.DureeContrat = DureeContrat;
    }

    /**
     * Get the value of DescriptionContrat
     *
     * @return the value of DescriptionContrat
     */
    public String getDescriptionContrat() {
        return DescriptionContrat;
    }

    /**
     * Set the value of DescriptionContrat
     *
     * @param DescriptionContrat new value of DescriptionContrat
     */
    public void setDescriptionContrat(String DescriptionContrat) {
        this.DescriptionContrat = DescriptionContrat;
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
