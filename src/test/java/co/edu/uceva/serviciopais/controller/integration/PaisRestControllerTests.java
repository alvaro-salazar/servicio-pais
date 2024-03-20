package co.edu.uceva.serviciopais.controller.integration;

import co.edu.uceva.serviciopais.model.entities.Pais;
import co.edu.uceva.serviciopais.model.service.IPaisService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.hamcrest.Matchers.is;


/**
 * Integration Test del controlador PaisRestController
  */
@RunWith(SpringRunner.class)
@SpringBootTest
public class PaisRestControllerTests {

    @Autowired
    WebApplicationContext wac; //WebApplicationContext es un contenedor de beans web como servlets y filtros.

    MockMvc mockMvc; // MockMvc es una clase que se utiliza para simular las solicitudes HTTP y probar controladores
                     // y endpoints sin necesidad de un navegador web en una prueba de integración.

    @Autowired
    IPaisService paisService;

    /**
     * Inicializa los objetos necesarios para la prueba. En el ejemplo de código dado, este método se utiliza para
     * inicializar el objeto MockMvc, que se utiliza para simular el envío de solicitudes HTTP en la prueba de la
     * clase PaisRestController.
     */
    @Before
    public void setUp() {
        // Inicializa el objeto MockMvc, que se utiliza para simular el envío de solicitudes HTTP en la prueba de la
        // clase PaisRestController.
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }

    /**
     * Prueba del método GET "/api/pais-service/hola/{nombre}", que comprueba que se recibe un saludo.
     * @throws Exception Se lanza una excepción si no devuelve el saludo correcto.
     */
    @Test
    public void holaMundoTest() throws Exception{
        String nombre = "Mundo"; // Se define el nombre que se va a enviar en la solicitud.
        this.mockMvc.perform(MockMvcRequestBuilders.get("/api/pais-service/hola/{nombre}", nombre))
                .andExpect(MockMvcResultMatchers.status().isOk()) // Se espera que el estado de la respuesta sea OK.
                .andExpect(MockMvcResultMatchers.content().string("Hola " + nombre));
                // Se espera que el contenido de la respuesta sea "Hola " + nombre.
    }


    /**
     * Prueba del método GET "/api/pais-service/paises", que comprueba que se recibe una lista de paises.
     * @throws Exception Se lanza una excepción si no devuelve la lista de paises correcta.
     */
    @Test
    public void buscarPaisTest() throws Exception{
        // Se crea un objeto de tipo Pais y se le asignan valores a sus atributos.
        Pais miPais = new Pais();
        miPais.setPais("Japon");
        miPais.setCapital("Tokio");
        miPais.setContinente("Asia");
        miPais = paisService.save(miPais); // Se guarda el pais en la base de datos.

        // Se realiza una solicitud GET al endpoint "/api/pais-service/paises/{id}" y se espera que el estado de la
        // respuesta sea OK.
        this.mockMvc.perform(MockMvcRequestBuilders.get("/api/pais-service/paises/{id}", miPais.getId()))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(jsonPath("$.pais", is(miPais.getPais())));

        // Se elimina el pais de la base de datos.
        paisService.delete(miPais);
    }
}
