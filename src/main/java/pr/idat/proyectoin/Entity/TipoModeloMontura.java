package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TipoModeloMontura")
public class TipoModeloMontura implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Cod_Modelo;

	@Column
	private String Forma_Modelo;

	@OneToMany(mappedBy = "tipoModeloMontura") // Referencia "categoria" va a productos
	private Collection<Articulo> itemsArticulos = new ArrayList<>();

	public TipoModeloMontura() {
		super();
	}

	public TipoModeloMontura(Integer cod_Modelo, String forma_Modelo, Collection<Articulo> itemsArticulos) {
		super();
		Cod_Modelo = cod_Modelo;
		Forma_Modelo = forma_Modelo;
		this.itemsArticulos = itemsArticulos;
	}

	public Integer getCod_Modelo() {
		return Cod_Modelo;
	}

	public void setCod_Modelo(Integer cod_Modelo) {
		Cod_Modelo = cod_Modelo;
	}

	public String getForma_Modelo() {
		return Forma_Modelo;
	}

	public void setForma_Modelo(String forma_Modelo) {
		Forma_Modelo = forma_Modelo;
	}

	public void setItemsArticulos(Collection<Articulo> itemsArticulos) {
		this.itemsArticulos = itemsArticulos;
	}

}
