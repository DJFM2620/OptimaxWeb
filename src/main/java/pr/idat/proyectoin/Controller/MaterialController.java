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
	
	
	
	@RequestMapping( value = "/MaterialArticulos", method = RequestMethod.GET)
	public String ListaMaterialArticulo_GET( Map map) {

	map.put("bMaterialArticulos", materialService.FindAll());

	return "/Material/listar";
	}

	@RequestMapping( value = "/RegistrarmaterialArticulo", method = RequestMethod.GET)
	public String RegistrarMaterialArticulo_GET( Model model ) {

	model.addAttribute("material", new TipoMaterialMontura());

	return "/Material/registrar";
	}

	@RequestMapping( value = "/RegistrarmaterialArticulo", method = RequestMethod.POST)
	public String RegistrarMaterialArticulo_POST( TipoMaterialMontura materialArticulo ) {

		materialService.Insert(materialArticulo);

	return "redirect:/MaterialArticulos";
	}


	@RequestMapping( value = "/EditarMaterialArticulo/{materialArticuloID}", method = RequestMethod.GET)
	public String EditarMaterialArticulo_GET( Model model, @PathVariable("materialArticuloID") Integer ModeloArticuloID) {

	model.addAttribute("MaterialArticulo", materialService.FindByID(ModeloArticuloID));

	return "/Material/editar";
	}

	@RequestMapping( value = "/EditarMaterialArticulo/{materialArticuloID}", method = RequestMethod.POST)
	public String EditarMaterialArticulo_POST( TipoMaterialMontura materialArticulo ) {

		materialService.Update(materialArticulo);

	return "redirect:/MaterialArticulos";
	}

	@RequestMapping( value = "/EliminarMaterialArticulo/{MaterialArticuloID}", method = RequestMethod.GET)
	public String EliminarMaterialArticulo_GET( Model model, @PathVariable("MaterialArticuloID") Integer MaterialMonturaID) {

	model.addAttribute("MaterialArticulo", materialService.FindByID(MaterialMonturaID));

	return "/Material/eliminar";
	}

	@RequestMapping( value = "/EliminarMaterialArticulo/{MaterialArticuloID}", method = RequestMethod.POST)
	public String EliminarMaterialArticulo_POST( TipoMaterialMontura MaterialMontura ) {

		materialService.Delete(MaterialMontura.getCod_TipMaterial());

	return "redirect:/MaterialArticulos";
	}

}
