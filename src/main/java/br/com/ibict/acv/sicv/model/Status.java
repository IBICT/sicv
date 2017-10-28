package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "status")
public class Status implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1747311392295606955L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;
	
//    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Expose
    private Date requestDate;
    
    //@NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Expose
    private Date expectedDate;
	
    @Temporal(TemporalType.TIMESTAMP)
    @Expose
    private Date endDate;
    
    //informa tipos: q+, t+, gestor
    @Expose
    @Column(name = "type")
	private Integer type;
	
    @ManyToOne
    @JoinColumn(name = "revisor_id")
    @Expose
    private User revisor;
    
    @OneToMany(mappedBy = "status", targetEntity = Archive.class, fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
    private List<Archive> archive;
    
    //status relacionado o arquivo .ILCD
//    @NotNull
    @Expose
    private Integer status;
    
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "ilcd_id")
    @Expose
    Ilcd ilcd;
    
    @Expose
    @OneToOne(cascade = CascadeType.REFRESH)
    private Homologacao homologation;
    
    public Long getId() {
		return id;
	}
    
    public void setId(Long id) {
		this.id = id;
	}
    
    public Date getRequestDate() {
		return requestDate;
	}
    
    public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
    
    public Date getExpectedDate() {
		return expectedDate;
	}
    
    public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}
    
    public Date getEndDate() {
		return endDate;
	}
    
    public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
    
    public Integer getType() {
		return type;
	}
    
    public void setType(Integer type) {
		this.type = type;
	}
    
    public User getRevisor() {
		return revisor;
	}
    
    public void setRevisor(User revisor) {
		this.revisor = revisor;
	}
    
	public List<Archive> getArchive() {
		return archive;
	}
	
	public void setArchive(List<Archive> archive) {
		this.archive = archive;
	}
    
    public boolean addArchive(Archive archive){
    	if(this.archive == null ){
    		this.archive = new ArrayList<Archive>();
    	}
		return this.archive.add(archive);
    }
    
    public Integer getStatus() {
		return status;
	}
    
    public void setStatus(Integer status) {
		this.status = status;
	}
    
    public Ilcd getIlcd() {
		return ilcd;
	}
    
    public void setIlcd(Ilcd ilcd) {
		this.ilcd = ilcd;
	}

    public Homologacao getHomologation() {
		return homologation;
	}
    
    public void setHomologation(Homologacao homologation) {
		this.homologation = homologation;
	}
}
