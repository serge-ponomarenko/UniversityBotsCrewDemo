package ua.cc.spon.universitybotscrew.repository.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "degrees")
public class Degree {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "degree_id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "plural_name")
    private String pluralName;

}
