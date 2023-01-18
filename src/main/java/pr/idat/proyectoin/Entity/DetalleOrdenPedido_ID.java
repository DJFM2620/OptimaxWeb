package pr.idat.proyectoin.Entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class DetalleOrdenPedido_ID implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	private Articulo articulo;
	
	@ManyToOne
	private OrdenPedido ordenpedido;

	public DetalleOrdenPedido_ID() {
	}

	public DetalleOrdenPedido_ID(Articulo articulo, OrdenPedido ordenpedido) {

		this.articulo = articulo;
		this.ordenpedido = ordenpedido;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}

	public OrdenPedido getOrdenpedido() {
		return ordenpedido;
	}

	public void setOrdenpedido(OrdenPedido ordenpedido) {
		this.ordenpedido = ordenpedido;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((articulo == null) ? 0 : articulo.hashCode());
		result = prime * result + ((ordenpedido == null) ? 0 : ordenpedido.hashCode());
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
		DetalleOrdenPedido_ID other = (DetalleOrdenPedido_ID) obj;
		if (articulo == null) {
			if (other.articulo != null)
				return false;
		} else if (!articulo.equals(other.articulo))
			return false;
		if (ordenpedido == null) {
			if (other.ordenpedido != null)
				return false;
		} else if (!ordenpedido.equals(other.ordenpedido))
			return false;
		return true;
	}
}
