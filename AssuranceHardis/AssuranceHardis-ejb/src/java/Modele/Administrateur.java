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
import javax.persistence.OneToMany;

/**
 *
 * @author alex_
 */
@Entity
public class Administrateur implements Serializable {

    @OneToMany(mappedBy = "LogUserAdmin")
    private List<Logs> AssociatedLogss;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String NomAdmin;
    @Column(nullable=false)
    private String PrenomAdmin;
    @Column(nullable=false)
    private String MailAdmin;
    @Column(nullable=false)
    private String LoginAdmin;
    @Column(nullable=false)
    private String PasswordAdmin;
    @Column(nullable=false)
    private String TypeUserAdmin;

    /**
     * Get the value of TypeUserAdmin
     *
     * @return the value of TypeUserAdmin
     */
    public String getTypeUserAdmin() {
        return TypeUserAdmin;
    }

    /**
     * Set the value of TypeUserAdmin
     *
     * @param TypeUserAdmin new value of TypeUserAdmin
     */
    public void setTypeUserAdmin(String TypeUserAdmin) {
        this.TypeUserAdmin = TypeUserAdmin;
    }


    /**
     * Get the value of PasswordAdmin
     *
     * @return the value of PasswordAdmin
     */
    public String getPasswordAdmin() {
        return PasswordAdmin;
    }

    /**
     * Set the value of PasswordAdmin
     *
     * @param PasswordAdmin new value of PasswordAdmin
     */
    public void setPasswordAdmin(String PasswordAdmin) {
        this.PasswordAdmin = PasswordAdmin;
    }

    /**
     * Get the value of LoginAdmin
     *
     * @return the value of LoginAdmin
     */
    public String getLoginAdmin() {
        return LoginAdmin;
    }

    /**
     * Set the value of LoginAdmin
     *
     * @param LoginAdmin new value of LoginAdmin
     */
    public void setLoginAdmin(String LoginAdmin) {
        this.LoginAdmin = LoginAdmin;
    }


    /**
     * Get the value of MailAdmin
     *
     * @return the value of MailAdmin
     */
    public String getMailAdmin() {
        return MailAdmin;
    }

    /**
     * Set the value of MailAdmin
     *
     * @param MailAdmin new value of MailAdmin
     */
    public void setMailAdmin(String MailAdmin) {
        this.MailAdmin = MailAdmin;
    }

    /**
     * Get the value of PrenomAdmin
     *
     * @return the value of PrenomAdmin
     */
    public String getPrenomAdmin() {
        return PrenomAdmin;
    }

    /**
     * Set the value of PrenomAdmin
     *
     * @param PrenomAdmin new value of PrenomAdmin
     */
    public void setPrenomAdmin(String PrenomAdmin) {
        this.PrenomAdmin = PrenomAdmin;
    }

    /**
     * Get the value of NomAdmin
     *
     * @return the value of NomAdmin
     */
    public String getNomAdmin() {
        return NomAdmin;
    }

    /**
     * Set the value of NomAdmin
     *
     * @param NomAdmin new value of NomAdmin
     */
    public void setNomAdmin(String NomAdmin) {
        this.NomAdmin = NomAdmin;
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
        if (!(object instanceof Administrateur)) {
            return false;
        }
        Administrateur other = (Administrateur) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.Administrateur[ id=" + id + " ]";
    }
    
}
