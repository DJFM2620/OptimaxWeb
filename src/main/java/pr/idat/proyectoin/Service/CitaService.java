package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Entity.OrdenPedido;

public interface CitaService{

	public abstract void Insert (Cita cita);
	public abstract void Update (Cita cita);
	public abstract void Delete (Integer ID);
	public abstract Cita FindByID(Integer ID);
	public abstract Collection<Cita> FindAll();
	public abstract Collection<Cita> CitasCliente(@Param("clienteDNI")Integer DNI);
}
