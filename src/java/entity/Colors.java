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
@Table(name = "colors")
@NamedQueries({
    @NamedQuery(name = "Colors.findAll", query = "SELECT c FROM Colors c"),
    @NamedQuery(name = "Colors.findByIdcolors", query = "SELECT c FROM Colors c WHERE c.idcolors = :idcolors")})
public class Colors implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idcolors")
    private Integer idcolors;

    public Colors() {
    }

    public Colors(Integer idcolors) {
        this.idcolors = idcolors;
    }

    public Integer getIdcolors() {
        return idcolors;
    }

    public void setIdcolors(Integer idcolors) {
        this.idcolors = idcolors;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcolors != null ? idcolors.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Colors)) {
            return false;
        }
        Colors other = (Colors) object;
        if ((this.idcolors == null && other.idcolors != null) || (this.idcolors != null && !this.idcolors.equals(other.idcolors))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Colors[idcolors=" + idcolors + "]";
    }

}
