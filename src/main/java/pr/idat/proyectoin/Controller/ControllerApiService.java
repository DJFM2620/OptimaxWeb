package pr.idat.proyectoin.Controller;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import pr.idat.proyectoin.Dto.OrdenPedidoDto;
import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Entity.Distrito;
import pr.idat.proyectoin.Entity.MarcaMontura;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.CitaService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.EstadoService;
import pr.idat.proyectoin.Service.MarcaMonturaService;
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

	@Autowired
	private CitaService serviceCita;

	@Autowired
	MarcaMonturaService serviceMarca;
	
	private static final List<DetalleOrdenPedido> carritoDetalleOrdenPedido = new ArrayList<>();
	private static final List<Integer> CodigosArticulo = new ArrayList<Integer>();
	private static final List<Articulo> ArticulosCarrito = new ArrayList<Articulo>();
	private static final List<Integer> CantidadArticulos = new ArrayList<Integer>();

	OkHttpClient client = new OkHttpClient.Builder().connectTimeout(180, TimeUnit.SECONDS)
			.readTimeout(180, TimeUnit.SECONDS).build();

	public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

	@GetMapping
	public Collection<Articulo> FindAll() {

		return serviceArt.FindAll();
	}
	
	@GetMapping(path = "/Pageable")
	public Page<Articulo> FindAllPageable() {
		
		Pageable first = PageRequest.of(1, 4);
		
		return serviceArt.FindAllPage(first);
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

	@GetMapping(path = "/Cliente/ID/{ID}")
	public Cliente FindCliente(@PathVariable("ID") Integer ID) {

		return serviceCli.FindByID(ID);
	}
	
	@PostMapping(path = "/Cliente/Agregar")
	public void InsertCliente(@RequestBody Cliente cliente) {

		System.out.println("===============================");
		System.out.println("CLIENTE");
		System.out.println("ID: " + cliente.getCod_Cliente());
		System.out.println("NAME: " + cliente.getNombres());
		System.out.println("APELLIDO P: " + cliente.getApellidop());
		System.out.println("APELLIDO M: " + cliente.getApellidom());
		System.out.println("EMAIL: " + cliente.getEmail());
		System.out.println("DIRECCION: " + cliente.getDireccion());
		System.out.println("RUC: " + cliente.getRuc());
		System.out.println("DISTRITO: " + cliente.getDistrito().getCod_distrito());

		serviceCli.Insert(cliente);

		// return "¡Cliente agregado exitosamente...!";
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
	public Cliente CodigoClienteByEmail(@PathVariable("Email") String Email) {

		return serviceCli.ObtenerCodigoByEmail(Email);
	}

	@PostMapping(path = "/InsertarVenta")
	public void InsertarVenta(@RequestBody HashMap<String, String> map) {

		System.out.println("=====================================================");
		System.out.println("cod_Estado: " + map.get("cod_state"));
		System.out.println("email: " + map.get("email_client"));
		System.out.println("codigos de articulos: " + map.get("articles"));
		System.out.println("cantidades: " + map.get("quantities"));
		System.out.println("subtotal: " + map.get("subtotal"));
		System.out.println("=====================================================");

		LocalDate date = LocalDate.now();
		System.out.println("fecha: " + date);

		OrdenPedido ordenpedido = new OrdenPedido();

		ordenpedido.setCliente(serviceCli.ObtenerCodigoByEmail(map.get("email_client")));
		ordenpedido.setEstadopedido(serviceEst.FindByID(Integer.parseInt(map.get("cod_state"))));
		ordenpedido.setFecha(date);

		serviceOrd.Insert(ordenpedido);

		int maxCodigo = serviceOrd.maxcodepedidobyid(ordenpedido.getCliente().getCod_Cliente());

		/*
		 * Este Matcher sirve para poder enviar los datos del Map al List y asi obtener
		 * su Tamaño de Lista
		 */
		Matcher encuentradorArticulos = Pattern.compile("\\d+").matcher(map.get("articles"));

		while (encuentradorArticulos.find()) {

			CodigosArticulo.add(Integer.parseInt(encuentradorArticulos.group()));
		}

		Matcher encuentradorCantidades = Pattern.compile("\\d+").matcher(map.get("quantities"));

		while (encuentradorCantidades.find()) {

			CantidadArticulos.add(Integer.parseInt(encuentradorCantidades.group()));
		}

		/* Se debe hacer un for para insertar cada articulo al DETALLE */
		for (int i = 0; i < CodigosArticulo.size(); i++) {

			Articulo articulo = serviceArt.FindByID(CodigosArticulo.get(i));

			ArticulosCarrito.add(articulo);

			DetalleOrdenPedido Detalle = new DetalleOrdenPedido();

			Detalle.setOrdenpedido(serviceOrd.FindByID(maxCodigo));
			Detalle.setArticulo(articulo);
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
	}

	@PostMapping(path = "/Cita/Registrar")
	public void RegistrarCita(@RequestBody HashMap<String, String> map) throws ParseException {

		Cita cita = new Cita();

		cita.setFecha(LocalDate.parse(map.get("date")));
		cita.setHora(LocalTime.parse(map.get("hour")));

		Cliente cliente = serviceCli.ObtenerCodigoByEmail(map.get("email"));

		cita.setCliente(cliente);

		serviceCita.Insert(cita);
	}

	@GetMapping(path = "/Cita/Listar")
	public Collection<Cita> ListarCitas() {

		return serviceCita.FindAll();
	}

	@GetMapping(path = "/Cita/{Email}")
	public Collection<Cita> ListarCitas(@PathVariable("Email") String Email) {

		Cliente cliente = serviceCli.ObtenerCodigoByEmail(Email);

		return serviceCita.CitasByCodigoCliente(cliente.getCod_Cliente());
	}

	@PutMapping(path = "/Cliente/Actualizar")
	public void actualizarcliente(@RequestBody Cliente cliente) {

		boolean op = serviceCli.Validate(serviceCli.ObtenerCodigoByEmail(cliente.getEmail()).getCod_Cliente());

		if (op) {

			Cliente clienteDb = serviceCli.ObtenerCodigoByEmail(cliente.getEmail());

			System.out.println("CODIGO CLIENTE EN BD ----> " + clienteDb.getEmail());
			System.out.println("EMAIL CLIENTE EN BD ----> " + clienteDb.getCod_Cliente());

			cliente.setCod_Cliente(clienteDb.getCod_Cliente());

			if (cliente.getApellidop() == null)
				cliente.setApellidop(clienteDb.getApellidop());
			if (cliente.getApellidom() == null)
				cliente.setApellidom(clienteDb.getApellidom());
			if (cliente.getDni() == null)
				cliente.setDni(clienteDb.getDni());
			if (cliente.getEmail() == null)
				cliente.setEmail(clienteDb.getEmail());
			if (cliente.getCelular() == null)
				cliente.setCelular(clienteDb.getCelular());
			if (cliente.getRuc() == null)
				cliente.setRuc(clienteDb.getRuc());
			if (cliente.getDireccion() == null)
				cliente.setDireccion(clienteDb.getDireccion());
			if (cliente.getDistrito() == null)
				cliente.setDistrito(clienteDb.getDistrito());

			serviceCli.Update(cliente);
			// return "Se actualizaron los datos correctamente";

		} else {
			// return "No existe el registro con ID => " + cliente.getCod_Cliente();
		}
	}

	@GetMapping("/Ordenes/{Email}")
	public Collection<OrdenPedidoDto> ObtenerOrdenesMovil(@PathVariable("Email") String Email) {

		Cliente cliente = serviceCli.ObtenerCodigoByEmail(Email);

		return serviceOrd.ObtenerPedidosPerzonalizado(cliente.getCod_Cliente());
	}

	@PostMapping(path = "/Token")
	public void getToken(@org.springframework.web.bind.annotation.RequestBody HashMap<String, String> map)
			throws IOException {

		String key = map.get("key");
		Integer total = Integer.parseInt(map.get("total"));

		String result = "";
		String URL = "https://api.culqi.com/v2";
		
		JSONObject jo = new JSONObject();
		jo.put("amount", total);
		jo.put("currency_code", "PEN");
		jo.put("email", map.get("email"));
		jo.put("source_id", key);

		System.err.println(jo.toString());

		try {
			okhttp3.RequestBody body = okhttp3.RequestBody.create(JSON, jo.toString());

			Request request = new Request.Builder().url(URL + "/charges")
					.header("Authorization", "Bearer sk_test_3a60f9b15e3b78a3").post(body).build();

			Response response = client.newCall(request).execute();

		} catch (IOException e) {
			result = exceptionError();
		}
		System.out.println(result);
	}

	private String exceptionError() {

		String result = "";

		Map<String, Object> errorResponse = new HashMap<String, Object>();

		errorResponse.put("object", "error");
		errorResponse.put("type", "internal");
		errorResponse.put("charge_id", "ninguno");
		errorResponse.put("code", "ninguno");
		errorResponse.put("decline_code", "ninguno");
		errorResponse.put("merchant_message", "El tiempo de espera ha sido excedido");
		errorResponse.put("user_message", "El tiempo de espera ha sido excedido");
		errorResponse.put("param", "ninguno");

		try {
			result = new ObjectMapper().writeValueAsString(errorResponse);

		} catch (JsonProcessingException jx) {

		}
		return result;
	}

	@GetMapping("/Marcas")
	public Collection<MarcaMontura> findallmarca() {

		return serviceMarca.FindAll();
	}
}
