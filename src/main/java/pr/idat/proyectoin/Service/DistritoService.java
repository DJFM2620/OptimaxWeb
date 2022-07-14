package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.Distrito;

public interface DistritoService{

	public abstract void Insert (Distrito distrito);
	public abstract void Update (Distrito distrito);
	public abstract void Delete (Integer ID);
	public abstract Distrito FindByID(Integer ID);
	public abstract Collection<Distrito> FindAll();
}
