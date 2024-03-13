package co.edu.uceva.serviciopais.model.service;

import co.edu.uceva.serviciopais.model.entities.Pais;

import java.util.List;

/**
 * Esta interfaz define los metodos abstractos que se van a implementar en la clase PaisServiceImpl
 */
public interface IPaisService {
    void delete(Pais pais); //Elimina un pais de la base de datos
    List<Pais> findAll(); //Devuelve una lista de todos los paises
    Pais save(Pais pais); //Guarda un pais y me retorna un objeto de tipo Pais
    Pais findById(Long id); //Busca un pais por su id y me retorna un objeto de tipo Pais
    Pais update(Pais pais); //Actualiza un pais y me retorna un objeto de tipo Pais
}
