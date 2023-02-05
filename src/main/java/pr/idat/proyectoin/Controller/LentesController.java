package pr.idat.proyectoin.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
import pr.idat.proyectoin.Entity.EstadoPedido;
import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.ColorArticuloService;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.EstadoService;
import pr.idat.proyectoin.Service.MarcaMonturaService;
import pr.idat.proyectoin.Service.OrdenPedidoService;
import pr.idat.proyectoin.Service.TipoMaterialMonturaService;
import pr.idat.proyectoin.Service.TipoModeloMonturaService;

@Controller
public class LentesController {

	@Autowired
	private ArticuloService articuloService;

	@Autowired
	private MarcaMonturaService marcaService;

	@Autowired
	private TipoModeloMonturaService modeloService;

	@Autowired
	private TipoMaterialMonturaService materialService;

	@Autowired
	private ColorArticuloService colorService;

	@Autowired
	private ClienteService clienteService;

	@Autowired
	private DistritoService distritoService;

	@Autowired
	private DetalleOrdenPedidoService detalleOrdenService;

	@Autowired
	private OrdenPedidoService ordenPedidoService;

	@Autowired
	private EstadoService estadoService;

	private static final List<String> URL_Filter = new ArrayList<String>();
	private static final List<Articulo> carritoArticulo = new ArrayList<>();
	private static final List<DetalleOrdenPedido> carritoDetalleOrdenPedido = new ArrayList<>();
	private static final List<Integer> Quantities = new ArrayList<Integer>();
	private static String SubTotal = "";
	private static final String URL_CULQI = "https://api.culqi.com/v2";

	OkHttpClient client = new OkHttpClient.Builder().connectTimeout(180, TimeUnit.SECONDS)
			.readTimeout(180, TimeUnit.SECONDS).build();

	public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

	@RequestMapping(value = "/Lentes", method = RequestMethod.GET)
	public String lentes_GET(Map map) {

		int maxPages = (int) Math.ceil(articuloService.CountArticles() / 12.0);

		map.put("currentPage", 1);
		map.put("lastPage", maxPages);
		map.put("isPageable", true);

		Pageable pageable = PageRequest.of(0, 12);

		map.put("bArticulo", articuloService.FindAllPage(pageable));
		map.put("bCarrito", carritoArticulo);
		map.put("bMarcas", marcaService.FindAll());
		map.put("bModelos", modeloService.FindAll());
		map.put("bMateriales", materialService.FindAll());
		map.put("bColores", colorService.FindAll());
		map.put("mapPrecioMinimo", articuloService.minPrecio());
		map.put("mapPrecioMaximo", articuloService.maxPrecio());

		URL_Filter.clear();

		return "/Lentes";
	}

	// Una vez se hace click en el boton "Realizar Pedido" del carrito se realizar
	// esto
	@RequestMapping(value = "/Lentes", method = RequestMethod.POST)
	public String lentes_POST(Model model, Map map, 
							  @RequestParam(value = "Quantity") String Cantidades,
							  @RequestParam(value = "PostTotalOrder") String SubTotalOrder) {

		SubTotal = SubTotalOrder;
		
		Matcher encuentrador = Pattern.compile("\\d+").matcher(Cantidades);

		while (encuentrador.find()) {

			Quantities.add(Integer.parseInt(encuentrador.group()));// se almacenan las cantidades en el array
		}
		return "redirect:/Pedido/Registrar/Cliente";
	}

	@RequestMapping(value = "/Lentes/Filtro", method = RequestMethod.GET)
	public String listarPor(HttpServletRequest request, Map map,
			@RequestParam(name = "colores", required = false) List<String> colorList,
			@RequestParam(name = "marcas", required = false) List<String> marcaList,
			@RequestParam(name = "materiales", required = false) List<String> materialList,
			@RequestParam(name = "modelos", required = false) List<String> modeloList,
			@RequestParam(name = "minimo", required = false) Double precioMinimo,
			@RequestParam(name = "maximo", required = false) Double precioMaximo,
			@RequestParam(name = "pagina", required = false) Integer pagina) {

		Double minPrecio = articuloService.minPrecio();
		Double maxPrecio = articuloService.maxPrecio();

		int maxPages = (int) Math.ceil(articuloService.CountArticles()/12.0);
		
		Integer offSet = 0; // 12(1) -> 24(2) -> 36(3)
		Integer currentPage = 1;
		Integer limite = 12; //La cantidad de articulos que se podra ver en pantalla
		
		if(pagina != null) {
			offSet = 12 * (pagina - 1); // 12(1) -> 24(2) -> 36(3)
			currentPage = pagina;
		}

		if ((maxPages - currentPage) > 10) {
			if (currentPage > 3) {

				map.put("currentPage", pagina - 2);
			} else {

				map.put("currentPage", 1);
			}
		} else {

			map.put("currentPage", maxPages - 10);
		}

		map.put("lastPage", maxPages);
		map.put("isPageable", false);

		if (precioMinimo == null) {

			map.put("bArticulo", articuloService.FilterAll(colorList, marcaList, materialList, modeloList, minPrecio,
					maxPrecio, limite,  offSet));

		} else {
			map.put("bArticulo", articuloService.FilterAll(colorList, marcaList, materialList, modeloList, precioMinimo,
					precioMaximo, limite, offSet));
		}

		map.put("bCarrito", carritoArticulo);
		map.put("bMarcas", marcaService.FindAll());
		map.put("bModelos", modeloService.FindAll());
		map.put("bMateriales", materialService.FindAll());
		map.put("bColores", colorService.FindAll());
		map.put("mapPrecioMinimo", articuloService.minPrecio());
		map.put("mapPrecioMaximo", articuloService.maxPrecio());

		String parameters = request.getQueryString();

		String URL = "Lentes/Filtro?" + parameters;

		URL_Filter.clear();
		URL_Filter.add(URL);

		return "/Lentes";
	}

	// Esto sucede cuando se agregar un lente al carrito
	@RequestMapping(value = "/Lentes/Carrito/{ArticuloID}", method = RequestMethod.GET)
	public String lentescarrito_GET(@PathVariable("ArticuloID") Integer ArticuloID, Map map) {

		Articulo articulo = articuloService.FindByID(ArticuloID);

		carritoArticulo.add(articulo);

		if (URL_Filter.size() > 0) {

			return "redirect:/" + URL_Filter.get(0);

		} else {

			return "redirect:/Lentes";
		}
	}

	@RequestMapping(value = "/Lentes/Carrito/Eliminar", method = RequestMethod.GET)
	public String EliminarArticuloCarrito(Map map, @RequestParam(name = "code") String code) {

		Articulo articulo = articuloService.FindByID(Integer.parseInt(code));

		for (var artCarrito : carritoArticulo) {

			Articulo NuevoArticulo = articuloService.FindByID(artCarrito.getCodArticulo());

			if (NuevoArticulo == articulo) {

				carritoArticulo.remove(carritoArticulo.indexOf(artCarrito));

				if (URL_Filter.size() > 0) {

					return "redirect:/" + URL_Filter.get(0);

				} else {

					return "redirect:/Lentes";
				}
			}
		}
		return null;
	}

	@RequestMapping(value = "/Pedido/Registrar/Cliente", method = RequestMethod.GET)
	public String RegistrarClientePedido_GET(Model model, Map map) {

		model.addAttribute("Cliente", new Cliente());
		map.put("bDistrito", distritoService.FindAll());
		map.put("amount", SubTotal);

		return "/Pedido/Registrar_Cliente";
	}

	@RequestMapping(value = "/Pasarela", method = RequestMethod.POST)
	public String Pasarela(@RequestBody HashMap<String, String> map) {
		
		String result = "";
		
		JSONObject jo = new JSONObject();
		jo.put("amount", map.get("monto"));
		jo.put("currency_code", map.get("moneda"));
		jo.put("email", map.get("email"));
		jo.put("source_id", map.get("token"));
		
		System.err.println(jo.toString());

		try {
			okhttp3.RequestBody body = okhttp3.RequestBody.create(JSON, jo.toString());

			Request request = new Request.Builder().url(URL_CULQI + "/charges")
					.header("Authorization", "Bearer sk_test_3a60f9b15e3b78a3").post(body).build();

			Response response = client.newCall(request).execute();

			if (response.isSuccessful()) {
				
				result = "La transaccion fue exitosa!";
				
				Cliente cliente = new Cliente();
				
				cliente.setNombres(map.get("nombres"));
				cliente.setApellidop(map.get("apellidop"));
				cliente.setApellidom(map.get("apellidom"));
				cliente.setDni(Integer.parseInt(map.get("dni")));
				cliente.setCelular(Integer.parseInt(map.get("celular")));
				cliente.setEmail(map.get("email"));
				cliente.setRuc(map.get("ruc"));
				cliente.setDireccion(map.get("direccion"));
				cliente.setDistrito(distritoService.FindByID(Integer.parseInt(map.get("distrito"))));
				
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

						detalleOrdenService.Insert(DetalleOrdenPedido); /*
														 * Aca debe ir todos los articulos comprados por el cliente, por logica
														 * siempre sera el ultimo codigo de pedido y el ultimo cliente creado,
														 * si existe se buscara mediante su DNI al Cliente
														 */
					}
					carritoDetalleOrdenPedido.clear();
					carritoArticulo.clear();
					Quantities.clear();

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
					Quantities.clear();
				}

			} else {
				result = "Hubo un error al momento de realizar la transaccion";
			}
				
		} catch (IOException e) {
			result = exceptionError();

		}
		System.out.println(result);
		return result;
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
}
