package co.edu.uceva.serviciopais.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;


/**
 * La clase SecurityConfig es responsable de la configuración de seguridad de la aplicación.
 * Utiliza la anotación @Configuration para indicar que es una clase de configuración.
 * La anotación @EnableWebSecurity habilita la seguridad web en el proyecto. (configuración de seguridad de Spring Security)
 * La anotación @EnableMethodSecurity habilita la seguridad a nivel de método (autorización basada en anotaciones).
 *
 * Esta clase inyecta una instancia de JwtAuthenticationConverter, que se utiliza para convertir un token JWT en un objeto de autenticación.
 *
 * El método filterChain(HttpSecurity http) configura la seguridad de la aplicación y protege los servicios REST.
 * Deshabilita CSRF, permite el acceso a ciertas URL, requiere autenticación para cualquier otra URL,
 * configura el servidor de recursos OAuth2 para proteger los servicios REST y establece la política de creación de sesiones como STATELESS.
 */
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    // Se inyecta el bean JwtAuthenticationConverter que se encarga de convertir el token jwt en un objeto de autenticacion
    @Autowired
    private final JwtAuthenticationConverter jwtAuthenticationConverter;

    /**
     * Este metodo se encarga de configurar la seguridad de la aplicacion y proteger los servicios rest
     * @param http objeto de la clase HttpSecurity que se encarga de configurar la seguridad de la aplicacion
     * @return retorna una cadena de filtros de seguridad que se encargan de proteger la aplicacion
     * @throws Exception lanza una excepcion si ocurre un error al configurar la seguridad de la aplicacion
     */
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers(HttpMethod.GET, "/api/pais-service/hola/*").permitAll() // Se permite el acceso a la url /api/pais-service/hola/*
                        .anyRequest().authenticated()) // Se requiere autenticacion para cualquier otra url
                .oauth2ResourceServer( // Se configura el servidor de recursos oauth2 para proteger los servicios rest
                        oauth -> {
                            oauth.jwt(jwt -> jwt.jwtAuthenticationConverter(jwtAuthenticationConverter)); // Se configura el jwtAuthenticationConverter para convertir el token jwt en un objeto de autenticacion
                        }
                ).sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)); // Se configura la politica de creacion de sesiones como STATELESS para que no se creen sesiones en el servidor
        return http.build(); // Se construye la cadena de filtros de seguridad
    }

}


