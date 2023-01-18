package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.EmpleadoService;

@Controller
public class PrincipalController {

	@Autowired
	private EmpleadoService empleadoService;
	
	@Autowired
	private ClienteService clienteService;

	@RequestMapping(value = "/Principal", method = RequestMethod.GET)
	public String login() {

		return "/Principal";
	}

	@RequestMapping(value = "/validarempleado/{emailId}/{dniId}", method = RequestMethod.GET)
	public String validarempleado(Map map, @PathVariable("emailId") String email, @PathVariable("dniId") Integer dni) {
		if (clienteService.validacioncliente(email, dni) == 1) {

			return "redirect:/Principal";

		} else {
			if (empleadoService.validarcargo(email, dni) == 3) {
				
				return "/Administrador/Principal";
				
			} else if (empleadoService.validarcargo(email, dni) == 4) {

				return "/Recepcionista/Principal";
			}
			if (empleadoService.validarcargo(email, dni) == 2) {
				
				return "/JefedeVentas/Principal";
			}else {

				return "redirect:/Principal";
			}
		}
	}

	@RequestMapping(value = "/Recepcionista/Principal", method = RequestMethod.GET)
	public String citas(Map map) {

		return "/Recepcionista/Principal";
	}

	@RequestMapping(value = "/JefeVentas/Principal", method = RequestMethod.GET)
	public String listarpedido() {

		return "/JefeVentas/Principal";
	}
}
