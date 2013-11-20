/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sortiz
 */
@Entity
@Table(name = "tasa_interes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TasaInteres.findAll", query = "SELECT t FROM TasaInteres t"),
    @NamedQuery(name = "TasaInteres.findById", query = "SELECT t FROM TasaInteres t WHERE t.id = :id"),
    @NamedQuery(name = "TasaInteres.findByNombreLinea", query = "SELECT t FROM TasaInteres t WHERE t.nombreLinea = :nombreLinea"),
    @NamedQuery(name = "TasaInteres.findByTasaInteres", query = "SELECT t FROM TasaInteres t WHERE t.tasaInteres = :tasaInteres")})
public class TasaInteres implements Serializable {
    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private BigDecimal id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombre_linea")
    private String nombreLinea;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tasa_interes")
    private BigDecimal tasaInteres;

    public TasaInteres() {
    }

    public TasaInteres(BigDecimal id) {
        this.id = id;
    }

    public TasaInteres(BigDecimal id, String nombreLinea, BigDecimal tasaInteres) {
        this.id = id;
        this.nombreLinea = nombreLinea;
        this.tasaInteres = tasaInteres;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getNombreLinea() {
        return nombreLinea;
    }

    public void setNombreLinea(String nombreLinea) {
        this.nombreLinea = nombreLinea;
    }

    public BigDecimal getTasaInteres() {
        return tasaInteres;
    }

    public void setTasaInteres(BigDecimal tasaInteres) {
        this.tasaInteres = tasaInteres;
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
        if (!(object instanceof TasaInteres)) {
            return false;
        }
        TasaInteres other = (TasaInteres) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.TasaInteres[ id=" + id + " ]";
    }
    
}
