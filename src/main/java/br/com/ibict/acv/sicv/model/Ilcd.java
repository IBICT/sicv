package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
    private String id;
    
    @NotNull
    @Column(columnDefinition = "TEXT")
    private String name;
    
    @NotNull
    private String type;
    
    @NotNull
    private String location;
    
    @NotNull
    @Column(columnDefinition = "TEXT")
    private String clasification;
    
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToReference;
    
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToValidate;
    
    @NotNull
    private String pathFile;

    public Ilcd() {
    }

    public Ilcd(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.location = location;
        this.clasification = clasification;
        this.yearToReference = yearToReference;
        this.yearToValidate = yearToValidate;
        this.pathFile = pathFile;
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
    
}
