package co.edu.uceva.serviciopais.controller.unit;

import co.edu.uceva.serviciopais.controller.PaisRestController;
import co.edu.uceva.serviciopais.model.entities.Pais;
import co.edu.uceva.serviciopais.model.service.IPaisService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Unit Test del controlador PaisRestController
 */
@RunWith(SpringRunner.class) // @RunWith(SpringRunner) indica que se va a utilizar el runner de pruebas SpringRunner.
public class PaisRestControllerTests {

    private MockMvc mockMvc; // MockMvc se utiliza para simular las solicitudes HTTP y probar controladores
                             // y endpoints sin necesidad de un navegador web en una prueba unitaria.

    @Mock // @Mock se utiliza para crear un objeto simulado de la clase IPaisService.
    private IPaisService paisService;

    @InjectMocks // @InjectMocks inyecta el objeto simulado de clase IPaisService en el controlador PaisRestController.
    private PaisRestController paisRestController;

    @Before  // @Before se utiliza para inicializar los objetos necesarios para la prueba.
    public void setup() {
        mockMvc = MockMvcBuilders.standaloneSetup(paisRestController).build();
    }

    @Test // @Test se utiliza para indicar que el método es una prueba.
    public void holaMundo_returnsSaludo() throws Exception {
        String nombre = "Juan";
        mockMvc.perform(get("/api/pais-service/hola/{nombre}", nombre))
                .andExpect(status().isOk())
                .andExpect(content().string("Hola Juan"));
    }

    @Test
    public void listar_returnsListaPaises() throws Exception {
        Pais pais1 = new Pais();
        Pais pais2 = new Pais();
        pais1.setPais("Colombia");
        pais2.setPais("Argentina");
        pais1.setContinente("América");
        pais2.setContinente("América");
        pais1.setCapital("Bogotá");
        pais2.setCapital("Buenos Aires");
        List<Pais> todosLosPaises = Arrays.asList(pais1, pais2);

        when(paisService.findAll()).thenReturn(todosLosPaises);

        mockMvc.perform(get("/api/pais-service/paises"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].pais", is("Colombia")))
                .andExpect(jsonPath("$[1].pais", is("Argentina")));

        verify(paisService).findAll();
    }

    @Test
    public void buscarPais_returnsPais() throws Exception {
        Pais pais = new Pais();
        pais.setPais("Chile");
        pais.setCapital("Santiago");
        pais.setContinente("América");

        when(paisService.findById(1L)).thenReturn(pais);

        mockMvc.perform(get("/api/pais-service/paises/{id}", 1L))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.pais", is("Chile")))
                .andExpect(jsonPath("$.capital", is("Santiago")))
                .andExpect(jsonPath("$.continente", is("América")));

        verify(paisService).findById(1L);
    }
}
