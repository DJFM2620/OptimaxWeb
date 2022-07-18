package pr.idat.proyectoin.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Repository.OrdenPedidoRepository;

@Service
public class OrdenPedidoServiceImpl implements OrdenPedidoService {

	@Autowired
	private OrdenPedidoRepository repository;
	
	@Override
	@Transactional
	public void Insert(OrdenPedido ordenPedido) {
		
		repository.save(ordenPedido);
	}

	@Override
	@Transactional
	public void Update(OrdenPedido ordenPedido) {
		
		repository.save(ordenPedido);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	@Transactional(readOnly = true)
	public OrdenPedido FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<OrdenPedido> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Integer CodigoOrdenPedido() {
		
		if(repository.CodigoOrdenPedido() == null) {
			
			return 0;
		}
		
		return repository.CodigoOrdenPedido();
	}

	@Override
	public Collection<OrdenPedido> PedidosCliente(Integer DNI) {
		
		return repository.PedidosCliente(DNI);
	}

	@Override
	public Integer maxcodepedidobyid(Integer id) {
	
		return repository.maxcodepedidobyid(id);
	}
}
