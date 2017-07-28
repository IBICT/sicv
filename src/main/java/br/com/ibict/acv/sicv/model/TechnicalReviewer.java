package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "technical_reviewer")
public class TechnicalReviewer {
    
    @Id
    @Expose
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Expose
    @Column(columnDefinition = "TEXT")
    private String comment;
    
    @Expose
    @NotNull
    private String ilcd;
    
}
