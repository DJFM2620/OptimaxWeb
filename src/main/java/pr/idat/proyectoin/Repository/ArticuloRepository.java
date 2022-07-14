package pr.idat.proyectoin.Repository;


import org.springframework.data.jpa.repository.JpaRepository;



import pr.idat.proyectoin.Entity.Articulo;

public interface ArticuloRepository extends JpaRepository<Articulo, Integer> {
	
	
}
