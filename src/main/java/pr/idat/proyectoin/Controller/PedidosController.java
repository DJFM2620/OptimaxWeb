package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pr.idat.proyectoin.Entity.OrdenPedido;
import pr.idat.proyectoin.Service.DetalleOrdenPedidoService;
import pr.idat.proyectoin.Service.EstadoService;
import pr.idat.proyectoin.Service.OrdenPedidoService;

@Controller
public class PedidosController {

	@Autowired
	private DetalleOrdenPedidoService detalleOrdenService;

	@Autowired
	private OrdenPedidoService ordenPedidoService;
	
	@Autowired
	private EstadoService estadoService;
	
	@Autowired
	private DetalleOrdenPedidoService detalleService;
	
	@RequestMapping(value = "/Pedido/Listar", method = RequestMethod.GET)
	public String listarpedido(Map map) {

		map.put("bPedidos", ordenPedidoService.FindAll());

		return "/Pedido/Listar";
	}
	
	@RequestMapping({ "/Pedido/Detalle" })
	public String Verdetalle(Map map, @RequestParam(value = "code", defaultValue = "") Integer code,
			@RequestParam(value = "codes", defaultValue = "") Integer codes) {

		map.put("bDetalles", detalleOrdenService.DetallePedido(code, codes));
		map.put("bsubtotal", detalleService.calculosubtotal(code, codes));

		return "/Pedido/Detalle";

	}
	
	@RequestMapping(value = "/MisPedidos", method = RequestMethod.GET)
	public String pedidos(Map map) {

		return "/Pedido/Pedidos";
	}

	@RequestMapping(value = "/MisPedidos", method = RequestMethod.POST, params = "dni")
	public String pedidos_post(Map map) {

		return "/Pedido/Pedidos";
	}

	@RequestMapping({ "/BuscarPedidoDni" })
	public String Buscarpedido(Map map, @RequestParam(value = "code", defaultValue = "") Integer code) {

		map.put("bPedidos", ordenPedidoService.PedidosCliente(code));

		return "/Pedido/Pedidos";
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
