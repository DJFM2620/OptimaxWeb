package pr.idat.proyectoin.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloService{
	
	public abstract void Insert (Articulo articulo);
	public abstract void Update (Articulo articulo);
	public abstract void Delete (Integer ID);
	public abstract Articulo FindByID(Integer ID);
	public abstract Collection<Articulo> FindAll();
	
	public abstract Page<Articulo> FindAllPage(Pageable pageable);
	public abstract Integer CountArticles();
	
	public abstract Collection<Articulo> FilterAll(@Param("colores") List<String> coloresList,
			@Param("marcas") List<String> marcasList,
			@Param("materiales") List<String> materialList,
			@Param("modelos") List<String> modeloList,
			@Param("minimo") Double precioMinimo,
			@Param("maximo") Double precioMaximo,
			@Param("pagina") Integer pagina);
	
	public abstract List<Map<String, Object>> Better_Selling(@Param("mes") String mes);
	public abstract Double minPrecio();
	public abstract Double maxPrecio();
	public abstract Integer ValidarRelacion(Integer ID);
	public abstract Integer CountOrdenesArticulo(@Param("codArticulo") Integer codArticulo);
}
