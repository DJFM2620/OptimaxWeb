package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="citas")
public class Cita implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_Cita;
	
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd",iso=ISO.DATE)
	private LocalDate fecha;
	
	@Column
	@DateTimeFormat(pattern = "HH:mm", iso = ISO.TIME)
	private LocalTime Hora;

	@ManyToOne
	@JoinColumn(name = "cod_Cliente",nullable = false, 
							 foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key(cod_Cliente) references clientes(cod_Cliente)"))
	private Cliente cliente;

	public Cita() {
		
	}

	public Integer getCod_Cita() {
		return cod_Cita;
	}

	public void setCod_Cita(Integer cod_Cita) {
		this.cod_Cita = cod_Cita;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public LocalTime getHora() {
		return Hora;
	}

	public void setHora(LocalTime hora) {
		Hora = hora;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Cita(Integer cod_Cita, LocalDate fecha, LocalTime hora, Cliente cliente) {
		super();
		this.cod_Cita = cod_Cita;
		this.fecha = fecha;
		Hora = hora;
		this.cliente = cliente;
	}

}