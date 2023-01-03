package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		return "/Material/editar";
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

	@RequestMapping(value = "/Material/Eliminar/{MaterialID}", method = RequestMethod.POST)
	public String EliminarMaterialArticulo_POST(TipoMaterialMontura MaterialMontura) {

		materialService.Delete(MaterialMontura.getCod_TipMaterial());

		return "redirect:/Material/Listar";
	}
}
