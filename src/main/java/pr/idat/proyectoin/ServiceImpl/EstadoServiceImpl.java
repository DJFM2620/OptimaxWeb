package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.EstadoPedido;
import pr.idat.proyectoin.Repository.EstadoRepository;
import pr.idat.proyectoin.Service.EstadoService;


@Service
public class EstadoServiceImpl implements EstadoService {
	
	
	@Autowired
	private EstadoRepository repository;

	@Override
	@Transactional
	public void Insert(EstadoPedido estado) {
		
		repository.save(estado);
	}

	@Override
	@Transactional
	public void Update(EstadoPedido estado) {
		repository.save(estado);
		
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {

		repository.deleteById(ID);
		
	}

	@Override
	@Transactional( readOnly = true)
	public EstadoPedido FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional( readOnly = true)
	public Collection<EstadoPedido> FindAll() {
		
		return repository.findAll();
	}

}
