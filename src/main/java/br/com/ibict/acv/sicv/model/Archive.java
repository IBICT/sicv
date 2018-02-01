package br.com.ibict.acv.sicv.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "archive")
public class Archive implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8565487720085084453L;
	
	public static final String COMMENT = "comment";
	public static final String COMPLEMENT = "complement";
	public static final String REVIEW = "review";
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;
    
    //pode ser string ou inteiro?
    @NotNull
    @Expose
    private Integer version;
    
/*    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "status_id")
    @Expose
    private Status status;*/
    @Expose
    @OneToOne(cascade = CascadeType.REFRESH)
    private Status status;
        
    @NotNull
    @Expose
    private String pathFile;
    
    @Expose
    @OneToOne(mappedBy="lastArchive", optional = true)
    private Homologacao homologation ;
    
    public Long getId() {
    	return id;
    }
    
    public void setId(Long id) {
    	this.id = id;
    }
    
    public Integer getVersion() {
    	return version;
    }
    
    public void setVersion(Integer version) {
    	this.version = version;
    }
    
    public Status getStatus() {
		return status;
	}
    
    public void setStatus(Status status) {
		this.status = status;
	}
    
    public String getPathFile() {
        return pathFile;
    }

    public void setPathFile(String pathFile) {
        this.pathFile = pathFile;
    }
    
    public Homologacao getHomologation() {
		return homologation;
	}
    
    public void setHomologation(Homologacao homologation) {
		this.homologation = homologation;
	}

}
