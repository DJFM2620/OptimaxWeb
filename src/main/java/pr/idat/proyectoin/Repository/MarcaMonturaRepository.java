package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.MarcaMontura;

public interface MarcaMonturaRepository extends JpaRepository<MarcaMontura, Integer>{

	@Query(value = "SELECT cod_marca FROM MARCA_MONTURA WHERE nombre_marca =:nombre", nativeQuery = true)
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
	
	@Query(value = "SELECT count(*) FROM ARTICULOS WHERE COD_MARCA = :codMarca ", nativeQuery = true)
	public abstract Integer CountMarcaArticulos(@Param("codMarca") Integer codMarca);
}
