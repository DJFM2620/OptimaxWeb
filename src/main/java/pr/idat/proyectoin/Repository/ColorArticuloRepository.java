package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.ColorArticulo;

public interface ColorArticuloRepository extends JpaRepository<ColorArticulo, Integer>{

	@Query(value = "SELECT cod_color FROM COLOR_ARTICULO WHERE nombre =:nombre", nativeQuery = true)
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
}
