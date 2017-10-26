package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "file")
public class File implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8565487720085084453L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;
	
    @Expose
    @JoinColumn(name = "file")
    private File file;
    
    @NotNull
    @Expose
    private String version;
    
    @OneToMany(mappedBy = "file", targetEntity = Status.class, fetch = FetchType.LAZY)
    private Set<Status> status;
    
    @NotNull
    @Expose
    private String pathFile;
    
    public String getPathFile() {
        return pathFile;
    }

    public void setPathFile(String pathFile) {
        this.pathFile = pathFile;
    }

}
