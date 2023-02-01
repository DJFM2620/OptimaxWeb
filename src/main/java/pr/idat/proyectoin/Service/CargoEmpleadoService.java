package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.CargoEmpleado;

public interface CargoEmpleadoService {

	public abstract void Insert (CargoEmpleado cargoEmpleado);
	public abstract void Update (CargoEmpleado cargoEmpleado);
	public abstract void Delete (Integer ID);
	public abstract CargoEmpleado  FindByID(Integer ID);
	public abstract Collection<CargoEmpleado> FindAll();
	
	public abstract Integer ValidarRelacion(Integer ID);
	public abstract Integer CountCargoEmpleado(@Param("codCargo") Integer codCargo);
}
