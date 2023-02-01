package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Repository.CitaRepository;
import pr.idat.proyectoin.Service.CitaService;

@Service
public class CitaServiceImpl implements CitaService {

	@Autowired
	private CitaRepository repository;
	
	@Override
	@Transactional
	public void Insert(Cita cita) {
	
		repository.save(cita);
	}

	@Override
	@Transactional
	public void Update(Cita cita) {
		
		repository.save(cita);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public Cita FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Cita> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Collection<Cita> CitasCliente(Integer DNI) {
		
		return repository.CitasCliente(DNI);
	}

	@Override
	public Collection<Cita> CitasByCodigoCliente(Integer codCliente) {
		
		return repository.CitasByCodigoCliente(codCliente);
	}	
}
