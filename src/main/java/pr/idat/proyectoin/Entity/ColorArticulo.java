package pr.idat.proyectoin.Entity;

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
@Table(name = "color_articulo")
public class ColorArticulo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_color;
	
	@Column(length = 15)
	private String nombre;
	
	@OneToMany(mappedBy = "color")
	private Collection<Articulo> itemsArticulos = new ArrayList<>();
	
	public ColorArticulo() {
	}

	public ColorArticulo(Integer cod_color, String nombre, Collection<Articulo> itemsArticulos) {
		super();
		this.cod_color = cod_color;
		this.nombre = nombre;
		this.itemsArticulos = itemsArticulos;
	}

	public Integer getCod_color() {
		return cod_color;
	}

	public void setCod_color(Integer cod_color) {
		this.cod_color = cod_color;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setItemsArticulos(Collection<Articulo> itemsArticulos) {
		this.itemsArticulos = itemsArticulos;
	}
}
