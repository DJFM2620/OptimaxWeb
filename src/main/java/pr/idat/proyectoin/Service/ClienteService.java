package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Cliente;

public interface ClienteService{

	public abstract void Insert (Cliente cliente);
	public abstract void Update (Cliente cliente);
	public abstract void Delete (Integer ID);
	public abstract Cliente FindByID(Integer ID);
	public abstract Collection<Cliente> FindAll();
	public abstract Boolean Validar(Integer ID);
	public abstract Integer ValidarRelacion(Integer ID);
	
	public abstract Integer validacioncliente(@Param("clienteemail")String email,@Param("clientedni") Integer dni);
	public abstract Integer ExistenciaCliente(@Param("clienteDNI")Integer DNI );
	public abstract Integer ObtenerCodigoCliente(@Param("clienteDNI")Integer DNI );
	public abstract Cliente ObtenerCodigoByEmail(@Param("clienteEmail") String Email );
	public abstract Integer CountCitasCliente(@Param("codCliente") Integer codCliente );
	public abstract Integer CountOrdenesCliente(@Param("codCliente") Integer codCliente );
	public abstract String ObtenerDireccionCliente(@Param("Email") String Email );
}
