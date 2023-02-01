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

import pr.idat.proyectoin.Entity.TipoMaterialMontura;
import pr.idat.proyectoin.Service.TipoMaterialMonturaService;

@Controller
public class MaterialController {

	@Autowired
	private TipoMaterialMonturaService materialService;

	@RequestMapping(value = "/Material/Listar", method = RequestMethod.GET)
	public String ListaMaterialArticulo_GET(Map map) {

		map.put("bMaterialArticulos", materialService.FindAll());

		return "/Material/Listar";
	}

	@RequestMapping(value = "/Material/Registrar", method = RequestMethod.GET)
	public String RegistrarMaterialArticulo_GET(Model model) {

		model.addAttribute("material", new TipoMaterialMontura());

		return "/Material/Registrar";
	}

	@RequestMapping(value = "/Material/Registrar", method = RequestMethod.POST)
	public String RegistrarMaterialArticulo_POST(TipoMaterialMontura materialArticulo) {

		materialService.Insert(materialArticulo);

		return "redirect:/Material/Listar";
	}

	@RequestMapping(value = "/Material/Editar/{MaterialID}", method = RequestMethod.GET)
	public String EditarMaterialArticulo_GET(Model model, @PathVariable("MaterialID") Integer MaterialID) {

		model.addAttribute("MaterialArticulo", materialService.FindByID(MaterialID));

		return "/Material/Editar";
	}

	@RequestMapping(value = "/Material/Editar/{MaterialID}", method = RequestMethod.POST)
	public String EditarMaterialArticulo_POST(TipoMaterialMontura materialArticulo) {

		materialService.Update(materialArticulo);

		return "redirect:/Material/Listar";
	}

	@RequestMapping(value = "/Material/Eliminar/{MaterialID}", method = RequestMethod.GET)
	public String EliminarMaterialArticulo_GET(Model model, @PathVariable("MaterialID") Integer MaterialID) {

		model.addAttribute("MaterialArticulo", materialService.FindByID(MaterialID));

		return "/Material/Eliminar";
	}

	@RequestMapping(value = "/Material/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(materialService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el material de ID '" + codigo + "'");
			
			materialService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el material debido a que esta relacionado con articulos");
		}
		return result;
	}
}
