package pr.idat.proyectoin.Service;

import java.util.Collection;

import pr.idat.proyectoin.Entity.TipoComprobantePago;

public interface TipoComprobantePagoService {

	public abstract void Insert (TipoComprobantePago tipoComprobantePago);
	public abstract void Update (TipoComprobantePago tipoComprobantePago);
	public abstract void Delete (Integer ID);
	public abstract  TipoComprobantePago FindByID(Integer ID);
	public abstract Collection<TipoComprobantePago> FindAll();
}
