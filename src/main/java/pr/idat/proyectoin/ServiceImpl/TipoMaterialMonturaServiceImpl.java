package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.TipoMaterialMontura;
import pr.idat.proyectoin.Repository.TipoMaterialMonturaRepository;
import pr.idat.proyectoin.Service.TipoMaterialMonturaService;

@Service
public class TipoMaterialMonturaServiceImpl implements TipoMaterialMonturaService{

	@Autowired
	private TipoMaterialMonturaRepository repository;
	
	@Override
	@Transactional
	public void Insert(TipoMaterialMontura tipoMaterialMontura) {
		
		repository.save(tipoMaterialMontura);
	}

	@Override
	@Transactional
	public void Update(TipoMaterialMontura tipoMaterialMontura) {
		
		repository.save(tipoMaterialMontura);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	public Integer ValidarRelacion(Integer ID) {

		if(repository.CountModeloArticulo(ID) == 0) {	
			return 0;
			
		}else {
			return 1;
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public TipoMaterialMontura FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<TipoMaterialMontura> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Integer codigoByNombre(String nombre) {
	
		return repository.codigoByNombre(nombre);
	}
	
	@Override
	public Integer CountModeloArticulo(Integer codMaterial) {
		
		return repository.CountModeloArticulo(codMaterial);
	}
}
