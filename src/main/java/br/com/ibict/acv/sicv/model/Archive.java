package br.com.ibict.acv.sicv.model;

import java.io.File;
import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;
	
	//arquivo relacionado ao .ILCD: .pdf, .doc, .rar...
    @Expose
    @JoinColumn(name = "file")
    private File file;
    
    //pode ser string ou inteiro?
    @NotNull
    @Expose
    private Integer version;
    
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "status_id")
    @Expose
    private Status status;
        
    @NotNull
    @Expose
    private String pathFile;
    
    public Long getId() {
    	return id;
    }
    
    public void setId(Long id) {
    	this.id = id;
    }
    
    public File getFile() {
		return file;
	}
    
    public void setFile(File file) {
    	this.file = file;
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

}
