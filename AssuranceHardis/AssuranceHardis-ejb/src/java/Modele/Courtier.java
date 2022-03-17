/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

/**
 *
 * @author alex_
 */
@Entity
public class Courtier extends UtilisateurService implements Serializable {

    @OneToMany(mappedBy = "LeCourtier")
    private List<Offre> LesOffresDuCourtier;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String NomCourtier;
    @Column(nullable=false)
    private String PrenomCourtier;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateNaissanceCourtier;
    @Column(nullable=false)
    private String AdresseCourtier;
    @Column(nullable=false)
    private String MailCourtier;
    @Column(nullable=false)
    private String VilleCourtier;
    @Column(nullable=false)
    private String CPCourtier;
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
     * Get the value of CPCourtier
     *
     * @return the value of CPCourtier
     */
    public String getCPCourtier() {
        return CPCourtier;
    }

    /**
     * Set the value of CPCourtier
     *
     * @param CPCourtier new value of CPCourtier
     */
    public void setCPCourtier(String CPCourtier) {
        this.CPCourtier = CPCourtier;
    }

    /**
     * Get the value of VilleCourtier
     *
     * @return the value of VilleCourtier
     */
    public String getVilleCourtier() {
        return VilleCourtier;
    }

    /**
     * Set the value of VilleCourtier
     *
     * @param VilleCourtier new value of VilleCourtier
     */
    public void setVilleCourtier(String VilleCourtier) {
        this.VilleCourtier = VilleCourtier;
    }

    /**
     * Get the value of MailCourtier
     *
     * @return the value of MailCourtier
     */
    public String getMailCourtier() {
        return MailCourtier;
    }

    /**
     * Set the value of MailCourtier
     *
     * @param MailCourtier new value of MailCourtier
     */
    public void setMailCourtier(String MailCourtier) {
        this.MailCourtier = MailCourtier;
    }


    /**
     * Get the value of AdresseCourtier
     *
     * @return the value of AdresseCourtier
     */
    public String getAdresseCourtier() {
        return AdresseCourtier;
    }

    /**
     * Set the value of AdresseCourtier
     *
     * @param AdresseCourtier new value of AdresseCourtier
     */
    public void setAdresseCourtier(String AdresseCourtier) {
        this.AdresseCourtier = AdresseCourtier;
    }


    /**
     * Get the value of DateNaissanceCourtier
     *
     * @return the value of DateNaissanceCourtier
     */
    public Date getDateNaissanceCourtier() {
        return DateNaissanceCourtier;
    }

    /**
     * Set the value of DateNaissanceCourtier
     *
     * @param DateNaissanceCourtier new value of DateNaissanceCourtier
     */
    public void setDateNaissanceCourtier(Date DateNaissanceCourtier) {
        this.DateNaissanceCourtier = DateNaissanceCourtier;
    }


    /**
     * Get the value of PrenomCourtier
     *
     * @return the value of PrenomCourtier
     */
    public String getPrenomCourtier() {
        return PrenomCourtier;
    }

    /**
     * Set the value of PrenomCourtier
     *
     * @param PrenomCourtier new value of PrenomCourtier
     */
    public void setPrenomCourtier(String PrenomCourtier) {
        this.PrenomCourtier = PrenomCourtier;
    }


    /**
     * Get the value of NomCourtier
     *
     * @return the value of NomCourtier
     */
    public String getNomCourtier() {
        return NomCourtier;
    }

    /**
     * Set the value of NomCourtier
     *
     * @param NomCourtier new value of NomCourtier
     */
    public void setNomCourtier(String NomCourtier) {
        this.NomCourtier = NomCourtier;
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
        if (!(object instanceof Courtier)) {
            return false;
        }
        Courtier other = (Courtier) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Courtier[ id=" + id + " ]";
    }
    
}
