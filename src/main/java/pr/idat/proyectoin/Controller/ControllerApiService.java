package pr.idat.proyectoin.Controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonIgnore;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Entity.Distrito;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.OrdenPedidoService;

@RestController
@RequestMapping("/Api")
public class ControllerApiService {

	@Autowired
	private ArticuloService serviceArt;
	
	@Autowired
	private ClienteService serviceCli;
	
	@Autowired
	private DistritoService serviceDis;
	
	@Autowired
	private OrdenPedidoService serviceOrd;
	
	@GetMapping
	public Collection<Articulo> FindAll(){
		
		return serviceArt.FindAll();
	}
	
	@GetMapping(path = "/{ID}")
	public Articulo FindByID(@PathVariable("ID") Integer ID) {
		
		Articulo articulo = serviceArt.FindByID(ID);
		
		return articulo;
	}
	
	@GetMapping(path = "/Distrito/{ID}")
	public Distrito FindDistritoByID(@PathVariable("ID") Integer ID) {	
		
		Distrito distrito = serviceDis.FindByID(ID);
		
		return distrito;
	}
	
	@GetMapping(path = "/Clientes")	
	public Collection<Cliente> FindAllClientes() {
		
		return serviceCli.FindAll();
	}
	
	@PostMapping(path = "/Agregar")
	public void InsertCliente(@RequestBody Cliente cliente) {
		
		System.out.println("=====================================================");
		System.out.println("DATOS DEL CLIENTE");
		System.out.println(cliente.getCod_Cliente());
		System.out.println(cliente.getNombres());
		System.out.println(cliente.getApellidop());
		System.out.println(cliente.getApellidom());
		System.out.println(cliente.getDni());
		System.out.println(cliente.getCelular());
		System.out.println(cliente.getEmail());
		System.out.println(cliente.getRuc());
		System.out.println("=====================================================");
		System.out.println("DATOS DEL DISTRITO");
		System.out.println(cliente.getDistrito().getCod_distrito());
		System.out.println(cliente.getDistrito().getNombredistr());
		
		serviceCli.Insert(cliente);
	}
	
	@DeleteMapping(path = "/Delete/Articulo/{ID}")
	public void DeleteArticulo(@PathVariable("ID") Integer ID) {
		
		serviceArt.Delete(ID);
	}
	
	@GetMapping(path = "/Ventas")
	public Collection<OrdenPedido> ListarPedidos() {
		
		return serviceOrd.FindAll();
	}
}
