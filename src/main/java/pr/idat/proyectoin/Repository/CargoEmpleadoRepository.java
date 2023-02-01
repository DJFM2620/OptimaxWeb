package pr.idat.proyectoin.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.CargoEmpleado;

public interface CargoEmpleadoRepository extends JpaRepository<CargoEmpleado, Integer>{

	@Query(value = "SELECT count(*) FROM EMPLEADOS WHERE COD_CARGOEMP = :codCargo ", nativeQuery = true)
	public abstract Integer CountCargoEmpleado(@Param("codCargo") Integer codCargo);
}