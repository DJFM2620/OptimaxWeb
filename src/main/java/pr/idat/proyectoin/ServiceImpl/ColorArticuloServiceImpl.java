package pr.idat.proyectoin.ServiceImpl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pr.idat.proyectoin.Entity.ColorArticulo;
import pr.idat.proyectoin.Repository.ColorArticuloRepository;
import pr.idat.proyectoin.Service.ColorArticuloService;

@Service
public class ColorArticuloServiceImpl implements ColorArticuloService{

	@Autowired
	ColorArticuloRepository repository;
	
	@Override
	public void Insert(ColorArticulo color) {
		
		repository.save(color);
	}

	@Override
	public void Update(ColorArticulo color) {
		
		repository.save(color);
	}

	@Override
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	public ColorArticulo FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	public Collection<ColorArticulo> FindAll() {
		
		return repository.findAll();
	}
	
	@Override
	public Integer codigoByNombre(String nombre) {
	
		return repository.codigoByNombre(nombre);
	}
}
