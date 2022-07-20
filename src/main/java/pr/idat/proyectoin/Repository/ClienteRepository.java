package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

	@Query(value="select cod_cliente from clientes where email=:clienteemail and dni=:clientedni",nativeQuery=true)
	public abstract Integer validacioncliente(@Param("clienteemail")String email,@Param("clientedni") Integer dni);
	
	@Query(value="select count(*) as 'Clientes' from clientes where  dni =:clienteDNI",nativeQuery=true)
	public abstract Integer ExistenciaCliente(@Param("clienteDNI")Integer DNI );
	
	@Query(value="select cod_cliente from clientes where dni=:clienteDNI",nativeQuery=true)
	public abstract Integer ObtenerCodigoCliente(@Param("clienteDNI")Integer DNI );

	@Query(value="select cod_cliente from clientes where email =:clienteEmail",nativeQuery=true)
	public abstract Integer ObtenerCodigoByEmail(@Param("clienteEmail") String Email );
}
