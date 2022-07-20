package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Repository.ClienteRepository;

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
	public Integer ObtenerCodigoByEmail(String Email) {
		
			
		return repository.ObtenerCodigoByEmail(Email);
	}

	
}
