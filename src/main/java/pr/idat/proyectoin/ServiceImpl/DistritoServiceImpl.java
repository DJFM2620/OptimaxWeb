package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Distrito;
import pr.idat.proyectoin.Repository.DistritoRepository;
import pr.idat.proyectoin.Service.DistritoService;

@Service
public class DistritoServiceImpl implements DistritoService {

	@Autowired
	private DistritoRepository repository;
	
	@Override
	@Transactional
	public void Insert(Distrito distrito) {
		
		repository.save(distrito);
	}

	@Override
	@Transactional
	public void Update(Distrito distrito) {
		
		repository.save(distrito);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
	
		repository.deleteById(ID);
	}

	@Override
	public Integer ValidarRelacion(Integer ID) {

		if(repository.CountDistritoCliente(ID) == 0) {	
			return 0;
			
		}else {
			return 1;
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public Distrito FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Distrito> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Integer CountDistritoCliente(Integer codDistrito) {
		
		return repository.CountDistritoCliente(codDistrito);
	}

}
