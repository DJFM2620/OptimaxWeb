package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Entity.OrdenPedido;

public interface OrdenPedidoService {

	public abstract void Insert (OrdenPedido ordenPedido);
	public abstract void Update (OrdenPedido ordenPedido);
	public abstract void Delete (Integer ID);
	public abstract  OrdenPedido FindByID(Integer ID);
	public abstract Collection<OrdenPedido> FindAll();
	
	public abstract Integer CodigoOrdenPedido();
	public abstract Collection<OrdenPedido> PedidosCliente(@Param("clienteDNI")Integer DNI);
	
	
}
