package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.TipoModeloMontura;

public interface TipoModeloMonturaRepository extends JpaRepository<TipoModeloMontura, Integer>{

	@Query(value = "SELECT cod_modelo FROM TIPO_MODELO_MONTURA WHERE forma_modelo = :nombre", nativeQuery = true)
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
}
