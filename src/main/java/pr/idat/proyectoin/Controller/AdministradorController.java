package pr.idat.proyectoin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdministradorController 
{
	
	
	@RequestMapping(value = "/administrador_principal",method = RequestMethod.GET)
	public String adminprincipal_GET()
	{

		return "Administrador/principal";
	}
}
