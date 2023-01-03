package pr.idat.proyectoin.Dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import pr.idat.proyectoin.Entity.Articulo;
import pr.idat.proyectoin.Entity.MarcaMontura;
import pr.idat.proyectoin.Entity.TipoMaterialMontura;
import pr.idat.proyectoin.Entity.TipoModeloMontura;

public class ArticuloSpecification implements Specification<Articulo> {

	private static final long serialVersionUID = 1L;

	private List<String> Color;

	private List<Integer> tipoMaterialMontura;

	private List<Integer> tipoModeloMontura;

	private List<Integer> marcaMontura;

	public ArticuloSpecification(List<String> color, List<Integer> tipoMaterialMontura, List<Integer> tipoModeloMontura,
			List<Integer> marcaMontura) {
		super();
		Color = color;
		this.tipoMaterialMontura = tipoMaterialMontura;
		this.tipoModeloMontura = tipoModeloMontura;
		this.marcaMontura = marcaMontura;
	}

	@Override
	public Predicate toPredicate(Root<Articulo> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {

		List<Predicate> predicates = new ArrayList<>();

		if (Color != null) {
			predicates.add(criteriaBuilder.equal(root.get("Color"), Color));
		}

		if (marcaMontura != null) {
			predicates.add(criteriaBuilder.equal(root.get("marcaMontura"), marcaMontura));
		}

		if (tipoMaterialMontura != null) {
			predicates.add(criteriaBuilder.equal(root.get("tipoMaterialMontura"), tipoMaterialMontura));
		}

		if (tipoModeloMontura != null) {
			predicates.add(criteriaBuilder.equal(root.get("tipoModeloMontura"), tipoModeloMontura));
		}

		return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
	}
}
