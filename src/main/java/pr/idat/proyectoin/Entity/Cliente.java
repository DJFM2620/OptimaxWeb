package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_Cliente;

	@Column
	private String nombres;
	@Column
	private String apellidop;
	@Column
	private String apellidom;
	@Column
	private Integer celular;
	@Column
	private String email;
	@Column
	private Integer dni;
	@Column
	private String ruc;
	@Column
	private String direccion;

	@OneToMany(mappedBy = "cliente")
	private Collection<OrdenPedido> itemsOrdenpedido = new ArrayList<>();

	@OneToMany(mappedBy = "cliente")
	private Collection<Cita> itemsCita = new ArrayList<>();

	@ManyToOne
	@JoinColumn(name = "cod_distrito", nullable = false, foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_distrito) references distritos(cod_distrito)"))
	private Distrito distrito;

	public Cliente() {
	}
	
	public Cliente(Integer cod_Cliente, String nombres, String apellidop, String apellidom, Integer celular,
			String email, Integer dni, String ruc, String direccion, Distrito distrito) {
		super();
		this.cod_Cliente = cod_Cliente;
		this.nombres = nombres;
		this.apellidop = apellidop;
		this.apellidom = apellidom;
		this.celular = celular;
		this.email = email;
		this.dni = dni;
		this.ruc = ruc;
		this.direccion = direccion;
		this.distrito = distrito;
	}

	public Integer getCod_Cliente() {
		return cod_Cliente;
	}

	public void setCod_Cliente(Integer cod_Cliente) {
		this.cod_Cliente = cod_Cliente;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidop() {
		return apellidop;
	}

	public void setApellidop(String apellidop) {
		this.apellidop = apellidop;
	}

	public String getApellidom() {
		return apellidom;
	}

	public void setApellidom(String apellidom) {
		this.apellidom = apellidom;
	}

	public Integer getCelular() {
		return celular;
	}

	public void setCelular(Integer celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getDni() {
		return dni;
	}

	public void setDni(Integer dni) {
		this.dni = dni;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public void setItemsOrdenpedido(Collection<OrdenPedido> itemsOrdenpedido) {
		this.itemsOrdenpedido = itemsOrdenpedido;
	}

	public void setItemsCita(Collection<Cita> itemsCita) {
		this.itemsCita = itemsCita;
	}

	public Distrito getDistrito() {
		return distrito;
	}

	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
}
