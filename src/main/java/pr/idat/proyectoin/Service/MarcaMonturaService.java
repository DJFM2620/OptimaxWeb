package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.MarcaMontura;

public interface MarcaMonturaService {

	public abstract void Insert (MarcaMontura marcaMontura);
	public abstract void Update (MarcaMontura marcaMontura);
	public abstract void Delete (Integer ID);
	public abstract MarcaMontura FindByID(Integer ID);
	public abstract Collection<MarcaMontura> FindAll();
}
