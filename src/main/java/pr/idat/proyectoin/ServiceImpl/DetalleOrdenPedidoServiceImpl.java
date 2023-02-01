package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Repository.DetalleOrdenPedidoRepository;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;

@Service
public class DetalleOrdenPedidoServiceImpl implements DetalleOrdenPedidoService{

	@Autowired
	private DetalleOrdenPedidoRepository repository;
	
	@Override
	@Transactional
	public void Insert(DetalleOrdenPedido detalleOrdenPedido) {
		
		repository.save(detalleOrdenPedido);
	}

	@Override
	@Transactional
	public void Update(DetalleOrdenPedido detalleOrdenPedido) {
		
		repository.save(detalleOrdenPedido);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
	
		repository.deleteById(ID);	
	}

	@Override
	@Transactional( readOnly = true)
	public DetalleOrdenPedido FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional( readOnly = true)
	public Collection<DetalleOrdenPedido> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Collection<DetalleOrdenPedido> DetallePedido(Integer codigo) {
		
		return repository.DetallePedido(codigo);
	}

	@Override
	public Integer calculosubtotal(Integer codigo) {
		
		return repository.calculosubtotal(codigo);
	}
}
