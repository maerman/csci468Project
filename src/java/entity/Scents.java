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
@Table(name = "scents")
@NamedQueries({
    @NamedQuery(name = "Scents.findAll", query = "SELECT s FROM Scents s"),
    @NamedQuery(name = "Scents.findByIdscents", query = "SELECT s FROM Scents s WHERE s.idscents = :idscents")})
public class Scents implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idscents")
    private Integer idscents;

    public Scents() {
    }

    public Scents(Integer idscents) {
        this.idscents = idscents;
    }

    public Integer getIdscents() {
        return idscents;
    }

    public void setIdscents(Integer idscents) {
        this.idscents = idscents;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idscents != null ? idscents.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Scents)) {
            return false;
        }
        Scents other = (Scents) object;
        if ((this.idscents == null && other.idscents != null) || (this.idscents != null && !this.idscents.equals(other.idscents))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Scents[idscents=" + idscents + "]";
    }

}
