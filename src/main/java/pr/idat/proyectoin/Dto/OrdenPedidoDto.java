package pr.idat.proyectoin.Dto;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class OrdenPedidoDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer cod_pedido;
	private String fecha;
	private Double subTotal;
	private String estado;
	
	public OrdenPedidoDto() {
	}

	public OrdenPedidoDto(Integer cod_pedido, String fecha, Double subTotal, String estado) {
		super();
		this.cod_pedido = cod_pedido;
		this.fecha = fecha;
		this.subTotal = subTotal;
		this.estado = estado;
	}

	public Integer getCod_pedido() {
		return cod_pedido;
	}

	public void setCod_pedido(Integer cod_pedido) {
		this.cod_pedido = cod_pedido;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}