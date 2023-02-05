package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

	@Query(value="select cod_cliente from clientes where email=:clienteemail and dni=:clientedni", nativeQuery=true)
	public abstract Integer validacioncliente(@Param("clienteemail")String email,@Param("clientedni") Integer dni);
	
	@Query(value="select count(*) as 'Clientes' from clientes where dni =:clienteDNI", nativeQuery=true)
	public abstract Integer ExistenciaCliente(@Param("clienteDNI")Integer DNI );
	
	@Query(value="select cod_cliente from clientes where dni=:clienteDNI", nativeQuery=true)
	public abstract Integer ObtenerCodigoCliente(@Param("clienteDNI")Integer DNI );

	@Query(value="select * from clientes where email =:clienteEmail", nativeQuery=true)
	public abstract Cliente ObtenerCodigoByEmail(@Param("clienteEmail") String Email );
	
	@Query(value="SELECT count(*) FROM CITAS WHERE COD_CLIENTE = :codCliente", nativeQuery=true)
	public abstract Integer CountCitasCliente(@Param("codCliente") Integer codCliente );
	
	@Query(value="SELECT count(*) FROM ORDENPEDIDOS WHERE COD_CLIENTE = :codCliente", nativeQuery=true)
	public abstract Integer CountOrdenesCliente(@Param("codCliente") Integer codCliente );
	
	@Query(value="SELECT DIRECCION FROM CLIENTES WHERE EMAIL = :Email", nativeQuery = true)
	public abstract String ObtenerDireccionCliente(@Param("Email") String Email );
}
