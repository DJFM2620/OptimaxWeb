package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.ColorArticulo;

public interface ColorArticuloService {

	public abstract void Insert (ColorArticulo color);
	public abstract void Update (ColorArticulo color);
	public abstract void Delete (Integer ID);
	public abstract ColorArticulo FindByID(Integer ID);
	public abstract Collection<ColorArticulo> FindAll();
	
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
}
