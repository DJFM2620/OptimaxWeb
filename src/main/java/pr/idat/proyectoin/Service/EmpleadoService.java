package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Empleado;

public interface EmpleadoService{

	public abstract void Insert (Empleado empleado);
	public abstract void Update (Empleado empleado);
	public abstract void Delete (Integer ID);
	public abstract Empleado FindByID(Integer ID);
	public abstract Collection<Empleado> FindAll();
	
	public abstract Integer validaciondatoslogin(@Param("empleadoemail")String email,@Param("empleadodni") Integer dni);
	public abstract Integer validarcargo(@Param("empleadoemail")String email,@Param("empleadodni") Integer dni);
	public abstract Collection<Empleado> buscardoctores();
	public abstract Integer ValidarRelacion(Integer ID);
	public abstract Integer CountComprobanteEmpleado(@Param("codEmpleado") Integer codEmpleado);
}
