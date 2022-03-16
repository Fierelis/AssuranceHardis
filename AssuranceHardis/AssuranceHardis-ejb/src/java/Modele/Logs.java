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
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author alex_
 */
@Entity
public class Logs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String TypeLog;
    @ManyToOne
    private UtilisateurService LogUserService;
    
    @ManyToOne
    private UtilisateurClient LogUserClient;

    @ManyToOne
    private Contrat LogContrat;

    @ManyToOne
    private Offre LogOffre;

    @ManyToOne
    private Administrateur LogUserAdmin;

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateLog;

    /**
     * Get the value of DateLog
     *
     * @return the value of DateLog
     */
    public Date getDateLog() {
        return DateLog;
    }

    /**
     * Set the value of DateLog
     *
     * @param DateLog new value of DateLog
     */
    public void setDateLog(Date DateLog) {
        this.DateLog = DateLog;
    }

    /**
     * Get the value of LogUserAdmin
     *
     * @return the value of LogUserAdmin
     */
    public Administrateur getLogUserAdmin() {
        return LogUserAdmin;
    }

    /**
     * Set the value of LogUserAdmin
     *
     * @param LogUserAdmin new value of LogUserAdmin
     */
    public void setLogUserAdmin(Administrateur LogUserAdmin) {
        this.LogUserAdmin = LogUserAdmin;
    }

    /**
     * Get the value of LogOffre
     *
     * @return the value of LogOffre
     */
    public Offre getLogOffre() {
        return LogOffre;
    }

    /**
     * Set the value of LogOffre
     *
     * @param LogOffre new value of LogOffre
     */
    public void setLogOffre(Offre LogOffre) {
        this.LogOffre = LogOffre;
    }

    /**
     * Get the value of LogContrat
     *
     * @return the value of LogContrat
     */
    public Contrat getLogContrat() {
        return LogContrat;
    }

    /**
     * Set the value of LogContrat
     *
     * @param LogContrat new value of LogContrat
     */
    public void setLogContrat(Contrat LogContrat) {
        this.LogContrat = LogContrat;
    }

    /**
     * Get the value of LogUserClient
     *
     * @return the value of LogUserClient
     */
    public UtilisateurClient getLogUserClient() {
        return LogUserClient;
    }

    /**
     * Set the value of LogUserClient
     *
     * @param LogUserClient new value of LogUserClient
     */
    public void setLogUserClient(UtilisateurClient LogUserClient) {
        this.LogUserClient = LogUserClient;
    }


    /**
     * Get the value of LogUserService
     *
     * @return the value of LogUserService
     */
    public UtilisateurService getLogUserService() {
        return LogUserService;
    }

    /**
     * Set the value of LogUserService
     *
     * @param LogUserService new value of LogUserService
     */
    public void setLogUserService(UtilisateurService LogUserService) {
        this.LogUserService = LogUserService;
    }
 /**
     * Get the value of TypeLog
     *
     * @return the value of TypeLog
     */
    public String getTypeLog() {
        return TypeLog;
    }

    /**
     * Set the value of TypeLog
     *
     * @param TypeLog new value of TypeLog
     */
    public void setTypeLog(String TypeLog) {
        this.TypeLog = TypeLog;
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
        if (!(object instanceof Logs)) {
            return false;
        }
        Logs other = (Logs) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Logs[ id=" + id + " ]";
    }
    
}
