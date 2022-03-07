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
public class TypeProduit implements Serializable {

    @OneToMany(mappedBy = "LeTypeDeProduit")
    private List<Offre> LesOffresCorrespondantes;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable=false)
    private String NomTypeProduit;

    /**
     * Get the value of NomTypeProduit
     *
     * @return the value of NomTypeProduit
     */
    public String getNomTypeProduit() {
        return NomTypeProduit;
    }

    /**
     * Set the value of NomTypeProduit
     *
     * @param NomTypeProduit new value of NomTypeProduit
     */
    public void setNomTypeProduit(String NomTypeProduit) {
        this.NomTypeProduit = NomTypeProduit;
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
        if (!(object instanceof TypeProduit)) {
            return false;
        }
        TypeProduit other = (TypeProduit) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modele.TypeProduit[ id=" + id + " ]";
    }
    
}
