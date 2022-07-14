package pr.idat.proyectoin.Controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.MarcaMonturaService;
import pr.idat.proyectoin.Service.TipoMaterialMonturaService;
import pr.idat.proyectoin.Service.TipoModeloMonturaService;

@Controller
public class ArticuloController {

	@Autowired
	private ArticuloService articuloService;
	@Autowired
	private MarcaMonturaService marcaService;
	@Autowired
	private TipoModeloMonturaService modeloService;
	@Autowired
	private TipoMaterialMonturaService materialService;
	
	
	@RequestMapping(value = "/articulo_listar",method = RequestMethod.GET)
	public String listar_GET(Map map) {
		
		map.put("bArticulo",articuloService.FindAll());
		
		return "/Articulo/listar";
	}
		
	@RequestMapping(value = "/articulo_registrar",method = RequestMethod.GET)	
	public String registrar_GET(Model model,Map map) {
		
		model.addAttribute("articulo", new Articulo());
		map.put("bMarca", marcaService.FindAll());
		map.put("bModelo",modeloService.FindAll());
		map.put("bMaterial",materialService.FindAll());	
		
		return "/Articulo/registrar";
	}
	@RequestMapping(value = "/articulo_registrar",method = RequestMethod.POST)
	public String registrar_POST(@RequestPart("picture")MultipartFile picture,Articulo art) throws IOException 
	{
		
		
		art.setImagen(picture.getBytes());
		
		articuloService.Insert(art);
		
		return "redirect:/articulo_listar";
	}
	@RequestMapping(value = "/detallearticulo/{codigoarticulo}",method = RequestMethod.GET)
	public String detalle_GET(Map map,@PathVariable("codigoarticulo") Integer articuloID ) {
		
		map.put("Bimagen", articuloService.FindByID(articuloID));
		Articulo articuloModel=articuloService.FindByID(articuloID);
		map.put("articulo", articuloModel);
		return "/Articulo/detalle";
	}
	@RequestMapping(value = "/articulo_borrar/{cod_articulo}",method =RequestMethod.GET )
	public String borrar_GET(Model model, @PathVariable("cod_articulo") Integer cod_articulo) {
		
		model.addAttribute("Articulo",articuloService.FindByID(cod_articulo));
		
		return "Articulo/borrar";
	}
	
	@RequestMapping(value = "/articulo_borrar/{cod_articulo}",method =RequestMethod.POST )
	public String borrar_POST(Articulo articulo) {
		
		articuloService.Delete(articulo.getCodArticulo());
		
		return "redirect:/articulo_listar";
	}
	@RequestMapping(value = "/articulo_editar/{cod_articulo}",method = RequestMethod.GET)	
	public String editar_GET(Model model,Map map, @PathVariable("cod_articulo") Integer cod_articulo) {
		
		model.addAttribute("Articulo",articuloService.FindByID(cod_articulo));
		map.put("bMarca", marcaService.FindAll());
		map.put("bModelo",modeloService.FindAll());
		map.put("bMaterial",materialService.FindAll());	
		
		return "/Articulo/editar";
	}
	@RequestMapping(value = "/articulo_editar/{cod_articulo}",method = RequestMethod.POST)	
	public String editar_POST(Articulo articulo,@RequestPart("picture")MultipartFile picture)throws IOException  {
		
		articulo.setImagen(picture.getBytes());
		articuloService.Update(articulo);
		
		return "redirect:/articulo_listar";
	}
	
}
