package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pr.idat.proyectoin.Entity.MarcaMontura;
import pr.idat.proyectoin.Repository.MarcaMonturaRepository;
import pr.idat.proyectoin.Service.MarcaMonturaService;

@Service
public class MarcaMonturaServiceImpl implements MarcaMonturaService{

	@Autowired
	private MarcaMonturaRepository repository;
	
	@Override
	@Transactional
	public void Insert(MarcaMontura marcaMontura) {
		
		repository.save(marcaMontura);
	}

	@Override
	@Transactional
	public void Update(MarcaMontura marcaMontura) {
		
		repository.save(marcaMontura);
	}

	@Override
	@Transactional
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}
	
	@Override
	public Integer ValidarRelacion(Integer ID) {

		if(repository.CountMarcaArticulos(ID) == 0) {	
			return 0;
			
		}else {
			return 1;
		}
	}

	@Override
	@Transactional(readOnly = true)
	public MarcaMontura FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<MarcaMontura> FindAll() {
		
		return repository.findAll();
	}

	@Override
	public Integer codigoByNombre(String nombre) {
	
		return repository.codigoByNombre(nombre);
	}

	@Override
	public Integer CountMarcaArticulos(Integer codMarca) {
		
		return repository.CountMarcaArticulos(codMarca);
	}
}
