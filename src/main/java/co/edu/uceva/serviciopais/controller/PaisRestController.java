package co.edu.uceva.serviciopais.controller;


import co.edu.uceva.serviciopais.model.entities.Pais;
import co.edu.uceva.serviciopais.model.service.IPaisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Esta clase se encarga de exponer los servicios rest de la entidad pais y se mapea con la url /api/pais-service
 */
@RestController
@RequestMapping("/api/pais-service")
public class PaisRestController {

    private IPaisService paisService;

    /**
     * Constructor de la clase PaisRestController
     * @param paisService servicio de la entidad pais para realizar las operaciones CRUD que se inyecta con Autowired
     */
    @Autowired
    public PaisRestController(IPaisService paisService) {
        this.paisService = paisService;
    }

    /**
     * Este metodo se encarga de retornar un saludo con el nombre que se le pase por parametro
     * @param nombre nombre que se le pasa por parametro
     * @return retorna un saludo con el nombre que se le pasa por parametro
     */
    @GetMapping("/hola/{nombre}")
    public String holaMundo(@PathVariable String nombre) {
        return "Hola  " + nombre;
    }

    /**
     * Este metodo se encarga de retornar una lista de todos los paises
     * @return retorna una lista de todos los paises
     */
    @GetMapping("/paises")
    public List<Pais> listar() {
        return this.paisService.findAll();
    }


    /**
     * Este metodo se encarga de retornar un pais por su id
     * @param id id del pais a buscar
     * @return retorna un pais por su id
     */
    @GetMapping("/paises/{id}")
    public Pais buscarPais(@PathVariable Long id) {
        return this.paisService.findById(id);
    }

    /**
     * Este metodo se encarga de guardar un pais
     * @param pais pais a guardar
     * @return retorna el pais guardado
     */
    @PostMapping("/pais")
    public Pais guardarPais(@RequestBody Pais pais) {
        return this.paisService.save(pais);
    }

    /**
     * Este metodo se encarga de actualizar un pais
     * @param pais pais a actualizar
     * @return retorna el pais actualizado
     */
    @PutMapping("/pais")
    public Pais actualizarPais(@RequestBody Pais pais) {
        return this.paisService.save(pais);
    }

    /**
     * Este metodo se encarga de eliminar un pais por su id
     * @param id id del pais a eliminar
     */
    @DeleteMapping("/paises/{id}")
    public void eliminarPais(@PathVariable Long id) {
        Pais pais = this.paisService.findById(id);
        this.paisService.delete(pais);
    }
}
