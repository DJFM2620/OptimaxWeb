package pr.idat.proyectoin.Repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pr.idat.proyectoin.Entity.Empleado;

public interface EmpleadoRepository extends JpaRepository<Empleado, Integer>{

	@Query(value="select cod_empleado from empleados where email=:empleadoemail and dni=:empleadodni",nativeQuery=true)
	public abstract Integer validaciondatoslogin(@Param("empleadoemail")String email,@Param("empleadodni") Integer dni);
	
	@Query(value="select cod_cargoemp from empleados where email=:empleadoemail and dni=:empleadodni",nativeQuery=true)
	public abstract Integer validarcargo(@Param("empleadoemail")String email,@Param("empleadodni") Integer dni);
	
	@Query(value="select * from empleados where cod_cargoemp=1",nativeQuery=true)
	public abstract Collection<Empleado> buscardoctores();
}
