package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
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

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="ordenpedidos")
public class OrdenPedido implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_pedido;
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE)
	private LocalDate fecha;
	
	
	
	public OrdenPedido() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	
	@ManyToOne
	@JoinColumn( name = "cod_estado",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_estado) references estadopedidos(cod_estado)"))
	private EstadoPedido estadopedido;
	
	
	
	@OneToMany(mappedBy = "ordenpedido")
	private Collection<ComprobantePago> itemsCompPago=new ArrayList<>();
	
	
	@ManyToOne
	@JoinColumn(name = "cod_Cliente",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_Cliente) references clientes(cod_Cliente)"))
	private Cliente cliente;



	public Integer getCod_pedido() {
		return cod_pedido;
	}


	public void setCod_pedido(Integer cod_pedido) {
		this.cod_pedido = cod_pedido;
	}


	public LocalDate getFecha() {
		return fecha;
	}


	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}


	public EstadoPedido getEstadopedido() {
		return estadopedido;
	}


	public void setEstadopedido(EstadoPedido estadopedido) {
		this.estadopedido = estadopedido;
	}


	public Collection<ComprobantePago> getItemsCompPago() {
		return itemsCompPago;
	}


	public void setItemsCompPago(Collection<ComprobantePago> itemsCompPago) {
		this.itemsCompPago = itemsCompPago;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}


	public OrdenPedido(Integer cod_pedido, LocalDate fecha, EstadoPedido estadopedido,
			Collection<ComprobantePago> itemsCompPago, Cliente cliente) {
		super();
		this.cod_pedido = cod_pedido;
		this.fecha = fecha;
		this.estadopedido = estadopedido;
		this.itemsCompPago = itemsCompPago;
		this.cliente = cliente;
	}





	
	

	
	
	

	
}
