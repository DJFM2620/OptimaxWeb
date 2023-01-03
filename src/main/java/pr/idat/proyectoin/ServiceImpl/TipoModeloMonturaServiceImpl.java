package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.TipoModeloMontura;
import pr.idat.proyectoin.Repository.TipoModeloMonturaRepository;
import pr.idat.proyectoin.Service.TipoModeloMonturaService;

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

	@Override
	public Integer codigoByNombre(String nombre) {
	
		return repository.codigoByNombre(nombre);
	}
}
