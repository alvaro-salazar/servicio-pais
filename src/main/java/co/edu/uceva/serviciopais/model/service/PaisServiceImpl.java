package co.edu.uceva.serviciopais.model.service;


import co.edu.uceva.serviciopais.model.dao.IPaisDao;
import co.edu.uceva.serviciopais.model.entities.Pais;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Esta clase implementa los metodos de la interfaz IPaisService
 */
@Service
public class PaisServiceImpl implements IPaisService {

    IPaisDao paisDao;   //Relacion de tipo composicion: paisDao Se encarga de realizar
                        // las operaciones CRUD de la entidad Pais

    @Autowired
    public PaisServiceImpl(IPaisDao paisDao) {
        this.paisDao = paisDao;
    }

    @Override
    public void delete(Pais pais) {
        paisDao.delete(pais);
    }

    @Override
    public List<Pais> findAll() {
        return (List<Pais>) paisDao.findAll();
    }

    @Override
    public Pais save(Pais pais) {
        return paisDao.save(pais);
    }

    @Override
    public Pais findById(Long id) {
        return paisDao.findById(id).orElse(null);
    }

    @Override
    public Pais update(Pais pais) {
        return paisDao.save(pais);
    }
}
