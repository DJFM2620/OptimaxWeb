package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Distrito;

public interface DistritoRepository extends JpaRepository<Distrito, Integer> {

	@Query(value = "SELECT count(*) FROM CLIENTES WHERE COD_DISTRITO = :codDistrito ", nativeQuery = true)
	public abstract Integer CountDistritoCliente(@Param("codDistrito") Integer codDistrito);
}
