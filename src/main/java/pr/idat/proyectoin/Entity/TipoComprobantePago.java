package pr.idat.proyectoin.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "tipocomprobantepagos")
public class TipoComprobantePago implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_tipcompago;
	
	@Column
	private String tipo;
	
	
	
	
	@OneToMany(mappedBy = "tipocomprobantepago")
	private Collection<ComprobantePago> itemsComprobantepago=new ArrayList<>();
	
	public TipoComprobantePago() {
		// TODO Auto-generated constructor stub
	}



	public Integer getCod_tipcompago() {
		return cod_tipcompago;
	}



	public void setCod_tipcompago(Integer cod_tipcompago) {
		this.cod_tipcompago = cod_tipcompago;
	}



	public String getTipo() {
		return tipo;
	}



	public void setTipo(String tipo) {
		this.tipo = tipo;
	}



	public TipoComprobantePago(Integer cod_tipcompago, String tipo) {
		super();
		this.cod_tipcompago = cod_tipcompago;
		this.tipo = tipo;
	}
	
	
	
}
