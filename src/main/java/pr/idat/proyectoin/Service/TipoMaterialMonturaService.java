package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.TipoMaterialMontura;

public interface TipoMaterialMonturaService {

	public abstract void Insert (TipoMaterialMontura tipoMaterialMontura);
	public abstract void Update (TipoMaterialMontura tipoMaterialMontura);
	public abstract void Delete (Integer ID);
	public abstract  TipoMaterialMontura FindByID(Integer ID);
	public abstract Collection<TipoMaterialMontura> FindAll();
	
	public abstract Integer codigoByNombre(@Param("nombre") String nombre);
	public abstract Integer ValidarRelacion(Integer ID);
	public abstract Integer CountModeloArticulo(@Param("codMaterial") Integer codMaterial);
}
