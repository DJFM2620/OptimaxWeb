package pr.idat.proyectoin.Entity;

import java.io.Serializable;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;

import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "detalleOrdenPedido")
@AssociationOverrides({
@AssociationOverride( name = "detalleOrdenPedido_ID.ordenpedido",
joinColumns = @JoinColumn( name = "cod_pedido", nullable = false,
foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cod_pedido) references ordenpedidos(cod_pedido)"))),
@AssociationOverride( name = "detalleOrdenPedido_ID.articulo",
joinColumns = @JoinColumn( name = "CodArticulo", nullable = false,
foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (CodArticulo) references articulos (CodArticulo)"))),
})
public class DetalleOrdenPedido implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private DetalleOrdenPedido_ID detalleOrdenPedido_ID= new DetalleOrdenPedido_ID();
	
	@Column
	private Integer cantidad;
	
	@Column
	private Double subtotal;
	
	public DetalleOrdenPedido() {
	}

	public DetalleOrdenPedido(DetalleOrdenPedido_ID detalleOrdenPedido_ID, Integer cantidad, Double subtotal) {
	
		this.detalleOrdenPedido_ID = detalleOrdenPedido_ID;
		this.cantidad = cantidad;
		this.subtotal = subtotal;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cantidad == null) ? 0 : cantidad.hashCode());
		result = prime * result + ((detalleOrdenPedido_ID == null) ? 0 : detalleOrdenPedido_ID.hashCode());
		result = prime * result + ((subtotal == null) ? 0 : subtotal.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DetalleOrdenPedido other = (DetalleOrdenPedido) obj;
		if (cantidad == null) {
			if (other.cantidad != null)
				return false;
		} else if (!cantidad.equals(other.cantidad))
			return false;
		if (detalleOrdenPedido_ID == null) {
			if (other.detalleOrdenPedido_ID != null)
				return false;
		} else if (!detalleOrdenPedido_ID.equals(other.detalleOrdenPedido_ID))
			return false;
		if (subtotal == null) {
			if (other.subtotal != null)
				return false;
		} else if (!subtotal.equals(other.subtotal))
			return false;
		return true;
	}

	public DetalleOrdenPedido_ID getDetalleOrdenPedido_ID() {
		return detalleOrdenPedido_ID;
	}

	public void setDetalleOrdenPedido_ID(DetalleOrdenPedido_ID detalleOrdenPedido_ID) {
		this.detalleOrdenPedido_ID = detalleOrdenPedido_ID;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	
	public Articulo getArticulo() {
		return detalleOrdenPedido_ID.getArticulo();
	}

	public void setArticulo(Articulo articulo) {
		detalleOrdenPedido_ID.setArticulo(articulo);
	}

	public OrdenPedido getOrdenpedido() {
		return detalleOrdenPedido_ID.getOrdenpedido();
	}

	public void setOrdenpedido(OrdenPedido ordenpedido) {
		detalleOrdenPedido_ID.setOrdenpedido(ordenpedido);
	}
}
