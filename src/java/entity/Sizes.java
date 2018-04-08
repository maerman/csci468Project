/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Shane
 */
@Entity
@Table(name = "sizes")
@NamedQueries({
    @NamedQuery(name = "Sizes.findAll", query = "SELECT s FROM Sizes s"),
    @NamedQuery(name = "Sizes.findByIdsize", query = "SELECT s FROM Sizes s WHERE s.idsize = :idsize")})
public class Sizes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idsize")
    private Integer idsize;

    public Sizes() {
    }

    public Sizes(Integer idsize) {
        this.idsize = idsize;
    }

    public Integer getIdsize() {
        return idsize;
    }

    public void setIdsize(Integer idsize) {
        this.idsize = idsize;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsize != null ? idsize.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sizes)) {
            return false;
        }
        Sizes other = (Sizes) object;
        if ((this.idsize == null && other.idsize != null) || (this.idsize != null && !this.idsize.equals(other.idsize))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Sizes[idsize=" + idsize + "]";
    }

}
