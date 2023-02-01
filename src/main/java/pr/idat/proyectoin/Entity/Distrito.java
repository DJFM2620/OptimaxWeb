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
@Table(name="distritos")
public class Distrito implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cod_distrito;
	
	@Column
	private String nombredistr;

	
	@OneToMany(mappedBy = "distrito")
	private Collection<Cliente> itemsCliente = new ArrayList<>();
	
	
	public Distrito() {
	}

	public Distrito(Integer cod_distrito, String nombredistr) {
		super();
		this.cod_distrito = cod_distrito;
		this.nombredistr = nombredistr;
	}

	public Integer getCod_distrito() {
		return cod_distrito;
	}

	public void setCod_distrito(Integer cod_distrito) {
		this.cod_distrito = cod_distrito;
	}

	public String getNombredistr() {
		return nombredistr;
	}

	public void setNombredistr(String nombredistr) {
		this.nombredistr = nombredistr;
	}
}
