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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;

/**
 *
 * @author alex_
 */

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class UtilisateurService implements Serializable {

    @OneToMany(mappedBy = "OffreDeUtilisateurService")
    private List<Offre> offres;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable = false, unique = true)
    private String LoginUserService;
    @Column(nullable=false)
    private String PasswordUserService;
    @Column(nullable=false)
    private String TypeUserService;

    /**
     * Get the value of TypeUserService
     *
     * @return the value of TypeUserService
     */
    public String getTypeUserService() {
        return TypeUserService;
    }

    /**
     * Set the value of TypeUserService
     *
     * @param TypeUserService new value of TypeUserService
     */
    public void setTypeUserService(String TypeUserService) {
        this.TypeUserService = TypeUserService;
    }


    /**
     * Get the value of PasswordUserService
     *
     * @return the value of PasswordUserService
     */
    public String getPasswordUserService() {
        return PasswordUserService;
    }

    /**
     * Set the value of PasswordUserService
     *
     * @param PasswordUserService new value of PasswordUserService
     */
    public void setPasswordUserService(String PasswordUserService) {
        this.PasswordUserService = PasswordUserService;
    }


    /**
     * Get the value of LoginUserService
     *
     * @return the value of LoginUserService
     */
    public String getLoginUserService() {
        return LoginUserService;
    }

    /**
     * Set the value of LoginUserService
     *
     * @param LoginUserService new value of LoginUserService
     */
    public void setLoginUserService(String LoginUserService) {
        this.LoginUserService = LoginUserService;
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
        if (!(object instanceof UtilisateurService)) {
            return false;
        }
        UtilisateurService other = (UtilisateurService) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.UtilisateurService[ id=" + id + " ]";
    }
    
}
