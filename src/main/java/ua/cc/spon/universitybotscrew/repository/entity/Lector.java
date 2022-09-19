package ua.cc.spon.universitybotscrew.repository.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Set;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "lectors")
public class Lector {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lector_id")
    private long id;

    @Column(name = "name")
    private String name;

    @OneToOne
    @JoinColumn(name = "degree_id")
    private Degree degree;

    @Column(name = "salary")
    private BigDecimal salary;

    @ManyToMany
    @JoinTable(name = "lectors_departments",
            joinColumns = {@JoinColumn(name = "lector_id")},
            inverseJoinColumns = {@JoinColumn(name = "department_id")})
    private Set<Department> departments;

}
