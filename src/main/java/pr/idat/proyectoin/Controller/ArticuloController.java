package pr.idat.proyectoin.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Service.ArticuloService;
import pr.idat.proyectoin.Service.ColorArticuloService;
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

	@Autowired
	private ColorArticuloService colorService;
	
	@RequestMapping(value = "/Articulo/Listar", method = RequestMethod.GET)
	public String listar_GET(Map map) {
		
		map.put("bArticulo", articuloService.FindAll());
		map.put("bMarcas", marcaService.FindAll());
		map.put("bModelos", modeloService.FindAll());
		map.put("bMateriales", materialService.FindAll());
		map.put("bColores", colorService.FindAll());
		map.put("mapPrecioMinimo", articuloService.minPrecio());
		map.put("mapPrecioMaximo", articuloService.maxPrecio());
		
		return "/Articulo/Listar";
	}

	@RequestMapping(value = "/Articulo/Listar/Filtro", method = RequestMethod.GET)
	public String listarPor(Map map, @RequestParam(name = "colores", required = false) List<String> colorList,
									 @RequestParam(name = "marcas", required = false) List<String> marcaList,
									 @RequestParam(name = "materiales", required = false) List<String> materialList,
									 @RequestParam(name = "modelos", required = false) List<String> modeloList,
									 @RequestParam(name = "minimo", required = false) Double precioMinimo,
									 @RequestParam(name = "maximo", required = false) Double precioMaximo) {

		map.put("bMarcas", marcaService.FindAll());
		map.put("bModelos", modeloService.FindAll());
		map.put("bMateriales", materialService.FindAll());
		map.put("bColores", colorService.FindAll());
		map.put("mapPrecioMinimo", articuloService.minPrecio());
		map.put("mapPrecioMaximo", articuloService.maxPrecio());
		
		return "/Articulo/Listar";
	}
	
	@RequestMapping(value = "/Articulo/Registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, Map map) {

		model.addAttribute("articulo", new Articulo());
		
		map.put("bMarca", marcaService.FindAll());
		map.put("bModelo", modeloService.FindAll());
		map.put("bMaterial", materialService.FindAll());
		map.put("bColores", colorService.FindAll());

		return "/Articulo/Registrar";
	}

	@RequestMapping(value = "/Articulo/Registrar", method = RequestMethod.POST)
	public String registrar_POST(@RequestPart("picture") MultipartFile picture, Articulo art) throws IOException {

		art.setImagen(picture.getBytes());

		articuloService.Insert(art);

		return "redirect:/Articulo/Listar";
	}

	@RequestMapping(value = "/Articulo/Detalle/{ArticuloID}", method = RequestMethod.GET)
	public String detalle_GET(Map map, @PathVariable("ArticuloID") Integer ArticuloID) {

		Articulo articuloModel = articuloService.FindByID(ArticuloID);
		
		map.put("Bimagen", articuloService.FindByID(ArticuloID));
		map.put("articulo", articuloModel);
		
		return "/Articulo/Detalle";
	}

	@RequestMapping(value = "/Articulo/Eliminar/{ArticuloID}", method = RequestMethod.GET)
	public String eliminar_GET(Model model, @PathVariable("ArticuloID") Integer ArticuloID) {

		model.addAttribute("Articulo", articuloService.FindByID(ArticuloID));

		return "/Articulo/Borrar";
	}

	@RequestMapping(value = "/Articulo/Eliminar", method = RequestMethod.GET)
	public @ResponseBody List<String> ValidarEliminar(Integer codigo) {

		List<String> result = new ArrayList<String>();
		
		if(articuloService.ValidarRelacion(codigo) == 0) {
			
			result.add("Exito");
			result.add("Se elimino correctamente el articulo de ID '" + codigo + "'");
			
			articuloService.Delete(codigo);
			
		}else {
			
			result.add("Error");
			result.add("No se pudo eliminar el articulo debido a que esta relacionado con pedidos");
		}
		return result;
	}

	@RequestMapping(value = "/Articulo/Editar/{ArticuloID}", method = RequestMethod.GET)
	public String editar_GET(Model model, Map map, @PathVariable("ArticuloID") Integer ArticuloID) {

		model.addAttribute("Articulo", articuloService.FindByID(ArticuloID));
		
		map.put("bMarca", marcaService.FindAll());
		map.put("bModelo", modeloService.FindAll());
		map.put("bMaterial", materialService.FindAll());
		map.put("bColores", colorService.FindAll());

		return "/Articulo/Editar";
	}

	@RequestMapping(value = "/Articulo/Editar/{ArticuloID}", method = RequestMethod.POST)
	public String editar_POST(Articulo articulo, @RequestPart("picture") MultipartFile picture) throws IOException {

		articulo.setImagen(picture.getBytes());
		
		articuloService.Update(articulo);

		return "redirect:/Articulo/Listar";
	}
}
