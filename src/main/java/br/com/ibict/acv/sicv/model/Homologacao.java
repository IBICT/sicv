package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
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

import org.springframework.format.annotation.DateTimeFormat;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "homologacao")
public class Homologacao implements Serializable {

    private static final long serialVersionUID = -8516924659813733068L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "user_id")
    @Expose
    private User user;

//    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    @Expose
    private Date submission;

//    @NotNull
    @Expose
    @OneToOne(mappedBy = "homologation", cascade = CascadeType.PERSIST)
    private Ilcd ilcd;

//    @NotNull
    @Expose
    private Integer status;

//  Verificar a necessidade dos atributos abaixo
    @Expose
    @ManyToOne
    @JoinColumn(name = "technical_reviewer")
    private TechnicalReviewer technicalReviewer;

//  @NotNull
    @Expose
    @OneToOne
    private Archive lastArchive;

    @NotNull
    @Expose
    @Column(nullable = false)
    private boolean pending = false;

    @Expose
    @Column(nullable = false)
    private String prazo = "";

    public Homologacao() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Ilcd getIlcd() {
        return ilcd;
    }

    public void setIlcd(Ilcd ilcd) {
        this.ilcd = ilcd;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public TechnicalReviewer getTechnicalReviewer() {
        return technicalReviewer;
    }

    public void setTechnicalReviewer(TechnicalReviewer technicalReviewer) {
        this.technicalReviewer = technicalReviewer;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getSubmission() {
        return submission;
    }

    public void setSubmission(Date submission) {
        this.submission = submission;
    }

    public Archive getLastArchive() {
        return lastArchive;
    }

    public void setLastArchive(Archive lastArchive) {
        this.lastArchive = lastArchive;
    }

    public boolean isPending() {
        return pending;
    }

    public void setPending(boolean pending) {
        this.pending = pending;
    }

    public String getPrazo() {
        return prazo;
    }

    public void setPrazo(String prazo) {
        this.prazo = prazo;
    }

}
