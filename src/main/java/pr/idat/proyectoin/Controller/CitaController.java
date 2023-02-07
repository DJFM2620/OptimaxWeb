package pr.idat.proyectoin.Controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pr.idat.proyectoin.Entity.Cita;
import pr.idat.proyectoin.Entity.Cliente;
import pr.idat.proyectoin.Service.CitaService;
import pr.idat.proyectoin.Service.ClienteService;
import pr.idat.proyectoin.Service.DistritoService;

@Controller
public class CitaController {
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private DistritoService distritoService;
	
	@Autowired
	private CitaService citaService;

	@RequestMapping(value = "/Cita/Listar", method = RequestMethod.GET)
	public String listarcitas(Map map) {

		map.put("bCitas", citaService.FindAll());

		return "/Cita/Listar";
	}
	
	@RequestMapping(value = "/Cita/Listar/Dni", method = RequestMethod.GET)
	public @ResponseBody Collection<Cita> ListarCitasDni(Integer dni){

		Collection<Cita> cita = citaService.CitasCliente(dni);
        
        return cita;
	}
	
	@RequestMapping(value = "/Cita", method = RequestMethod.GET)
	public String cita_GET(Map map) {

		map.put("bDistritos", distritoService.FindAll());

		return "/Cita/Registrar";
	}

	@RequestMapping(value = "/Cita", method = RequestMethod.POST)
	public String cita_POST(@RequestParam("nombrecliente") String nombrecliente,
			@RequestParam("apellidopcliente") String apellidopcliente,
			@RequestParam("apellidomcliente") String apellidomcliente,
			@RequestParam("emailcliente") String emailcliente, @RequestParam("dnicliente") Integer dnicliente,
			@RequestParam("celularcliente") Integer celularcliente, @RequestParam("namedistrito") Integer namedistrito,
			@RequestParam("mescliente") String mescliente, @RequestParam("horacliente") String horacliente) {

		if (clienteService.ExistenciaCliente(dnicliente) == 1) {

			LocalDate date = LocalDate.parse(mescliente);
			LocalTime time = LocalTime.parse(horacliente);

			Cita cita = new Cita();

			cita.setFecha(date);	
			cita.setHora(time);
			cita.setCliente(clienteService.FindByID(clienteService.ObtenerCodigoCliente(dnicliente)));

			citaService.Insert(cita);
		} else {

			Cliente cliente = new Cliente();

			cliente.setNombres(nombrecliente);
			cliente.setApellidop(apellidopcliente);
			cliente.setApellidom(apellidomcliente);
			cliente.setCelular(celularcliente);
			cliente.setEmail(emailcliente);
			cliente.setDni(dnicliente);
			cliente.setDistrito(distritoService.FindByID(namedistrito));

			clienteService.Insert(cliente);

			LocalDate date = LocalDate.parse(mescliente);
			LocalTime time = LocalTime.parse(horacliente);

			Cita cita = new Cita();

			cita.setFecha(date);
			cita.setHora(time);
			cita.setCliente(cliente);

			citaService.Insert(cita);
		}

		return "redirect:/Principal";
	}
	
	@RequestMapping(value = "/MisCitas", method = RequestMethod.GET)
	public String citas(Map map) {
		
		return "/Cita/Citas";
	}

	@RequestMapping(value = "/Cita/Dni", method = RequestMethod.GET)
	public @ResponseBody Collection<Cita> CitasDni_Cliente(Integer dni){

		Collection<Cita> cita = citaService.CitasCliente(dni);
        
        return cita;
	}
}
