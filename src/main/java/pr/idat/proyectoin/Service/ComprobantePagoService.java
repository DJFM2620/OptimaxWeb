package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.ComprobantePago;

public interface ComprobantePagoService{

	public abstract void Insert (ComprobantePago comprobantePago);
	public abstract void Update (ComprobantePago comprobantePago);
	public abstract void Delete (Integer ID);
	public abstract ComprobantePago FindByID(Integer ID);
	public abstract Collection<ComprobantePago> FindAll();
}
