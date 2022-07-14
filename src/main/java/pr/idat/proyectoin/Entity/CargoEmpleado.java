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
@Table(name="cargoempleados")
public class CargoEmpleado implements Serializable
{
private static final long serialVersionUID = 1L;

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer cod_cargoemp;

@Column
private String cargo;



public CargoEmpleado() {
// TODO Auto-generated constructor stub
}


@OneToMany(mappedBy = "tipoempleado")
private Collection<Empleado> itemEmpleados=new ArrayList<>();



public Integer getCod_cargoemp() {
	return cod_cargoemp;
}


public void setCod_cargoemp(Integer cod_cargoemp) {
	this.cod_cargoemp = cod_cargoemp;
}


public String getCargo() {
	return cargo;
}


public void setCargo(String cargo) {
	this.cargo = cargo;
}


public Collection<Empleado> getItemEmpleados() {
	return itemEmpleados;
}


public void setItemEmpleados(Collection<Empleado> itemEmpleados) {
	this.itemEmpleados = itemEmpleados;
}


public CargoEmpleado(Integer cod_cargoemp, String cargo, Collection<Empleado> itemEmpleados) {
	super();
	this.cod_cargoemp = cod_cargoemp;
	this.cargo = cargo;
	this.itemEmpleados = itemEmpleados;
}










}
