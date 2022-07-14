package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.DetalleOrdenPedido;

public interface DetalleOrdenPedidoService  {

	public abstract void Insert (DetalleOrdenPedido detalleOrdenPedido);
	public abstract void Update (DetalleOrdenPedido detalleOrdenPedido);
	public abstract void Delete (Integer ID);
	public abstract DetalleOrdenPedido FindByID(Integer ID);
	public abstract Collection<DetalleOrdenPedido> FindAll();
	public abstract Collection<DetalleOrdenPedido> DetallePedidosCliente();
	public abstract Integer calculosubtotal(@Param("clienteDNI")Integer DNI,@Param("cod_pedido")Integer codigo);
	public abstract Collection<DetalleOrdenPedido> DetallePedido(@Param("clienteDNI")Integer DNI,@Param("pedidoCODIGO")Integer codigo);
}
