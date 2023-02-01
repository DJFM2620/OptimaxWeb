package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.TipoMaterialMontura;

public interface TipoMaterialMonturaRepository extends JpaRepository<TipoMaterialMontura, Integer> {

	@Query(value = "SELECT cod_tip_material FROM TIPO_MATERIAL_MONTURA WHERE nombre_materia =:nombre", nativeQuery = true)
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
	
	@Query(value = "SELECT count(*) FROM ARTICULOS WHERE COD_TIP_MATERIAL = :codMaterial ", nativeQuery = true)
	public abstract Integer CountModeloArticulo(@Param("codMaterial") Integer codMaterial);
}
