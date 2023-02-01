package pr.idat.proyectoin.Controller;

import java.io.IOException;
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

import pr.idat.proyectoin.Entity.ColorArticulo;
import pr.idat.proyectoin.Service.ColorArticuloService;

@Controller
public class ColorController {

	@Autowired
	private ColorArticuloService colorService;
	
	@RequestMapping(value = "/ColorArticulo/Listar", method = RequestMethod.GET)
	public String listar_GET(Map map) {
		
		map.put("bColores", colorService.FindAll());
		
		return "/ColorArticulo/Listar";
	}
	
	@RequestMapping(value = "/ColorArticulo/Registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		model.addAttribute("Color", new ColorArticulo());

		return "/ColorArticulo/Registrar";
	}

	@RequestMapping(value = "/ColorArticulo/Registrar", method = RequestMethod.POST)
	public String registrar_POST(ColorArticulo colorArt) throws IOException {

		colorService.Insert(colorArt);

		return "redirect:/ColorArticulo/Listar";
	}

	@RequestMapping(value = "/ColorArticulo/Eliminar/{ColorID}", method = RequestMethod.GET)
	public String eliminar_GET(Model model, @PathVariable("ColorID") Integer ColorID) {

		model.addAttribute("Color", colorService.FindByID(ColorID));

		return "/ColorArticulo/Borrar";
	}

	@RequestMapping(value = "/ColorArticulo/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(colorService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el color de ID '" + codigo + "'");
			
			colorService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el color debido a que esta relacionado con articulos");
		}
		return result;
	}

	@RequestMapping(value = "/ColorArticulo/Editar/{ColorID}", method = RequestMethod.GET)
	public String editar_GET(Model model, @PathVariable("ColorID") Integer ColorID) {

		model.addAttribute("Color", colorService.FindByID(ColorID));

		return "/ColorArticulo/Editar";
	}

	@RequestMapping(value = "/ColorArticulo/Editar/{ColorID}", method = RequestMethod.POST)
	public String editar_POST(ColorArticulo colorArt) throws IOException {

		colorService.Update(colorArt);

		return "redirect:/ColorArticulo/Listar";
	}
}
