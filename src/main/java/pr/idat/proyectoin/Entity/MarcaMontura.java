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
@Table(name = "MarcaMontura")
public class MarcaMontura implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Cod_Marca;

	@Column
	private String Nombre_Marca;

	@OneToMany(mappedBy = "marcaMontura") // Referencia "categoria" va a productos
	private Collection<Articulo> itemsArticulos = new ArrayList<>();

	public MarcaMontura() {

	}

	public MarcaMontura(Integer cod_Marca, String nombre_Marca, Collection<Articulo> itemsArticulos) {

		Cod_Marca = cod_Marca;
		Nombre_Marca = nombre_Marca;
		this.itemsArticulos = itemsArticulos;
	}

	public Integer getCod_Marca() {
		return Cod_Marca;
	}

	public void setCod_Marca(Integer cod_Marca) {
		Cod_Marca = cod_Marca;
	}

	public String getNombre_Marca() {
		return Nombre_Marca;
	}

	public void setNombre_Marca(String nombre_Marca) {
		Nombre_Marca = nombre_Marca;
	}

	public void setItemsArticulos(Collection<Articulo> itemsArticulos) {
		this.itemsArticulos = itemsArticulos;
	}

}