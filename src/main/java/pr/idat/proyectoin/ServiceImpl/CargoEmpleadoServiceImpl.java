package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.CargoEmpleado;
import pr.idat.proyectoin.Repository.CargoEmpleadoRepository;
import pr.idat.proyectoin.Service.CargoEmpleadoService;

@Service
public class CargoEmpleadoServiceImpl implements CargoEmpleadoService{

	@Autowired
	private CargoEmpleadoRepository repository;

	@Override
	@Transactional
	public void Insert(CargoEmpleado cargoempleado) {
		
		repository.save(cargoempleado);
	}

	@Override
	@Transactional
	public void Update(CargoEmpleado cargoempleado) {
		
		repository.save(cargoempleado);
	}

	@Override
	@Transactional(readOnly = true)
	public CargoEmpleado FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<CargoEmpleado> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public void Delete(Integer ID ) {
		
		repository.deleteById(ID);
	}
	
	@Override
	public Integer ValidarRelacion(Integer ID) {

		if(repository.CountCargoEmpleado(ID) == 0) {	
			return 0;
			
		}else {
			return 1;
		}
	}

	@Override
	public Integer CountCargoEmpleado(Integer codCargo) {
		
		return repository.CountCargoEmpleado(codCargo);
	}
}
