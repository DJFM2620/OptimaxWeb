package pr.idat.proyectoin.Controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DistritoService;
import pr.idat.proyectoin.Service.EmpleadoService;

@Controller
public class PrincipalController {

	@Autowired
	private EmpleadoService empleadoService;
	
	@Autowired
	private ClienteService clienteService;

	@Autowired
	private DistritoService distritoService;
	
	@Autowired
	private ArticuloService articuloService;
	
	@RequestMapping(value = "/Principal", method = RequestMethod.GET)
	public String principal(Map map) {

		String mes = Integer.toString(LocalDate.now().getMonth().getValue());
		Collection<Articulo> list = new ArrayList<>();
		
		for (int i = 0; i < articuloService.Better_Selling(mes).size(); i++) {
			
			int cod = (int) articuloService.Better_Selling(mes).get(i).get("COD_ARTICULO");

			Articulo art = articuloService.FindByID(cod);
			
			list.add(art);
		}
		
		map.put("bArticles", list);
		
		return "/Principal";
	}

	@RequestMapping(value="/Login/Registrar", method = RequestMethod.GET)
	public String RegistroCliente(Model model, Map map) {
		
		model.addAttribute("Cliente", new Cliente());
		
		map.put("bDistrito", distritoService.FindAll());
		
		return "/Cliente/Login_Registrar";
	}
	
	@RequestMapping(value = "/Login/Validar", method = RequestMethod.GET)
	public @ResponseBody String ValidarLogin(String email, Integer dni) {

		String result = "";
		
		if (clienteService.validacioncliente(email, dni) == 1) {

			result = "Cliente";
			//return "redirect:/Principal";

		} else {
			if (empleadoService.validarcargo(email, dni) == 3) {
				
				result = "Admin";
				
			}else if (empleadoService.validarcargo(email, dni) == 4) {

				result = "Recepcionista";
				
			}else if (empleadoService.validarcargo(email, dni) == 2) {
				
				result = "JefeVentas";
				
			}else {

				result = "Lo sentimos, los datos de inicio de sesión que has ingresado no son correctos. Por favor, verifica tus credenciales e inténtalo de nuevo.";
				//return "redirect:/Principal";
			}
		}
		return result;
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
