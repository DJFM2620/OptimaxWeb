package pr.idat.proyectoin.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import pr.idat.proyectoin.Entity.Distrito;

import pr.idat.proyectoin.Service.DistritoService;

@Controller
public class DistritoController {
	
	@Autowired
	private DistritoService distritoService;
	
	@RequestMapping(value = "/distrito_listar",method = RequestMethod.GET)
	public String listar_GET( Map map) {
		
		
		
		 map.put("bDistrito", distritoService.FindAll());
		return "/Distrito/listar";
	}
	
	@RequestMapping(value = "/distrito_registrar",method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		 model.addAttribute("Distrito", new Distrito());
		
		return "/Distrito/registrar";
	}
	
	@RequestMapping(value = "/distrito_registrar",method = RequestMethod.POST )
	public String registrar_POST(Distrito distrito) 
	{
		distritoService.Insert(distrito);
		return "redirect:/distrito_listar";
				
	}
	
	
	
	
}
