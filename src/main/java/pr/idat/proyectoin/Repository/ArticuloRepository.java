package pr.idat.proyectoin.Repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloRepository extends JpaRepository<Articulo, Integer>, JpaSpecificationExecutor<Articulo> {
	
	@Query(value = "SELECT * FROM ARTICULOS WHERE"
			+ "( cod_color IN (:colores) IS NULL OR cod_color IN (:colores) ) AND"
			+ "( cod_tip_material IN (:materiales) IS NULL OR cod_tip_material IN (:materiales) ) AND"
			+ "( cod_marca IN (:marcas) IS NULL OR cod_marca IN (:marcas) ) AND"
			+ "( cod_modelo IN (:modelos) IS NULL OR cod_modelo IN (:modelos) ) AND"
			+ "( precio >= :minimo AND precio <= :maximo ) LIMIT 12 OFFSET :pagina ;", nativeQuery = true)
	public abstract Collection<Articulo> FilterAll(@Param("colores") List<Integer> coloresList,
			@Param("marcas") List<Integer> marcasList,
			@Param("materiales") List<Integer> materialList,
			@Param("modelos") List<Integer> modeloList,
			@Param("minimo") Double precioMinimo,
			@Param("maximo") Double precioMaximo,
			@Param("pagina") Integer pagina);
	
	@Query(value = "SELECT MIN(precio) FROM ARTICULOS;", nativeQuery = true)
	public abstract Double minPrecio();
	
	@Query(value = "SELECT MAX(precio) FROM ARTICULOS;", nativeQuery = true)
	public abstract Double maxPrecio();
	
	@Query(value = "SELECT COUNT(*) FROM ARTICULOS;", nativeQuery = true)
	public abstract Integer CountArticles();
}
