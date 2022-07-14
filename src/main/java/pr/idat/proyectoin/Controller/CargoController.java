package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pr.idat.proyectoin.Entity.CargoEmpleado;
import pr.idat.proyectoin.Service.CargoEmpleadoService;

@Controller
public class CargoController {

	@Autowired 
	private CargoEmpleadoService cargoempleadosService;
	
	
	
	@RequestMapping( value = "/CargosEmpleados", method = RequestMethod.GET)
	public String CargosEmpleadoGET(Map map) {
	map.put("bCargosEmpleado", cargoempleadosService.FindAll() );

	 return "/Cargo/listar";
	}

	@RequestMapping( value = "/RegistrarCargoEmpleado", method = RequestMethod.GET)
	public String RegistrarCargosEmpleado_GET(Model model) {

	 model.addAttribute("Cargo", new CargoEmpleado());
	return "/Cargo/registrar";
	}

	@RequestMapping( value = "/RegistrarCargoEmpleado", method = RequestMethod.POST)
	public String RegistrarCargosEmpleado_POST(CargoEmpleado cargoEmpleado) {

	cargoempleadosService.Insert(cargoEmpleado);
	return "redirect:/CargosEmpleados";
	}

	@RequestMapping( value = "/EditarCargoEmpleado/{cod_cargoemp}", method = RequestMethod.GET)
	public String EditarCargosEmpleado_GET(Model model, @PathVariable("cod_cargoemp") Integer CodCargoEmp) {

	 model.addAttribute("Cargo", cargoempleadosService.FindByID(CodCargoEmp));

	 return "/Cargo/Editar";
	}

	@RequestMapping( value = "/EditarCargoEmpleado/{cod_cargoemp}", method = RequestMethod.POST)
	public String EditarCargosEmpleado_POST(CargoEmpleado cargoEmpleado) {

	cargoempleadosService.Update(cargoEmpleado);

	 return "redirect:/CargoEmpleados";
	}

	@RequestMapping( value = "/EliminarCargoEmpleado/{cod_cargoemp}", method = RequestMethod.GET)
	public String EliminarCargosEmpleado_GET(Model model, @PathVariable("cod_cargoemp") Integer CodCargoEmp) {
		
		
	model.addAttribute("Cargo", cargoempleadosService.FindByID(CodCargoEmp));

	 return "/Cargo/Eliminar";
	}

	@RequestMapping( value = "/EliminarCargoEmpleado/{cod_cargoemp}", method = RequestMethod.POST)
	public String EliminarCargosEmpleado_POST(CargoEmpleado cargoEmpleado) {

		cargoempleadosService.Delete(cargoEmpleado.getCod_cargoemp());

	 return "redirect:/CargoEmpleados";
	}
}
