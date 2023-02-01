package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pr.idat.proyectoin.Entity.EstadoPedido;

public interface EstadoRepository extends JpaRepository<EstadoPedido, Integer>{

	
}
