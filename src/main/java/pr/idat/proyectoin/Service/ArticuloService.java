package pr.idat.proyectoin.Service;


import java.util.Collection;

import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloService{
	
	public abstract void Insert (Articulo articulo);
	public abstract void Update (Articulo articulo);
	public abstract void Delete (Integer ID);
	public abstract Articulo FindByID(Integer ID);
	public abstract Collection<Articulo> FindAll();
	
}
