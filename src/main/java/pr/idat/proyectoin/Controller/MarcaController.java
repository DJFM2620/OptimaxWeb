package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pr.idat.proyectoin.Entity.MarcaMontura;
import pr.idat.proyectoin.Service.MarcaMonturaService;

@Controller
public class MarcaController {
	
	@Autowired
	private MarcaMonturaService marcamonturaService;

	@RequestMapping( value = "/MarcasArticulos", method = RequestMethod.GET)
	public String ListaMarcasArticulos_GET( Map map) {

	map.put("bMarcas", marcamonturaService.FindAll());

	return "/Marca/MarcasArticulos";
	}

	@RequestMapping( value = "/RegistrarMarcaArticulo", method = RequestMethod.GET)
	public String RegistrarMarcaArticulo_GET( Model model ) {

	model.addAttribute("MarcaArticulo", new MarcaMontura());

	return "/Marca/RegistrarMarcaArticulo";
	}

	@RequestMapping( value = "/RegistrarMarcaArticulo", method = RequestMethod.POST)
	public String RegistrarMarcaArticulo_POST( MarcaMontura marcaArticulo ) {

		marcamonturaService.Insert(marcaArticulo);

	return "redirect:/MarcasArticulos";
	}

	@RequestMapping( value = "/EditarMarcaArticulo/{MarcaArticuloID}", method = RequestMethod.GET)
	public String EditarMarcaArticulo_GET( Model model, @PathVariable("MarcaArticuloID") Integer MarcaArticuloID) {

	model.addAttribute("MarcaArticulo", marcamonturaService.FindByID(MarcaArticuloID));

	return "/Marca/EditarMarcaArticulo";
	}

	@RequestMapping( value = "/EditarMarcaArticulo/{MarcaArticuloID}", method = RequestMethod.POST)
	public String EditarMarcaArticulo_POST( MarcaMontura marcaArticulo ) {

		marcamonturaService.Update(marcaArticulo);

	return "redirect:/MarcasArticulos";
	}

	@RequestMapping( value = "/EliminarMarcaArticulo/{MarcaArticuloID}", method = RequestMethod.GET)
	public String EliminarMarcaArticulo_GET( Model model, @PathVariable("MarcaArticuloID") Integer MarcaArticuloID) {

	model.addAttribute("MarcaArticulo", marcamonturaService.FindByID(MarcaArticuloID));

	return "/Marca/EliminarMarcaArticulo";
	}

	@RequestMapping( value = "/EliminarMarcaArticulo/{MarcaArticuloID}", method = RequestMethod.POST)
	public String EliminarMarcaArticulo_POST( MarcaMontura marcaArticulo ) {

		marcamonturaService.Delete(marcaArticulo.getCod_Marca());

	return "redirect:/MarcasArticulos";
	}
	
	
}
