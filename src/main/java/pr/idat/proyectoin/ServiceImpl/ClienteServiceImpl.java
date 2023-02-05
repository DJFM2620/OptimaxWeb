package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Repository.ClienteRepository;
import pr.idat.proyectoin.Service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService{

	@Autowired
	private ClienteRepository repository;
	
	@Override
	@Transactional
	public void Insert(Cliente cliente) {
		
		repository.save(cliente);
	}

	@Override
	@Transactional
	public void Update(Cliente cliente) {
	
		repository.save(cliente);	
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	public Integer ValidarRelacion(Integer ID) {

		if((repository.CountOrdenesCliente(ID) == 0) && (repository.CountCitasCliente(ID) == 0)) {	
			return 0;
			
		}else {
			return 1;
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public Cliente FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Cliente> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Boolean Validar(Integer ID) {

		Optional<Cliente> celda = repository.findById(ID);

		if (celda.isPresent()) {

			return true;

		} else {

			return false;
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public Integer validacioncliente(String email, Integer dni) {
		
		
		if(repository.validacioncliente(email,dni) != null )
		{
			return 1;
		}
		
		return 0;
	}

	@Override
	public Integer ExistenciaCliente(Integer DNI) {
		
		if(repository.ExistenciaCliente(DNI) == 1 )
		{
			return 1;
		}
		
		return 0;
	}

	@Override
	public Integer ObtenerCodigoCliente(Integer DNI) {
		
		return repository.ObtenerCodigoCliente(DNI);
	}

	@Override
	public Cliente ObtenerCodigoByEmail(String Email) {
		
			
		return repository.ObtenerCodigoByEmail(Email);
	}

	@Override
	public Integer CountCitasCliente(Integer codCliente) {
		
		return repository.CountCitasCliente(codCliente);
	}

	@Override
	public Integer CountOrdenesCliente(Integer codCliente) {
		
		return repository.CountOrdenesCliente(codCliente);
	}

	@Override
	public String ObtenerDireccionCliente(String Email) {

		String result = "";
		
		String direccion = repository.ObtenerDireccionCliente(Email); 
		
		if(direccion == null) {
			
			result = null;
			System.out.println("IS NULL: " +  result);
			
		}else if(direccion.isEmpty()) {
			
			result = null;
			System.out.println("IS EMPTY: " +  result);
			
		}else {
			
			result = direccion;
			System.out.println("IT'S OK: " +  result);
		}
		
		System.out.println("RESULT: " +  result);
		
		return result;
	}
}
