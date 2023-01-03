package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pr.idat.proyectoin.Entity.TipoModeloMontura;
import pr.idat.proyectoin.Service.TipoModeloMonturaService;

@Controller
public class ModeloController {

	@Autowired
	private TipoModeloMonturaService modeloArticuloService;

	@RequestMapping(value = "/Modelo/Listar", method = RequestMethod.GET)
	public String ListaModeloArticulo_GET(Map map) {

		map.put("bModelosArticulos", modeloArticuloService.FindAll());

		return "/Modelo/Listar";
	}

	@RequestMapping(value = "/Modelo/Registrar", method = RequestMethod.GET)
	public String RegistrarModeloArticulo_GET(Model model) {

		model.addAttribute("Modelo", new TipoModeloMontura());

		return "/Modelo/Registrar";
	}

	@RequestMapping(value = "/Modelo/Registrar", method = RequestMethod.POST)
	public String RegistrarModeloArticulo_POST(TipoModeloMontura modeloArticulo) {

		modeloArticuloService.Insert(modeloArticulo);

		return "redirect:/Modelo/Listar";
	}

	@RequestMapping(value = "/Modelo/Editar/{ModeloID}", method = RequestMethod.GET)
	public String EditarModeloArticulo_GET(Model model, @PathVariable("ModeloID") Integer ModeloID) {

		model.addAttribute("ModeloArticulo", modeloArticuloService.FindByID(ModeloID));

		return "/Modelo/Editar";
	}

	@RequestMapping(value = "/Modelo/Editar/{ModeloID}", method = RequestMethod.POST)
	public String EditarModeloArticulo_POST(TipoModeloMontura modeloArticulo) {

		modeloArticuloService.Update(modeloArticulo);

		return "redirect:/Modelo/Listar";
	}

	@RequestMapping(value = "/Modelo/Eliminar/{ModeloID}", method = RequestMethod.GET)
	public String EliminarModeloArticulo_GET(Model model, @PathVariable("ModeloID") Integer ModeloID) {

		model.addAttribute("ModeloArticulo", modeloArticuloService.FindByID(ModeloID));

		return "/Modelo/Eliminar";
	}

	@RequestMapping(value = "/Modelo/Eliminar/{ModeloID}", method = RequestMethod.POST)
	public String EliminarModeloArticulo_POST(TipoModeloMontura modeloArticulo) {

		modeloArticuloService.Delete(modeloArticulo.getCod_Modelo());

		return "redirect:/Modelo/Listar";
	}
}