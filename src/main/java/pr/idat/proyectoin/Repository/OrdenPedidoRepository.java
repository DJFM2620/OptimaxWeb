package pr.idat.proyectoin.Repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.OrdenPedido;

public interface OrdenPedidoRepository extends JpaRepository<OrdenPedido, Integer>{

	@Query(value="select count(*) as 'Clientes' from clientes where  dni =:clienteDNI",nativeQuery=true)
	public abstract Integer ExistenciaCliente(@Param("clienteDNI")Integer DNI );
	
	@Query(value = "select max(cod_pedido) from ordenpedidos", nativeQuery=true)
	public abstract Integer CodigoOrdenPedido();
	
	@Query(value = "select * from ordenpedidos join clientes on clientes.cod_cliente = ordenpedidos.cod_cliente where clientes.dni =:clienteDNI Order by ordenpedidos.fecha desc;"
			+ "", nativeQuery=true)
	public abstract Collection<OrdenPedido> PedidosCliente(@Param("clienteDNI")Integer DNI);
	
	@Query(value = "SELECT MAX(cod_pedido) FROM ordenpedidos WHERE cod_cliente =:clienteID", nativeQuery=true)
	public abstract Integer maxcodepedidobyid(@Param("clienteID")Integer id);
	
	@Query(value = "select OrdenPedidos.cod_pedido, fecha, sum(subtotal), estado "
			 + "from OrdenPedidos join Detalle_Orden_Pedido "
			 + "On OrdenPedidos.cod_pedido = Detalle_Orden_Pedido.cod_pedido join estadopedidos "
			 + "On OrdenPedidos.cod_estado = estadopedidos.cod_estado "
			 + "where cod_cliente =:codCliente "
			 + "group by OrdenPedidos.cod_pedido ;", nativeQuery = true)
	public abstract List<Object[]> OrdenesPedidosMovil(@Param("codCliente") Integer DNI);
} 
