package pr.idat.proyectoin.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pr.idat.proyectoin.Entity.Cliente;

import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DistritoService;

@Controller
public class ClienteController {

	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private DistritoService distritoService;

	@RequestMapping(value = "/Cliente/Listar", method = RequestMethod.GET)
	public String listar_GET(Map map) {

		map.put("bCliente", clienteService.FindAll());

		return "/Cliente/Listar";
	}

	@RequestMapping(value = "/Cliente/Registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		model.addAttribute("Cliente", new Cliente());
		
		map.put("bDistrito", distritoService.FindAll());
		
		return "/Cliente/Registrar";
	}

	@RequestMapping(value = "/Cliente/Registrar", method = RequestMethod.POST)
	public String registrar_POST(Cliente cliente) {

		if (clienteService.ExistenciaCliente(cliente.getDni()) == 0) {

			clienteService.Insert(cliente);
			
		} else {
			System.out.println("este cliente si existe" + cliente.getDni().toString());
		}
		return "redirect:/Cliente/Listar";
	}

	@RequestMapping(value = "/Cliente/Editar/{ClienteID}", method = RequestMethod.GET)
	public String editarcliente_GET(Map map, Model model, @PathVariable("ClienteID") Integer ClienteID) {

		Cliente clientemodel = clienteService.FindByID(ClienteID);

		model.addAttribute("Cliente", clientemodel);
		
		map.put("bDistrito", distritoService.FindAll());

		return "/Cliente/Editar";
	}

	@RequestMapping(value = "/Cliente/Editar/{ClienteID}", method = RequestMethod.POST)
	public String Editarcliente_POST(Cliente cliente) {

		clienteService.Update(cliente);

		return "redirect:/Cliente/Listar";
	}

	@RequestMapping(value = "/Cliente/Eliminar/{ClienteID}", method = RequestMethod.GET)
	public String EliminarCliente_GET(Model model, @PathVariable("ClienteID") Integer ClienteID) {

		model.addAttribute("Cliente", clienteService.FindByID(ClienteID));

		return "/Cliente/Borrar";
	}

	@RequestMapping(value = "/Cliente/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(clienteService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el cliente de ID '" + codigo + "'");
			
			clienteService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el cliente debido a que esta relacionado con pedidos y/o citas");
		}
		return result;
	}
}
