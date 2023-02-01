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

import pr.idat.proyectoin.Entity.Empleado;
import pr.idat.proyectoin.Service.CargoEmpleadoService;
import pr.idat.proyectoin.Service.EmpleadoService;

@Controller
public class EmpleadoController {

	@Autowired
	private EmpleadoService empleadoService;

	@Autowired
	private CargoEmpleadoService cargoempleadoService;

	@RequestMapping(value = "/Empleado/Listar", method = RequestMethod.GET)
	public String listado_GET(Empleado empleado, Map map) {

		map.put("bEmpleado", empleadoService.FindAll());

		return "/Empleado/Listar";
	}

	@RequestMapping(value = "/Empleado/Registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		model.addAttribute("Empleado", new Empleado());
		
		map.put("bCargo", cargoempleadoService.FindAll());
		
		return "/Empleado/Registrar";
	}

	@RequestMapping(value = "/Empleado/Registrar", method = RequestMethod.POST)
	public String registrar_POST(Empleado empleado) {

		empleadoService.Insert(empleado);

		return "redirect:/Empleado/Listar";
	}

	@RequestMapping(value = "/Empleado/Editar/{EmpleadoID}", method = RequestMethod.GET)
	public String editar_GET(Map map, Model model, @PathVariable("EmpleadoID") Integer EmpleadoID) {

		Empleado empleadomodel = empleadoService.FindByID(EmpleadoID);

		model.addAttribute("Empleado", empleadomodel);
		
		map.put("bCargo", cargoempleadoService.FindAll());

		return "/Empleado/Editar";
	}

	@RequestMapping(value = "/Empleado/Editar/{EmpleadoID}", method = RequestMethod.POST)
	public String editar_POST(Empleado empleado) {

		empleadoService.Update(empleado);

		return "redirect:/Empleado/Listar";
	}

	@RequestMapping(value = "/Empleado/Eliminar/{EmpleadoID}", method = RequestMethod.GET)
	public String Eliminar_GET(Model model, @PathVariable("EmpleadoID") Integer EmpleadoID) {

		model.addAttribute("Empleado", empleadoService.FindByID(EmpleadoID));

		return "/Empleado/Borrar";
	}

	@RequestMapping(value = "/Empleado/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(empleadoService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el empleado de ID '" + codigo + "'");
			
			empleadoService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el empleado debido a que esta relacionado con comprobantes de pago");
		}
		return result;
	}
}
