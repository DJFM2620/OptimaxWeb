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

import pr.idat.proyectoin.Entity.MarcaMontura;
import pr.idat.proyectoin.Service.MarcaMonturaService;

@Controller
public class MarcaController {

	@Autowired
	private MarcaMonturaService marcamonturaService;

	@RequestMapping(value = "/Marca/Listar", method = RequestMethod.GET)
	public String ListaMarcasArticulos_GET(Map map) {

		map.put("bMarcas", marcamonturaService.FindAll());

		return "/Marca/Listar";
	}

	@RequestMapping(value = "/Marca/Registrar", method = RequestMethod.GET)
	public String RegistrarMarcaArticulo_GET(Model model) {

		model.addAttribute("MarcaArticulo", new MarcaMontura());

		return "/Marca/Registrar";
	}

	@RequestMapping(value = "/Marca/Registrar", method = RequestMethod.POST)
	public String RegistrarMarcaArticulo_POST(MarcaMontura marcaArticulo) {

		marcamonturaService.Insert(marcaArticulo);

		return "redirect:/Marca/Listar";
	}

	@RequestMapping(value = "/Marca/Editar/{MarcaID}", method = RequestMethod.GET)
	public String EditarMarcaArticulo_GET(Model model, @PathVariable("MarcaID") Integer MarcaID) {

		model.addAttribute("MarcaArticulo", marcamonturaService.FindByID(MarcaID));

		return "/Marca/Editar";
	}

	@RequestMapping(value = "/Marca/Editar/{MarcaID}", method = RequestMethod.POST)
	public String EditarMarcaArticulo_POST(MarcaMontura marcaArticulo) {

		marcamonturaService.Update(marcaArticulo);

		return "redirect:/Marca/Listar";
	}

	@RequestMapping(value = "/Marca/Eliminar/{MarcaID}", method = RequestMethod.GET)
	public String EliminarMarcaArticulo_GET(Model model, @PathVariable("MarcaID") Integer MarcaID) {

		model.addAttribute("MarcaArticulo", marcamonturaService.FindByID(MarcaID));

		return "/Marca/Eliminar";
	}
	
	@RequestMapping(value = "/Marca/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(marcamonturaService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente la marca de ID '" + codigo + "'");
			
			marcamonturaService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar la marca debido a que esta relacionado con articulos");
		}
		return result;
	}
}