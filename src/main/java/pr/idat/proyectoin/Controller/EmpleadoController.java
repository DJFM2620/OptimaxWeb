package pr.idat.proyectoin.Controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import pr.idat.proyectoin.Entity.Empleado;
import pr.idat.proyectoin.Service.CargoEmpleadoService;
import pr.idat.proyectoin.Service.EmpleadoService;

@Controller
public class EmpleadoController {

	@Autowired
	private EmpleadoService empleadoService;
	
	@Autowired
	private CargoEmpleadoService cargoempleadoService;
	
	
	@RequestMapping(value = "/empleado_registrar",method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		 model.addAttribute("Empleado", new Empleado());
		 map.put("bCargo", cargoempleadoService.FindAll());
		return "/Empleado/registrar";
	}
	
	@RequestMapping(value = "/empleado_registrar",method = RequestMethod.POST)
	public String registrar_POST(Empleado empleado) {
		

		 empleadoService.Insert(empleado);
		
		
		return "redirect:/empleado_listado";
	}
	
	
	@RequestMapping(value = "/empleado_listado",method = RequestMethod.GET)
	public String listado_GET(Empleado empleado,Map map) {
		
		map.put("bEmpleado", empleadoService.FindAll());
		
		
		
		return "/Empleado/listar";
		
	}
	@RequestMapping(value = "/empleado_login",method = RequestMethod.GET)
	public String empleadologin_GET() {
		
		
		return "/Empleado/login";
		
	}
	
	@RequestMapping(value = "/empleado_editar/{empleadoID}", method = RequestMethod.GET)
	public String editar_GET(Map map,Model model,@PathVariable("empleadoID")Integer empleadoID) {
		
		Empleado empleadomodel=empleadoService.FindByID(empleadoID);
		
		model.addAttribute("Empleado", empleadomodel);
		map.put("bCargo", cargoempleadoService.FindAll());
		
		return  "/Empleado/editar";
	}
	
	@RequestMapping(value = "/empleado_editar/{empleadoID}",method = RequestMethod.POST)
	public String editar_POST(Empleado empleado) {
		
		
		empleadoService.Update(empleado);
		
		
		return "redirect:/empleado_listado";
	}
	
	@RequestMapping( value = "/empleado_eliminar/{empleadoID}", method = RequestMethod.GET)
	public String Eliminar_GET( Model model, @PathVariable("empleadoID") Integer empleadoID) {

	model.addAttribute("Empleado", empleadoService.FindByID(empleadoID));

	return "/Empleado/borrar";
	}

	@RequestMapping( value = "/empleado_eliminar/{empleadoID}", method = RequestMethod.POST)
	public String Eliminarcliente_POST( Empleado empleado ) {

		empleadoService.Delete(empleado.getCod_empleado());

	return "redirect:/cliente_listar";
	}
	
	
	
}
