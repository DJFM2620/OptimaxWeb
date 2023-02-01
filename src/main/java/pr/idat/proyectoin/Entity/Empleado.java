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
@Table(name = "empleados")
public class Empleado implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_empleado;
	
	@Column
	private String nombres;
	@Column
	private String apellidp;
	@Column
	private String apellidom;
	@Column
	private Integer telefono;
	@Column
	private Integer dni;
	@Column
	private String email;
	
	@OneToMany(mappedBy = "empleado")
	private Collection<ComprobantePago> itemsComprpago=new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name = "cod_cargoemp",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_cargoemp) references cargoempleados(cod_cargoemp)"))
	private CargoEmpleado tipoempleado;

	public Empleado() {
	}

	public Empleado(Integer cod_empleado, String nombres, String apellidp, String apellidom, Integer telefono,
			Integer dni, String email, Collection<ComprobantePago> itemsComprpago,
			CargoEmpleado tipoempleado) {
		
		super();
		this.cod_empleado = cod_empleado;
		this.nombres = nombres;
		this.apellidp = apellidp;
		this.apellidom = apellidom;
		this.telefono = telefono;
		this.dni = dni;
		this.email = email;
		this.itemsComprpago = itemsComprpago;
		this.tipoempleado = tipoempleado;
	}

	public Integer getCod_empleado() {
		return cod_empleado;
	}

	public void setCod_empleado(Integer cod_empleado) {
		this.cod_empleado = cod_empleado;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidp() {
		return apellidp;
	}

	public void setApellidp(String apellidp) {
		this.apellidp = apellidp;
	}

	public String getApellidom() {
		return apellidom;
	}

	public void setApellidom(String apeelidom) {
		this.apellidom = apeelidom;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public Integer getDni() {
		return dni;
	}

	public void setDni(Integer dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Collection<ComprobantePago> getItemsComprpago() {
		return itemsComprpago;
	}

	public void setItemsComprpago(Collection<ComprobantePago> itemsComprpago) {
		this.itemsComprpago = itemsComprpago;
	}

	public CargoEmpleado getTipoempleado() {
		return tipoempleado;
	}

	public void setTipoempleado(CargoEmpleado tipoempleado) {
		this.tipoempleado = tipoempleado;
	}
}