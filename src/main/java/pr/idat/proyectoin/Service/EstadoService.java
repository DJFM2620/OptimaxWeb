package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.EstadoPedido;

public interface EstadoService {
	public abstract void Insert (EstadoPedido estado);
	public abstract void Update (EstadoPedido estado);
	public abstract void Delete (Integer ID);
	public abstract EstadoPedido FindByID(Integer ID);
	public abstract Collection<EstadoPedido> FindAll();
}
