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

@Table
@Entity(name = "TipoMaterialMontura")
public class TipoMaterialMontura implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Cod_TipMaterial;

	@Column
	private String Nombre_Materia;

	@OneToMany(mappedBy = "tipoMaterialMontura") // Referencia "categoria" va a productos
	private Collection<Articulo> itemsArticulos = new ArrayList<>();

	public TipoMaterialMontura() {
	}

	public TipoMaterialMontura(Integer cod_TipMaterial, String nombre_Materia, Collection<Articulo> itemsArticulos) {

		Cod_TipMaterial = cod_TipMaterial;
		Nombre_Materia = nombre_Materia;
		this.itemsArticulos = itemsArticulos;
	}

	public Integer getCod_TipMaterial() {
		return Cod_TipMaterial;
	}

	public void setCod_TipMaterial(Integer cod_TipMaterial) {
		Cod_TipMaterial = cod_TipMaterial;
	}

	public String getNombre_Materia() {
		return Nombre_Materia;
	}

	public void setNombre_Materia(String nombre_Materia) {
		Nombre_Materia = nombre_Materia;
	}

	public void setItemsArticulos(Collection<Articulo> itemsArticulos) {
		this.itemsArticulos = itemsArticulos;
	}

}