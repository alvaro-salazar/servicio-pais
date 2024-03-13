package co.edu.uceva.serviciopais.model.entities;

//ORM: Object Relational Mapping
//JPA: Java Persistence API (es el ORM de Java)
//Hibernate: es una implementación de JPA

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name="pais")
public class Pais {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private String pais;
    private String capital;
    private String continente;
}
