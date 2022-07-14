package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.Distrito;
import pr.idat.proyectoin.Repository.DistritoRepository;

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
	@Transactional(readOnly = true)
	public Distrito FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Distrito> FindAll() {
		
		return repository.findAll();
	}

}
