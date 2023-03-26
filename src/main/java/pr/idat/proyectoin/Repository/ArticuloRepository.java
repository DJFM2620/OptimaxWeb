package pr.idat.proyectoin.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloRepository extends JpaRepository<Articulo, Integer>, JpaSpecificationExecutor<Articulo> {
	
	// COD_COLOR IN (1, 2) | Sirve para seleccionar los articulos que este relaciondos con esos colores
	
	// COD_COLOR IN (:colores) IS NULL ---> Validar que si es nulo o no, si es nulo no pasa nada, simplemente no existen 
/*
	cod_color IN (:colores) ---> Busca los articulos que tengan los colores(En este caso se busca mediante codigo) que estan dentro del parentesis
*/
	
	// LIMIT SELECCIONAR COMO MAXIMO N FILAS
	// OFFSET INDICA QUE SE DEBE SALTAR LAS PRIMERAS N FILAS
	
	@Query(value = "SELECT * FROM ARTICULOS WHERE"
			+ "( cod_color IN (:colores) IS NULL OR cod_color IN (:colores) ) AND"
			+ "( cod_tip_material IN (:materiales) IS NULL OR cod_tip_material IN (:materiales) ) AND"
			+ "( cod_marca IN (:marcas) IS NULL OR cod_marca IN (:marcas) ) AND"
			+ "( cod_modelo IN (:modelos) IS NULL OR cod_modelo IN (:modelos) ) AND"
			+ "( precio >= :minimo AND precio <= :maximo ) LIMIT :limite OFFSET :pagina ;", nativeQuery = true)
	public abstract Collection<Articulo> FilterAll(@Param("colores") List<Integer> coloresList,
			@Param("marcas") List<Integer> marcasList,
			@Param("materiales") List<Integer> materialList,
			@Param("modelos") List<Integer> modeloList,
			@Param("minimo") Double precioMinimo,
			@Param("maximo") Double precioMaximo,
			@Param("limite") Integer limite,
			@Param("pagina") Integer pagina);
	
	@Query(value = "SELECT COD_ARTICULO, SUM(CANTIDAD) FROM DETALLE_ORDEN_PEDIDO JOIN ORDENPEDIDOS"
			+ " ON ORDENPEDIDOS.COD_PEDIDO = DETALLE_ORDEN_PEDIDO.COD_PEDIDO "
			+ " WHERE MONTH(FECHA) = :mes "
			+ " GROUP BY COD_ARTICULO LIMIT 5;", nativeQuery = true)
	public abstract List<Map<String, Object>> Better_Selling(@Param("mes") String mes);
	
	@Query(value = "SELECT MIN(precio) FROM ARTICULOS;", nativeQuery = true)
	public abstract Double minPrecio();
	
	@Query(value = "SELECT MAX(precio) FROM ARTICULOS;", nativeQuery = true)
	public abstract Double maxPrecio();
	
	@Query(value = "SELECT COUNT(*) FROM ARTICULOS;", nativeQuery = true)
	public abstract Integer CountArticles();
	
	@Query(value = "SELECT count(*) FROM DETALLE_ORDEN_PEDIDO WHERE COD_ARTICULO =:codArticulo ", nativeQuery = true)
	public abstract Integer CountOrdenesArticulo(@Param("codArticulo") Integer codArticulo);
}
