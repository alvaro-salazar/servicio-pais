package co.edu.uceva.serviciopais.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Esta clase JwtAuthenticationConverter es un convertidor personalizado que se utiliza para la autenticación JWT.
 * Implementa la interfaz Converter y sobrescribe su método convert().
 *
 * La clase JwtAuthenticationConverter extrae las autoridades otorgadas y los roles de los recursos del token JWT.
 * También obtiene el nombre de la reclamación del principio del token JWT.
 *
 * El atributo 'principleAttribute' se configura con el valor 'sub' por defecto, pero puede ser sobreescrito por la configuración externa.
 * El atributo 'resourceId' se configura con el valor 'frontend-paises' y no puede ser sobreescrito.
 */
@Component
public class JwtAuthenticationConverter implements Converter<Jwt, AbstractAuthenticationToken> {

    private final JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();

    @Value("${jwt.auth.converter.principle-attribute:sub}") // 'sub' es el valor por defecto
    private String principleAttribute; // Atributo de reclamación del principio del token JWT (es decir el usuario autenticado)

    //@Value("${jwt.auth.converter.resource-id:frontend-paises}") // 'frontend-paises' es el valor por defecto
    private String resourceId= "frontend-paises";  // Identificador del recurso en el token JWT (es decir el cliente que solicita el token JWT)

    /**
     * Este método convierte un token JWT en un token de autenticación.
     * @param jwt token JWT
     * @return token de autenticación
     */
    @Override
    public AbstractAuthenticationToken convert(@NonNull Jwt jwt) {
        // Combina las autoridades otorgadas y los roles de los recursos del token JWT
        Collection<GrantedAuthority> authorities = Stream
                .concat(jwtGrantedAuthoritiesConverter.convert(jwt).stream(), extractResourceRoles(jwt).stream())
                .toList();
        // Retorna un token de autenticación con el token JWT, las autoridades y el nombre de la reclamación del principio
        return new JwtAuthenticationToken(
                jwt,
                authorities,
                getPrincipleClaimName(jwt)
        );
    }

    /**
     * Este método extrae los roles de los recursos del token JWT.
     * @param jwt token JWT
     * @return roles de los recursos
     */
    private Collection<? extends GrantedAuthority> extractResourceRoles(Jwt jwt) {
        Map<String, Object> resourceAccess = jwt.getClaim("resource_access");
        if (resourceAccess == null || !resourceAccess.containsKey(resourceId)) {
            return Set.of();  // Retorna un conjunto vacío si no hay accesos de recurso relevantes
        }

        Map<String, Object> resource = (Map<String, Object>) resourceAccess.get(resourceId);
        Collection<String> resourceRoles = (Collection<String>) resource.get("roles");

        // Retorna un conjunto de roles de recurso como autoridades (son los roles del cliente que solicita el token JWT)
        return resourceRoles.stream()
                .map(role -> new SimpleGrantedAuthority("ROLE_" + role))
                .collect(Collectors.toSet());
    }

    /**
     * Este método obtiene el nombre de la reclamación del principio del token JWT.
     * @param jwt token JWT
     * @return nombre de la reclamación del principio
     */
    private String getPrincipleClaimName(Jwt jwt) {
        return jwt.getClaim(principleAttribute);
    }
}
