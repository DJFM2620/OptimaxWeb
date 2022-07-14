package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.TipoModeloMontura;
import pr.idat.proyectoin.Repository.TipoModeloMonturaRepository;

@Service
public class TipoModeloMonturaServiceImpl implements TipoModeloMonturaService {

	@Autowired
	private TipoModeloMonturaRepository repository;
	
	@Override
	@Transactional
	public void Insert(TipoModeloMontura tipoModeloMontura) {
		
		repository.save(tipoModeloMontura);
	}

	@Override
	@Transactional
	public void Update(TipoModeloMontura tipoMondeloMontura) {
		
		repository.save(tipoMondeloMontura);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public TipoModeloMontura FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<TipoModeloMontura> FindAll() {
		
		return repository.findAll();
	}

}
