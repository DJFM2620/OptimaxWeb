package pr.idat.proyectoin.Entity;

import java.io.Serializable;

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
@Table(name="comprobantepago")
public class ComprobantePago implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_comprpago;
	
	@Column
	private Double subtotaligv;
	
	@Column
	private Integer total;
	
	
	@ManyToOne
	@JoinColumn(name = "cod_empleado",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_empleado) references empleados(cod_empleado)"))
	private Empleado empleado;
	
	@ManyToOne
	@JoinColumn(name = "cod_pedido",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_pedido) references ordenpedidos(cod_pedido)"))
	private OrdenPedido ordenpedido;
	

	@ManyToOne
	@JoinColumn(name = "cod_tipcompago",nullable = false, 
				foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_tipcompago) references tipocomprobantepagos(cod_tipcompago)"))
	private TipoComprobantePago tipocomprobantepago;
	
	
	public ComprobantePago() {
		// TODO Auto-generated constructor stub
	}


	public Integer getCod_comprpago() {
		return cod_comprpago;
	}


	public void setCod_comprpago(Integer cod_comprpago) {
		this.cod_comprpago = cod_comprpago;
	}


	public Double getSubtotaligv() {
		return subtotaligv;
	}


	public void setSubtotaligv(Double subtotaligv) {
		this.subtotaligv = subtotaligv;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	public Empleado getEmpleado() {
		return empleado;
	}


	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}


	public OrdenPedido getOrdenpedido() {
		return ordenpedido;
	}


	public void setOrdenpedido(OrdenPedido ordenpedido) {
		this.ordenpedido = ordenpedido;
	}


	public TipoComprobantePago getTipocomprobantepago() {
		return tipocomprobantepago;
	}


	public void setTipocomprobantepago(TipoComprobantePago tipocomprobantepago) {
		this.tipocomprobantepago = tipocomprobantepago;
	}


	public ComprobantePago(Integer cod_comprpago, Double subtotaligv, Integer total, Empleado empleado,
			OrdenPedido ordenpedido, TipoComprobantePago tipocomprobantepago) {
		super();
		this.cod_comprpago = cod_comprpago;
		this.subtotaligv = subtotaligv;
		this.total = total;
		this.empleado = empleado;
		this.ordenpedido = ordenpedido;
		this.tipocomprobantepago = tipocomprobantepago;
	}



}
