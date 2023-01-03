package pr.idat.proyectoin.Service;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloService{
	
	public abstract void Insert (Articulo articulo);
	public abstract void Update (Articulo articulo);
	public abstract void Delete (Integer ID);
	public abstract Articulo FindByID(Integer ID);
	public abstract Collection<Articulo> FindAll();
	
	public abstract Collection<Articulo> FilterAll(@Param("colores") List<String> coloresList,
			@Param("marcas") List<String> marcasList,
			@Param("materiales") List<String> materialList,
			@Param("modelos") List<String> modeloList,
			@Param("minimo") Double precioMinimo,
			@Param("maximo") Double precioMaximo);
	
	public abstract Double minPrecio();
	public abstract Double maxPrecio();
}
