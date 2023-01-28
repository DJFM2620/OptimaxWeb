package pr.idat.proyectoin.Controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Entity.DetalleOrdenPedido;
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
	
	@RequestMapping(value = "/Pedido/Listar", method = RequestMethod.GET)
	public String listarpedido(Map map) {

		map.put("bPedidos", ordenPedidoService.FindAll());

		return "/Pedido/Listar";
	}
	
	@RequestMapping(value = "/MisPedidos", method = RequestMethod.GET)
	public String pedidos(Map map) {
		
		return "/Pedido/Pedidos";
	}
	
	@RequestMapping(value = "/Pedido/Detalle", method = RequestMethod.GET)
    public @ResponseBody Collection<DetalleOrdenPedido> DetallePedido(Integer codigoPedido) {
		
		Collection<DetalleOrdenPedido> detalle = detalleOrdenService.DetallePedido(codigoPedido);
        
        return detalle;
    }

	@RequestMapping(value = "/Pedido/Dni", method = RequestMethod.GET)
	public @ResponseBody Collection<OrdenPedido> Ordenes(Integer dni) {

		Collection<OrdenPedido> orden = ordenPedidoService.PedidosCliente(dni);

		return orden;
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
