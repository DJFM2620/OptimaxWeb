package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.TipoMaterialMontura;

public interface TipoMaterialMonturaService {

	public abstract void Insert (TipoMaterialMontura tipoMaterialMontura);
	public abstract void Update (TipoMaterialMontura tipoMaterialMontura);
	public abstract void Delete (Integer ID);
	public abstract  TipoMaterialMontura FindByID(Integer ID);
	public abstract Collection<TipoMaterialMontura> FindAll();
}
