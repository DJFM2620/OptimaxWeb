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

import pr.idat.proyectoin.Entity.Distrito;

import pr.idat.proyectoin.Service.DistritoService;

@Controller
public class DistritoController {

	@Autowired
	private DistritoService distritoService;

	@RequestMapping(value = "/Distrito/Listar", method = RequestMethod.GET)
	public String listar_GET(Map map) {

		map.put("bDistrito", distritoService.FindAll());
		
		return "/Distrito/Listar";
	}

	@RequestMapping(value = "/Distrito/Registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		model.addAttribute("Distrito", new Distrito());

		return "/Distrito/Registrar";
	}

	@RequestMapping(value = "/Distrito/Registrar", method = RequestMethod.POST)
	public String registrar_POST(Distrito distrito) {
		
		distritoService.Insert(distrito);
		
		return "redirect:/Distrito/Listar";
	}
	
	@RequestMapping(value = "/Distrito/Editar/{DistritoID}", method = RequestMethod.GET)
	public String editar_GET(Model model, Map map, @PathVariable("DistritoID") Integer DistritoID) {

		model.addAttribute("Distrito", distritoService.FindByID(DistritoID));

		return "/Distrito/Editar";
	}

	@RequestMapping(value = "/Distrito/Editar/{DistritoID}", method = RequestMethod.POST)
	public String editar_POST(Distrito distrito) {
		
		distritoService.Update(distrito);
		
		return "redirect:/Distrito/Listar";
	}
	
	@RequestMapping(value = "/Distrito/Eliminar/{DistritoID}", method = RequestMethod.GET)
	public String eliminar_GET(Model model, @PathVariable("DistritoID") Integer DistritoID) {

		model.addAttribute("Distrito", distritoService.FindByID(DistritoID));

		return "/Distrito/Borrar";
	}

	@RequestMapping(value = "/Distrito/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(distritoService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el distrito de ID '" + codigo + "'");
			
			distritoService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el distrito debido a que esta relacionado con clientes");
		}
		return result;
	}
}
