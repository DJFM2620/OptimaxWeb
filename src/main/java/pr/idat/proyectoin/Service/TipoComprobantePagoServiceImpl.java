package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.TipoComprobantePago;
import pr.idat.proyectoin.Repository.TipoComprobantePagoRepository;

@Service
public class TipoComprobantePagoServiceImpl implements TipoComprobantePagoService{

	@Autowired
	private TipoComprobantePagoRepository repository;
	
	@Override
	@Transactional
	public void Insert(TipoComprobantePago tipoComprobantePago) {
		
		repository.save(tipoComprobantePago);
	}

	@Override
	@Transactional
	public void Update(TipoComprobantePago tipoComprobantePago) {
		
		repository.save(tipoComprobantePago);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public TipoComprobantePago FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<TipoComprobantePago> FindAll() {
		
		return repository.findAll();
	}

}
