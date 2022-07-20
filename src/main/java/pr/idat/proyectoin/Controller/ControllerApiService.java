package pr.idat.proyectoin.Controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

	private static final List<DetalleOrdenPedido> carritoDetalleOrdenPedido = new ArrayList<>();
	private static final List<Integer> CodigosArticulo = new ArrayList<Integer>();
	private static final List<Articulo> ArticulosCarrito = new ArrayList<Articulo>();
	private static final List<Integer> CantidadArticulos = new ArrayList<Integer>();

	@GetMapping
	public Collection<Articulo> FindAll() {

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

	@GetMapping(path = "/Cliente/{Email}")
	public Integer CodigoClienteByEmail(@PathVariable("Email") String Email) {

		return serviceCli.ObtenerCodigoByEmail(Email);
	}

	@PostMapping(path = "/InsertarVenta")
	public void InsertarVenta(@RequestBody HashMap<String, String> map) {

		System.out.println("=====================================================");
		System.out.println("cod_Estado: " + map.get("cod_state"));
		System.out.println("cod_cliente: " + map.get("cod_client"));
		System.out.println("cod_pedido: " + map.get("cod_order"));
		System.out.println("cod_articulo: " + map.get("cod_article"));
		System.out.println("cantidad: " + map.get("quantity"));
		System.out.println("subtotal: " + map.get("subtotal"));
		System.out.println("=====================================================");

		LocalDate date = LocalDate.now();
		System.out.println("fecha: " + date);
		
		OrdenPedido ordenpedido = new OrdenPedido();

		ordenpedido.setCliente(serviceCli.FindByID(Integer.parseInt(map.get("cod_client"))));
		ordenpedido.setEstadopedido(serviceEst.FindByID(Integer.parseInt(map.get("cod_state"))));
		ordenpedido.setFecha(date);

		serviceOrd.Insert(ordenpedido);

		int maxCodigo = serviceOrd.maxcodepedidobyid(ordenpedido.getCliente().getCod_Cliente());

		
		/* Este Matcher sirve para poder enviar los datos del Map al List y asi obtener su Tamaño de Lista*/
		Matcher encuentrador = Pattern.compile("\\d+").matcher(map.get("cod_article"));

		while (encuentrador.find()) {

			CodigosArticulo.add(Integer.parseInt(encuentrador.group()));
		}
		
		CantidadArticulos.add(Integer.parseInt(map.get("quantity")));
		
		/* Se debe hacer un for para insertar cada articulo al DETALLE */
		for (int i = 0; i < CodigosArticulo.size(); i++) {

			Articulo articulo = serviceArt.FindByID(CodigosArticulo.get(i));

			ArticulosCarrito.add(articulo);

			DetalleOrdenPedido Detalle = new DetalleOrdenPedido();

			Detalle.setOrdenpedido(serviceOrd.FindByID(maxCodigo));
			
			Detalle.setArticulo(articulo);
			System.out.println(articulo.getCodArticulo());
			
			Detalle.setCantidad(CantidadArticulos.get(i));
			
			Detalle.setSubtotal(CantidadArticulos.get(i) * ArticulosCarrito.get(i).getPrecio());
			
			carritoDetalleOrdenPedido.add(Detalle);
		}
		for (DetalleOrdenPedido DetalleOrdenPedido : carritoDetalleOrdenPedido) {

			serviceDetOrd.Insert(DetalleOrdenPedido); /*
													 * Aca debe ir todos los articulos comprados por el cliente, por
													 * logica siempre sera el ultimo codigo de pedido y el ultimo
													 * cliente creado, si existe se buscara mediante su DNI al Cliente
													 */
		}

		/*Articulo articulo = serviceArt.FindByID(Integer.parseInt(map.get("cod_article")));

		DetalleOrdenPedido detalleordenpedido = new DetalleOrdenPedido();

		detalleordenpedido.setOrdenpedido(serviceOrd.FindByID(maxCodigo));
		detalleordenpedido.setArticulo(articulo);
		detalleordenpedido.setSubtotal(Double.parseDouble(map.get("subtotal")));
		detalleordenpedido.setCantidad(Integer.parseInt(map.get("quantity")));

		serviceDetOrd.Insert(detalleordenpedido);*/
	}

	@PostMapping(path = "/Recepcion")
	public void Recepcion(@RequestBody HashMap<String, String> map) {

		System.out.println("=====================================================");
		System.out.println("cod_article: " + map.get("cod_article"));
		System.out.println("=====================================================");

		Matcher encuentrador = Pattern.compile("\\d+").matcher(map.get("cod_article"));

		while (encuentrador.find()) {

			CodigosArticulo.add(Integer.parseInt(encuentrador.group()));
		}

		for (int i = 0; i < CodigosArticulo.size(); i++) {

		}

		/*System.out.println("=====================================================");
		System.out.println("cod_article: " + CodigosArticulo);
		System.out.println("=====================================================");*/
	}
}
