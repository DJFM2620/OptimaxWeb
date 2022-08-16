package pr.idat.proyectoin.Repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.DetalleOrdenPedido;

public interface DetalleOrdenPedidoRepository extends JpaRepository<DetalleOrdenPedido, Integer> {

	@Query(value = "select clientes.cod_cliente,clientes.dni,clientes.nombres,ordenpedidos.fecha,ordenpedidos.cod_pedido,detalle_orden_pedido.cantidad,detalle_orden_pedido.subtotal,detalle_orden_pedido.cod_articulo "
			+ "from clientes inner join ordenpedidos inner join detalle_orden_pedido  where dni=70546512", nativeQuery=true)
	public abstract Collection<DetalleOrdenPedido> DetallePedidosCliente();
	
	@Query(value = "select  sum(subtotal) as SUBTOTAL from detalle_orden_pedido inner join clientes where clientes.dni=:clienteDNI and cod_pedido=:cod_pedido", nativeQuery=true)
	public abstract Integer calculosubtotal(@Param("clienteDNI")Integer DNI,@Param("cod_pedido")Integer codigo);
	
	@Query(value = "select cantidad, subtotal,detalle_orden_pedido.cod_articulo, detalle_orden_pedido.cod_pedido from detalle_orden_pedido inner join clientes inner join ordenpedidos on ordenpedidos.cod_pedido=detalle_orden_pedido.cod_pedido where clientes.dni=:clienteDNI and ordenpedidos.cod_pedido=:pedidoCODIGO Order by ordenpedidos.fecha desc;"
			+ "", nativeQuery=true)
	public abstract Collection<DetalleOrdenPedido> DetallePedido(@Param("clienteDNI")Integer DNI,@Param("pedidoCODIGO")Integer codigo);
	

}



