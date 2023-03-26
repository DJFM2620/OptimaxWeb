package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "articulos")
public class Articulo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CodArticulo;
	
	@Column
	private Integer Stock;
	
	@Column
	private Double Precio;
	
	@Column(columnDefinition = "longblob")
	private byte[] imagen;
	
	@ManyToOne
	@JoinColumn(name = "Cod_Color", nullable = false,
						  foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cod_color) references color_articulo(cod_color)"))
	private ColorArticulo color;
	
	@ManyToOne
	@JoinColumn(name = "Cod_TipMaterial", nullable = false,
						  foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cod_tip_material) references tipo_material_montura(cod_tip_material)"))
	private TipoMaterialMontura tipoMaterialMontura; // La referencia 
	
	@ManyToOne
	@JoinColumn(name = "Cod_Modelo", nullable = false,
						  foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cod_modelo) references tipo_modelo_montura(cod_modelo)"))
	private TipoModeloMontura tipoModeloMontura; // La referencia 
	
	@ManyToOne
	@JoinColumn(name = "Cod_Marca", nullable = false,
						  foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (cod_marca) references marca_montura(cod_marca)"))
	private MarcaMontura marcaMontura; // La referencia 

	public Articulo() {
	}

	public Articulo(Integer codArticulo, Integer stock, Double precio, byte[] imagen, ColorArticulo color,
			TipoMaterialMontura tipoMaterialMontura, TipoModeloMontura tipoModeloMontura, MarcaMontura marcaMontura) {
		super();
		CodArticulo = codArticulo;
		Stock = stock;
		Precio = precio;
		this.imagen = imagen;
		this.color = color;
		this.tipoMaterialMontura = tipoMaterialMontura;
		this.tipoModeloMontura = tipoModeloMontura;
		this.marcaMontura = marcaMontura;
	}

	public Integer getCodArticulo() {
		return CodArticulo;
	}

	public void setCodArticulo(Integer codArticulo) {
		CodArticulo = codArticulo;
	}

	public Integer getStock() {
		return Stock;
	}

	public void setStock(Integer stock) {
		Stock = stock;
	}

	public Double getPrecio() {
		return Precio;
	}

	public void setPrecio(Double precio) {
		Precio = precio;
	}

	public ColorArticulo getColor() {
		return color;
	}

	public void setColor(ColorArticulo color) {
		this.color = color;
	}

	public TipoMaterialMontura getTipoMaterialMontura() {
		return tipoMaterialMontura;
	}

	public void setTipoMaterialMontura(TipoMaterialMontura tipoMaterialMontura) {
		this.tipoMaterialMontura = tipoMaterialMontura;
	}

	public TipoModeloMontura getTipoModeloMontura() {
		return tipoModeloMontura;
	}

	public void setTipoModeloMontura(TipoModeloMontura tipoModeloMontura) {
		this.tipoModeloMontura = tipoModeloMontura;
	}

	public MarcaMontura getMarcaMontura() {
		return marcaMontura;
	}

	public void setMarcaMontura(MarcaMontura marcaMontura) {
		this.marcaMontura = marcaMontura;
	}

	public byte[] getImagen() {
		return imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}
	
	public String getBase64Imagen()
	{
		String base64=Base64.getEncoder().encodeToString(this.imagen);
		return base64;
	}
}