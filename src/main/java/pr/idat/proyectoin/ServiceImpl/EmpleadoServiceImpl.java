package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Empleado;
import pr.idat.proyectoin.Repository.EmpleadoRepository;
import pr.idat.proyectoin.Service.EmpleadoService;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {

	@Autowired
	private EmpleadoRepository repository;
	
	@Override
	@Transactional
	public void Insert(Empleado empleado) {
		
		repository.save(empleado);
	}

	@Override
	@Transactional
	public void Update(Empleado empleado) {
		
		repository.save(empleado);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
	
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public Empleado FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Empleado> FindAll() {
		
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Integer validaciondatoslogin(String email, Integer dni) {
		
		
		if(repository.validaciondatoslogin(email,dni) != null) 
		{
			return 1;
		}
		
		return 0;
	}

	@Override
	@Transactional(readOnly = true)
	public Integer validarcargo(String email, Integer dni) {
		
		if(repository.validarcargo(email,dni) != null && repository.validarcargo(email, dni) ==3) //administrador
		{
			return 3;
		}
		if(repository.validarcargo(email,dni) != null && repository.validarcargo(email, dni) ==1) //Oftalmologo
		{
			return 1;
		}
		if(repository.validarcargo(email,dni) != null && repository.validarcargo(email, dni) ==4) //recepcionista
		{
			return 4;
		}
		if(repository.validarcargo(email,dni) != null && repository.validarcargo(email, dni) ==2) //Jefe de ventas
		{
			return 2;
		}
		
		
		return 0;	
	}

	@Override
	public Collection<Empleado> buscardoctores() {
		
		
		return repository.buscardoctores();
	}

	

	

}
