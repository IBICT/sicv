package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Deivdy.Silva
 */
@Entity
@Table(name = "ilcd")
public class Ilcd implements Serializable {

    @Id
    @Expose
    private String id;

    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String name;

    @NotNull
    @Expose
    private String type;

    @NotNull
    @Expose
    private String location;

    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String clasification;

    @NotNull
    @Expose
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToReference;

    @NotNull
    @Expose
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToValidate;

    @NotNull
    @Expose
    private String pathFile;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "user_id")
    @Expose
    private User user;

    @NotNull
    @Expose
    private Long base;

    @NotNull
    @Expose
    private Long status;

    @Column(columnDefinition = "TEXT")
    @Expose
    private String json1;

    @Column(columnDefinition = "TEXT")
    @Expose
    private String json2;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "homologacao")
    @Expose
    private Homologacao homologacao;

    public Ilcd() {
    }

    public Ilcd(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile, User user, Long base, Long status) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.location = location;
        this.clasification = clasification;
        this.yearToReference = yearToReference;
        this.yearToValidate = yearToValidate;
        this.pathFile = pathFile;
        this.user = user;
        this.base = base;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getClasification() {
        return clasification;
    }

    public void setClasification(String clasification) {
        this.clasification = clasification;
    }

    public Date getYearToReference() {
        return yearToReference;
    }

    public void setYearToReference(Date yearToReference) {
        this.yearToReference = yearToReference;
    }

    public Date getYearToValidate() {
        return yearToValidate;
    }

    public void setYearToValidate(Date yearToValidate) {
        this.yearToValidate = yearToValidate;
    }

    public String getPathFile() {
        return pathFile;
    }

    public void setPathFile(String pathFile) {
        this.pathFile = pathFile;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getBase() {
        return base;
    }

    public void setBase(Long base) {
        this.base = base;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public String getJson1() {
        return json1;
    }

    public void setJson1(String json1) {
        this.json1 = json1;
    }

    public String getJson2() {
        return json2;
    }

    public void setJson2(String json2) {
        this.json2 = json2;
    }

    public Homologacao getHomologacao() {
        return homologacao;
    }

    public void setHomologacao(Homologacao homologacao) {
        this.homologacao = homologacao;
    }

}
