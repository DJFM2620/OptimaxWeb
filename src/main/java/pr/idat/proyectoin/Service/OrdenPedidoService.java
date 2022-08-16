package pr.idat.proyectoin.Service;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Dto.OrdenPedidoDto;
import pr.idat.proyectoin.Entity.OrdenPedido;

public interface OrdenPedidoService {

	public abstract void Insert (OrdenPedido ordenPedido);
	public abstract void Update (OrdenPedido ordenPedido);
	public abstract void Delete (Integer ID);
	public abstract  OrdenPedido FindByID(Integer ID);
	public abstract Collection<OrdenPedido> FindAll();
	
	public abstract Integer CodigoOrdenPedido();
	public abstract Collection<OrdenPedido> PedidosCliente(@Param("clienteDNI")Integer DNI);
	
	public Integer maxcodepedidobyid(Integer id);
	public abstract List<Object[]> OrdenesPedidosMovil(@Param("codCliente") Integer DNI);
	public abstract Collection<OrdenPedidoDto> ObtenerPedidosPerzonalizado(Integer DNI);
}
