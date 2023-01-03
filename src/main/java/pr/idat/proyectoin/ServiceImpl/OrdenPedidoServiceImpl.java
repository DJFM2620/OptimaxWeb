package pr.idat.proyectoin.ServiceImpl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Dto.OrdenPedidoDto;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Repository.OrdenPedidoRepository;
import pr.idat.proyectoin.Service.OrdenPedidoService;

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
	
	@Override
	public List<Object[]> OrdenesPedidosMovil(Integer DNI) {
		
		return repository.OrdenesPedidosMovil(DNI);
	}
	
	@Override
	public Collection<OrdenPedidoDto> ObtenerPedidosPerzonalizado(Integer DNI){
		
		List<Object[]> listOrdenes = (List<Object[]>) this.OrdenesPedidosMovil(DNI);
		List<OrdenPedidoDto> listDto = new ArrayList<>();
		
		for (Object[] orden : listOrdenes) {
			
			OrdenPedidoDto dto = new OrdenPedidoDto();
			
			dto.setCod_pedido((Integer) orden[0]);
			dto.setFecha(orden[1].toString());
			dto.setSubTotal((Double) orden[2]);
			dto.setEstado(orden[3].toString());
			
			listDto.add(dto);
		}
		return listDto;
	}
}
