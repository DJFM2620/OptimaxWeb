package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.ComprobantePago;
import pr.idat.proyectoin.Repository.ComprobantePagoRepository;

@Service
public class ComprobantePagoServiceImpl implements ComprobantePagoService{

	@Autowired
	private ComprobantePagoRepository repository;
	
	@Override
	@Transactional
	public void Insert(ComprobantePago comprobantePago) {
		
		repository.save(comprobantePago);
	}

	@Override
	@Transactional
	public void Update(ComprobantePago comprobantePago) {
		
		repository.save(comprobantePago);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
	
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public ComprobantePago FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<ComprobantePago> FindAll() {
		
		return repository.findAll();
	}

	
}
