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
	public abstract Boolean Validate(Integer ID);
	
	public abstract Integer validacioncliente(@Param("clienteemail")String email,@Param("clientedni") Integer dni);
	public abstract Integer ExistenciaCliente(@Param("clienteDNI")Integer DNI );
	public abstract Integer ObtenerCodigoCliente(@Param("clienteDNI")Integer DNI );
	public abstract Cliente ObtenerCodigoByEmail(@Param("clienteEmail") String Email );
}
