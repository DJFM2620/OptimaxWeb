package pr.idat.proyectoin.ServiceImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service; 

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Repository.ArticuloRepository;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ColorArticuloService;
import pr.idat.proyectoin.Service.MarcaMonturaService;
import pr.idat.proyectoin.Service.TipoMaterialMonturaService;
import pr.idat.proyectoin.Service.TipoModeloMonturaService;

@Service
public class ArticuloServiceImpl implements ArticuloService{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private ArticuloRepository repository;
	
	@Autowired
	private TipoMaterialMonturaService serviceMaterial;
	
	@Autowired
	private TipoModeloMonturaService serviceModelo;
	
	@Autowired
	private MarcaMonturaService serviceMarca;
	
	@Autowired
	private ColorArticuloService serviceColor;
	
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
	public Integer ValidarRelacion(Integer ID) {

		if(repository.CountOrdenesArticulo(ID) == 0) {	
			return 0;
			
		}else {
			return 1;
		}
	}
	
	@Override
	public Articulo FindByID(Integer ID) {
		
		return repository.findById(ID).orElse(null);
	}

	@Override
	public Collection<Articulo> FindAll() {		
		
		return repository.findAll();
	}

	@Override
	public Page<Articulo> FindAllPage(Pageable pageable) {
	
		return repository.findAll(pageable);
	}
	
	@Override
	public Integer CountArticles() {
	
		return repository.CountArticles();
	}
	
	@Override
	public Collection<Articulo> FilterAll(List<String> coloresList, List<String> marcasList,
			List<String> materialList, List<String> modeloList, Double precioMinimo, Double precioMaximo, Integer limite, Integer pagina) {
		
		List<Integer> marcasCods = new ArrayList<>();
		List<Integer> materialCods = new ArrayList<>();
		List<Integer> modeloCods = new ArrayList<>();
		List<Integer> colorCods = new ArrayList<>();
		
		if(coloresList != null) {
			
			for(String nombre : coloresList) {
				
				colorCods.add(serviceColor.codigoByNombre(nombre));
			}
		}
		
		if(marcasList != null) {
			
			for(String nombre : marcasList) {
				
				marcasCods.add(serviceMarca.codigoByNombre(nombre));
			}
		}
		
		if(materialList != null) {
					
			for(String nombre : materialList) {
				
				materialCods.add(serviceMaterial.codigoByNombre(nombre));
			}
		}
		
		if(modeloList != null) {
			
			for(String nombre : modeloList) {
				
				modeloCods.add(serviceModelo.codigoByNombre(nombre));
			}
		}
		return repository.FilterAll(colorCods, marcasCods, materialCods, modeloCods, precioMinimo, precioMaximo, limite,pagina);
	}
	
	@Override
	public List<Map<String, Object>> Better_Selling(String mes) {
		
		return repository.Better_Selling(mes);
	}
	
	@Override
	public Double maxPrecio() {
	
		return repository.maxPrecio();
	}
	
	@Override
	public Double minPrecio() {

		return repository.minPrecio();
	}
	
	@Override
	public Integer CountOrdenesArticulo(Integer codArticulo) {
	
		return repository.CountOrdenesArticulo(codArticulo);
	}
}
