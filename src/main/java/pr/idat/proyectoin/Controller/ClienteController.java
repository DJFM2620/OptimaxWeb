package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pr.idat.proyectoin.Entity.Cliente;

import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DistritoService;

@Controller
public class ClienteController {

	
	@Autowired
	private ClienteService clienteService;
	@Autowired
	private DistritoService distritoService;
	
	@RequestMapping(value = "/cliente_listar",method = RequestMethod.GET)
	public String listar_GET( Map map) {
		
		
		
		 map.put("bCliente", clienteService.FindAll());
		 
		return "/Cliente/listar";
	}
	
	
	@RequestMapping(value = "/cliente_registrar",method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		 model.addAttribute("Cliente", new Cliente());
		 map.put("bDistrito",distritoService.FindAll());
		return "/Cliente/registrar";
	}
	
	@RequestMapping(value = "/cliente_registrar",method = RequestMethod.POST)
	public String registrar_POST(Cliente cliente) {
		

		 if(clienteService.ExistenciaCliente(cliente.getDni())==0){
			 
			 clienteService.Insert(cliente);
		 }
		 else {
			System.out.println("este cliente si existe"+cliente.getDni().toString());
		 }
		
		
		return "redirect:/principal";
	}
	
	
	@RequestMapping(value = "/EditarCliente/{clienteID}", method = RequestMethod.GET)
	public String editarcliente_GET(Map map,Model model,@PathVariable("clienteID")Integer clienteID) {
		
		Cliente clientemodel=clienteService.FindByID(clienteID);
		
		model.addAttribute("Cliente", clientemodel);
		map.put("bDistrito", distritoService.FindAll());
		
		return  "/Cliente/editar";
	}
	
	@RequestMapping(value = "/EditarCliente/{clienteID}",method = RequestMethod.POST)
	public String Editarcliente_POST(Cliente cliente) {
		
		
		clienteService.Update(cliente);
		
		
		return "redirect:/cliente_listar";
	}

	
	
	@RequestMapping( value = "/Eliminarcliente/{clienteID}", method = RequestMethod.GET)
	public String Eliminarcliente_GET( Model model, @PathVariable("clienteID") Integer clienteID) {

	model.addAttribute("Cliente", clienteService.FindByID(clienteID));

	return "/Cliente/borrar";
	}

	@RequestMapping( value = "/Eliminarcliente/{clienteID}", method = RequestMethod.POST)
	public String Eliminarcliente_POST( Cliente cliente ) {

		clienteService.Delete(cliente.getCod_Cliente());

	return "redirect:/cliente_listar";
	}
	
	
	
	
	
	
	
	
}
