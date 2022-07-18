package pr.idat.proyectoin.Controller;

import java.time.LocalDate;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.persistence.Converter;

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
import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Entity.Distrito;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.EstadoService;
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
	
	@Autowired
	private DetalleOrdenPedidoService serviceDetOrd;
	
	@Autowired
	private EstadoService serviceEst;
	
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
	
	@PostMapping(path = "/AgregarCli")
	public String InsertCliente(@RequestBody Cliente cliente) {
		
		serviceCli.Insert(cliente);
		
		return "¡Cliente agregado exitosamente...!";
	}
	
	@PostMapping(path = "/AgregarArt")
	public String InsertArticulo(@RequestBody Articulo articulo) {
		
		serviceArt.Insert(articulo);
		
		return "¡Articulo agregado exitosamente...!";
	}
	
	@DeleteMapping(path = "/Delete/Articulo/{ID}")
	public void DeleteArticulo(@PathVariable("ID") Integer ID) {
		
		serviceArt.Delete(ID);
	}
	
	@GetMapping(path = "/Ventas")
	public Collection<OrdenPedido> ListarPedidos() {
		
		return serviceOrd.FindAll();
	}
	
	@GetMapping(path = "/VentasDet")
	public Collection<DetalleOrdenPedido> ListarDetallesPedidos() {
		
		return serviceDetOrd.FindAll();
	}
	
	@PostMapping(path = "/InsertarVenta")
	public void InsertarVenta(@RequestBody HashMap<String, String> map) {
			
		System.out.println("=====================================================");
		System.out.println("cod_Estado: "+map.get("cod_state"));
		System.out.println("cod_cliente: "+map.get("cod_client"));
		System.out.println("fecha: "+map.get("date"));
		System.out.println("cod_pedido: "+map.get("cod_order"));	
		System.out.println("cod_articulo: "+map.get("cod_article"));
		System.out.println("cantidad: "+ map.get("quantity"));
		System.out.println("subtotal: " + map.get("subtotal"));
		System.out.println("=====================================================");
		
	
		OrdenPedido ordenpedido = new OrdenPedido();
	
		ordenpedido.setCliente(serviceCli.FindByID(Integer.parseInt(map.get("cod_client"))));
		ordenpedido.setEstadopedido(serviceEst.FindByID(Integer.parseInt(map.get("cod_state"))));
		ordenpedido.setFecha(LocalDate.parse(map.get("date")));
		
		serviceOrd.Insert(ordenpedido);
		
		int maxCodigo = serviceOrd.maxcodepedidobyid(ordenpedido.getCliente().getCod_Cliente());
		Articulo articulo = serviceArt.FindByID(Integer.parseInt(map.get("cod_article")));

		DetalleOrdenPedido detalleordenpedido = new DetalleOrdenPedido();
		
		detalleordenpedido.setOrdenpedido(serviceOrd.FindByID(maxCodigo));
		detalleordenpedido.setArticulo(articulo);
		detalleordenpedido.setSubtotal(Double.parseDouble(map.get("subtotal")));
		detalleordenpedido.setCantidad(Integer.parseInt(map.get("quantity")));

		serviceDetOrd.Insert(detalleordenpedido);
		
	}
}
