package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.Table;




@Entity
@Table(name ="estadopedidos")
public class EstadoPedido implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_estado;
	
	@Column
	private String estado;
	
	
	@OneToMany(mappedBy = "estadopedido")
	private Collection<OrdenPedido> itemsOrdenes=new ArrayList<>();
	
	
	
	
	
	public EstadoPedido() {
		// TODO Auto-generated constructor stub
	}





	public Integer getCod_estado() {
		return cod_estado;
	}





	public void setCod_estado(Integer cod_estado) {
		this.cod_estado = cod_estado;
	}





	public String getEstado() {
		return estado;
	}





	public void setEstado(String estado) {
		this.estado = estado;
	}





	public Collection<OrdenPedido> getItemsOrdenes() {
		return itemsOrdenes;
	}





	public void setItemsOrdenes(Collection<OrdenPedido> itemsOrdenes) {
		this.itemsOrdenes = itemsOrdenes;
	}





	public EstadoPedido(Integer cod_estado, String estado, Collection<OrdenPedido> itemsOrdenes) {
		super();
		this.cod_estado = cod_estado;
		this.estado = estado;
		this.itemsOrdenes = itemsOrdenes;
	}

	



	




}
