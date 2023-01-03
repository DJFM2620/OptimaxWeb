package pr.idat.proyectoin.Controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Entity.EstadoPedido;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.CitaService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.EmpleadoService;
import pr.idat.proyectoin.Service.EstadoService;
import pr.idat.proyectoin.Service.OrdenPedidoService;
import pr.idat.proyectoin.Entity.Cita;

@Controller
public class PrincipalController {

	@Autowired
	private EmpleadoService empleadoService;
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private ArticuloService articuloService;
	
	@Autowired
	private DetalleOrdenPedidoService detalleOrdenService;
	
	@Autowired
	private DistritoService distritoService;
	
	@Autowired
	private OrdenPedidoService ordenPedidoService;
	
	@Autowired
	private CitaService citaService;
	
	@Autowired
	private DetalleOrdenPedidoService detalleService;
	
	@Autowired
	private EstadoService estadoService;

	private static final List<Articulo> carritoArticulo = new ArrayList<>();
	private static final List<DetalleOrdenPedido> carritoDetalleOrdenPedido = new ArrayList<>();
	private static final List<Integer> Quantities = new ArrayList<Integer>();

	@RequestMapping(value = "/Principal", method = RequestMethod.GET)
	public String login() {

		return "/Principal";
	}

	@RequestMapping(value = "/validarempleado/{emailId}/{dniId}", method = RequestMethod.GET)
	public String validarempleado(Map map, @PathVariable("emailId") String email, @PathVariable("dniId") Integer dni) {
		if (clienteService.validacioncliente(email, dni) == 1) {

			return "redirect:/Principal";

		} else {
			if (empleadoService.validarcargo(email, dni) == 3) {
				
				return "/Administrador/Principal";
				
			} else if (empleadoService.validarcargo(email, dni) == 4) {

				return "/Recepcionista/Principal";
			}
			if (empleadoService.validarcargo(email, dni) == 2) {
				
				return "/JefedeVentas/Principal";
			}else {

				return "redirect:/Principal";
			}
		}
	}

	@RequestMapping(value = "/Lentes", method = RequestMethod.GET)
	public String lentes_GET(Model model, Map map) {

		map.put("Bimagen", articuloService.FindAll());
		map.put("bCarrito", carritoArticulo);

		return "/Lentes";
	}

	//Una vez se hace click en el boton "Realizar Pedido" del carrito se realizar esto
	@RequestMapping(value = "/Lentes", method = RequestMethod.POST)
	public String lentes_POST(Model model, Map map, @RequestParam(value = "Quantity") String Cantidades) {

		Matcher encuentrador = Pattern.compile("\\d+").matcher(Cantidades);

		while (encuentrador.find()) {

			Quantities.add(Integer.parseInt(encuentrador.group()));//se almacenan las cantidades en el array
		}

		return "redirect:/RegistrarClientePedido";
	}

	//Esto sucede cuando se agregar un lente al carrito
	@RequestMapping(value = "/Lentes/Carrito/{ArticuloID}", method = RequestMethod.GET)
	public String lentescarrito_GET(@PathVariable("ArticuloID") Integer ArticuloID, Map map) {

		Articulo articulo = articuloService.FindByID(ArticuloID);

		carritoArticulo.add(articulo);

		return "redirect:/Lentes";
	}

	@RequestMapping(value = "/RegistrarClientePedido", method = RequestMethod.GET)
	public String RegistrarClientePedido_GET(Model model, Map map) {

		model.addAttribute("Cliente", new Cliente());
		map.put("bDistrito", distritoService.FindAll());

		return "RegistrarClientePedido";
	}

	@RequestMapping(value = "/RegistrarClientePedido", method = RequestMethod.POST)
	public String RegistrarClientePedido_POST(Cliente cliente) {

		for (int i = 0; i < carritoArticulo.size(); i++) {

			System.out.println("Codigo de Articulo : " + carritoArticulo.get(i).getCodArticulo()
					+ ", Tiene la cantidad : " + Quantities.get(i));
		}

		if (clienteService.ExistenciaCliente(cliente.getDni()) == 1) {

			OrdenPedido ordenpedido = new OrdenPedido();
			EstadoPedido estadopedido = estadoService.FindByID(1);
			ordenpedido.setCod_pedido(ordenPedidoService.CodigoOrdenPedido() + 1);
			ordenpedido.setFecha(LocalDate.now());
			ordenpedido.setCliente(clienteService.FindByID(clienteService.ObtenerCodigoCliente(cliente.getDni())));
			ordenpedido.setEstadopedido(estadopedido);

			ordenPedidoService.Insert(ordenpedido);

			for (int i = 0; i < carritoArticulo.size(); i++) {

				DetalleOrdenPedido Detalle = new DetalleOrdenPedido();

				Detalle.setOrdenpedido(ordenPedidoService.FindByID(ordenPedidoService.CodigoOrdenPedido()));
				Detalle.setArticulo(articuloService.FindByID(carritoArticulo.get(i).getCodArticulo()));
				Detalle.setCantidad(Quantities.get(i));
				Detalle.setSubtotal(Quantities.get(i) * carritoArticulo.get(i).getPrecio());

				carritoDetalleOrdenPedido.add(Detalle);
			}
			for (DetalleOrdenPedido DetalleOrdenPedido : carritoDetalleOrdenPedido) {

				detalleOrdenService.Insert(
						DetalleOrdenPedido); /*
												 * Aca debe ir todos los articulos comprados por el cliente, por logica
												 * siempre sera el ultimo codigo de pedido y el ultimo cliente creado,
												 * si existe se buscara mediante su DNI al Cliente
												 */
			}

			carritoDetalleOrdenPedido.clear();
			carritoArticulo.clear();

		} else {

			clienteService.Insert(cliente);

			OrdenPedido ordenpedido = new OrdenPedido();
			EstadoPedido estadopedido = estadoService.FindByID(1);
			ordenpedido.setCod_pedido(ordenPedidoService.CodigoOrdenPedido() + 1);
			ordenpedido.setFecha(LocalDate.now());
			ordenpedido.setCliente(clienteService.FindByID(clienteService.ObtenerCodigoCliente(cliente.getDni())));
			ordenpedido.setEstadopedido(estadopedido);
			ordenPedidoService.Insert(ordenpedido);

			for (int i = 0; i < carritoArticulo.size(); i++) {

				DetalleOrdenPedido Detalle = new DetalleOrdenPedido();

				Detalle.setOrdenpedido(ordenPedidoService.FindByID(ordenPedidoService.CodigoOrdenPedido()));
				Detalle.setArticulo(articuloService.FindByID(carritoArticulo.get(i).getCodArticulo()));
				Detalle.setCantidad(Quantities.get(i));
				Detalle.setSubtotal(Quantities.get(i) * carritoArticulo.get(i).getPrecio());

				carritoDetalleOrdenPedido.add(Detalle);
			}
			for (DetalleOrdenPedido DetalleOrdenPedido : carritoDetalleOrdenPedido) {

				detalleOrdenService.Insert(
						DetalleOrdenPedido); /*
												 * Aca debe ir todos los articulos comprados por el cliente, por logica
												 * siempre sera el ultimo codigo de pedido y el ultimo cliente creado,
												 * si existe se buscara mediante su DNI al Cliente
												 */
			}
			carritoDetalleOrdenPedido.clear();
			carritoArticulo.clear();

		} /* Fin Else */

		return "redirect:/Principal";
	}

	@RequestMapping(value = "/Cita", method = RequestMethod.GET)
	public String cita_GET(Map map) {

		map.put("bDistritos", distritoService.FindAll());

		return "/Cita/Registrar";
	}

	@RequestMapping(value = "/Cita", method = RequestMethod.POST)
	public String cita_POST(@RequestParam("nombrecliente") String nombrecliente,
			@RequestParam("apellidopcliente") String apellidopcliente,
			@RequestParam("apellidomcliente") String apellidomcliente,
			@RequestParam("emailcliente") String emailcliente, @RequestParam("dnicliente") Integer dnicliente,
			@RequestParam("celularcliente") Integer celularcliente, @RequestParam("namedistrito") Integer namedistrito,
			@RequestParam("mescliente") String mescliente, @RequestParam("horacliente") String horacliente) {

		if (clienteService.ExistenciaCliente(dnicliente) == 1) {

			LocalDate date = LocalDate.parse(mescliente);
			LocalTime time = LocalTime.parse(horacliente);

			Cita cita = new Cita();

			cita.setFecha(date);
			cita.setHora(time);
			cita.setCliente(clienteService.FindByID(clienteService.ObtenerCodigoCliente(dnicliente)));

			citaService.Insert(cita);
		} else {

			Cliente cliente = new Cliente();

			cliente.setNombres(nombrecliente);
			cliente.setApellidop(apellidopcliente);
			cliente.setApellidom(apellidomcliente);
			cliente.setCelular(celularcliente);
			cliente.setEmail(emailcliente);
			cliente.setDni(dnicliente);
			cliente.setDistrito(distritoService.FindByID(namedistrito));

			clienteService.Insert(cliente);

			LocalDate date = LocalDate.parse(mescliente);
			LocalTime time = LocalTime.parse(horacliente);

			Cita cita = new Cita();

			cita.setFecha(date);
			cita.setHora(time);
			cita.setCliente(cliente);

			citaService.Insert(cita);
		}

		return "redirect:/Principal";
	}

	@RequestMapping(value = "/MisPedidos", method = RequestMethod.GET)
	public String pedidos(Map map) {

		return "/Pedido/Pedidos";
	}

	@RequestMapping(value = "/MisPedidos", method = RequestMethod.POST, params = "dni")
	public String pedidos_post(Map map) {

		return "/Pedido/Pedidos";
	}

	@RequestMapping({ "/Lentes/Carrito/Eliminar" })
	public String removeProductHandler(Map map, @RequestParam(value = "code", defaultValue = "") String code) {

		Articulo articulo = articuloService.FindByID(Integer.parseInt(code));

		for (var a : carritoArticulo) {

			Articulo NuevoArticulo = articuloService.FindByID(a.getCodArticulo());

			if (NuevoArticulo == articulo) {

				carritoArticulo.remove(carritoArticulo.indexOf(a));

				return "redirect:/Lentes";
			}
		}

		return "redirect:/Lentes";
	}

	@RequestMapping({ "/BuscarPedidoDni" })
	public String Buscarpedido(Map map, @RequestParam(value = "code", defaultValue = "") Integer code) {

		map.put("bPedidos", ordenPedidoService.PedidosCliente(code));

		return "/Pedido/Pedidos";
	}

	@RequestMapping(value = "/MisCitas", method = RequestMethod.GET)
	public String citas() {

		return "/Cita/Citas";
	}

	@RequestMapping(value = "/MisCitas", method = RequestMethod.GET, params = "dni")
	public String citaspost() {

		return "/Cita/Citas";
	}

	@RequestMapping({ "/BuscarCitaDni" })
	public String Buscarcita(Map map, @RequestParam(value = "code", defaultValue = "") Integer code) {

		map.put("bCitadni", citaService.CitasCliente(code));

		return "/Cita/Citas";
	}

	@RequestMapping(value = "/Recepcionista/Principal", method = RequestMethod.GET)
	public String citas(Map map) {

		return "/Recepcionista/Principal";
	}

	@RequestMapping(value = "/Cita/Listar", method = RequestMethod.GET)
	public String listarcitas(Map map) {

		map.put("bCitas", citaService.FindAll());

		return "/Cita/Listar";
	}

	@RequestMapping({ "/Pedido/Detalle" })
	public String Verdetalle(Map map, @RequestParam(value = "code", defaultValue = "") Integer code,
			@RequestParam(value = "codes", defaultValue = "") Integer codes) {

		map.put("bDetalles", detalleOrdenService.DetallePedido(code, codes));
		map.put("bsubtotal", detalleService.calculosubtotal(code, codes));

		return "/Pedido/Detalle";

	}

	@RequestMapping(value = "/Pedido/Listar", method = RequestMethod.GET)
	public String listarpedido(Map map) {

		map.put("bPedidos", ordenPedidoService.FindAll());

		return "/Pedido/Listar";
	}

	@RequestMapping(value = "/JefeVentas/Principal", method = RequestMethod.GET)
	public String listarpedido() {

		return "/JefeVentas/Principal";
	}

	@RequestMapping(value = "/Pedido/Editar/{OrdenId}", method = RequestMethod.GET)
	public String editarorden(Map map, Model model, @PathVariable("OrdenId") Integer OrdenId) {

		OrdenPedido ordenmodel = ordenPedidoService.FindByID(OrdenId);

		model.addAttribute("OrdenPedido", ordenmodel);
		map.put("bEstado", estadoService.FindAll());

		return "/Pedido/Editar";
	}

	@RequestMapping(value = "/Pedido/Editar/{OrdenId}", method = RequestMethod.POST)
	public String editarordenPost(OrdenPedido ordenpedido) {

		ordenPedidoService.Update(ordenpedido);

		return "redirect:/Pedido/Listar";
	}
}
