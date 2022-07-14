package pr.idat.proyectoin.Service;


import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Repository.ArticuloRepository;

@Service
public class ArticuloServiceImpl implements ArticuloService{

	
	
	@PersistenceContext
	private EntityManager entityManager;
	
	
	
	@Autowired
	private ArticuloRepository repository;
	
	@Override
	public void Insert(Articulo articulo) {
		
		repository.save(articulo);
	}

	@Override
	public void Update(Articulo articulo) {
		
		repository.save(articulo);
	}

	@Override
	public void Delete(Integer ID) {
		
		repository.deleteById(ID);
	}

	@Override
	public Articulo FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	public Collection<Articulo> FindAll() {
		
		return repository.findAll();
	}


	
}
