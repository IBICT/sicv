package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "homologacao")
public class Homologacao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user")
    @Expose
    private User user;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Expose
    private Date lastModifier;

    @NotNull
    @Expose
    private Integer status;
    
    @Expose
    @ManyToOne
    @JoinColumn(name = "technical_reviewer")
    private TechnicalReviewer technicalReviewer;

    public Homologacao() {
    }

    public Homologacao(Long id, User user, Ilcd ilcd, Integer status) {
        this.id = id;
        this.user = user;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getLastModifier() {
        return lastModifier;
    }

    public void setLastModifier(Date lastModifier) {
        this.lastModifier = lastModifier;
    }

    public TechnicalReviewer getTechnicalReviewer() {
        return technicalReviewer;
    }

    public void setTechnicalReviewer(TechnicalReviewer technicalReviewer) {
        this.technicalReviewer = technicalReviewer;
    }

}