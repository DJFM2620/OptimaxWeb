package pr.idat.proyectoin.Repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Cita;

public interface CitaRepository extends JpaRepository<Cita, Integer>{

	@Query(value = "select cod_cita,hora,fecha,citas.cod_cliente from citas inner join clientes on citas.cod_cliente=clientes.cod_cliente where clientes.dni=:clienteDNI", nativeQuery=true)
	public abstract Collection<Cita> CitasCliente(@Param("clienteDNI")Integer DNI);
	
	@Query(value = "select * from citas where cod_cliente=:codCliente", nativeQuery=true)
	public abstract Collection<Cita> CitasByCodigoCliente(@Param("codCliente")Integer codCliente);
}

