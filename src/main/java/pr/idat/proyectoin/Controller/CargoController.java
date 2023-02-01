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

import pr.idat.proyectoin.Entity.CargoEmpleado;
import pr.idat.proyectoin.Service.CargoEmpleadoService;

@Controller
public class CargoController {

	@Autowired
	private CargoEmpleadoService cargoempleadosService;

	@RequestMapping(value = "/CargoEmpleado/Listar", method = RequestMethod.GET)
	public String CargosEmpleadoGET(Map map) {

		map.put("bCargosEmpleado", cargoempleadosService.FindAll());

		return "/Cargo/Listar";
	}

	@RequestMapping(value = "/CargoEmpleado/Registrar", method = RequestMethod.GET)
	public String RegistrarCargosEmpleado_GET(Model model) {

		model.addAttribute("Cargo", new CargoEmpleado());
		
		return "/Cargo/Registrar";
	}

	@RequestMapping(value = "/CargoEmpleado/Registrar", method = RequestMethod.POST)
	public String RegistrarCargosEmpleado_POST(CargoEmpleado cargoEmpleado) {

		cargoempleadosService.Insert(cargoEmpleado);
		
		return "redirect:/CargoEmpleado/Listar";
	}

	@RequestMapping(value = "/CargoEmpleado/Editar/{CargoID}", method = RequestMethod.GET)
	public String EditarCargosEmpleado_GET(Model model, @PathVariable("CargoID") Integer CargoID) {

		model.addAttribute("Cargo", cargoempleadosService.FindByID(CargoID));

		return "/Cargo/Editar";
	}

	@RequestMapping(value = "/CargoEmpleado/Editar/{CargoID}", method = RequestMethod.POST)
	public String EditarCargosEmpleado_POST(CargoEmpleado cargoEmpleado) {

		cargoempleadosService.Update(cargoEmpleado);

		return "redirect:/CargoEmpleado/Listar";
	}

	@RequestMapping(value = "/CargoEmpleado/Eliminar/{CargoID}", method = RequestMethod.GET)
	public String EliminarCargosEmpleado_GET(Model model, @PathVariable("CargoID") Integer CargoID) {

		model.addAttribute("Cargo", cargoempleadosService.FindByID(CargoID));

		return "/Cargo/Borrar";
	}

	@RequestMapping(value = "/CargoEmpleado/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(cargoempleadosService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el cargo de ID '" + codigo + "'");
			
			cargoempleadosService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el cargo debido a que esta relacionado con empleados");
		}
		return result;
	}
}
