package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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

import org.springframework.format.annotation.DateTimeFormat;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "status")
public class Status implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1747311392295606955L;
    private static final SimpleDateFormat DATEFORMAT = new SimpleDateFormat("dd/MM/yyyy");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;

//    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    @Expose
    private Date requestDate;

    //@NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    @Expose
    private Date expectedDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
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

    /*    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "status", targetEntity = Archive.class, cascade = CascadeType.PERSIST)
    private List<Archive> archive;*/
    @Expose
    @OneToOne(mappedBy = "status", cascade = CascadeType.PERSIST)
    private Archive archive;
    
    @Expose
    @OneToOne
    private Status previous;

    //status relacionado o arquivo .ILCD
    //informa o andamento do arquivo: AG_REV, AG_AC ...
//    @NotNull
    @Expose
    private Integer result;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "ilcd_id")
    @Expose
    Ilcd ilcd;
    
    //@OneToOne(cascade = CascadeType.REFRESH)
    //private Reviewer reviewer;
    
    @OneToOne(cascade = CascadeType.REFRESH)
    private QualiData qualiData;
    
    @OneToOne(cascade = CascadeType.REFRESH)
    private TechnicalReviewer technicalReviewer;
    
    @Expose
    private Boolean accept;
    
    @Expose
    private Boolean closed;
    
    @Expose
    private Boolean closed2;

    public Status() {
    }

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
    
    public String getRequestDateString(){
    	return DATEFORMAT.format(requestDate);
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

    public Archive getArchive() {
        return archive;
    }

    public void setArchive(Archive archive) {
        this.archive = archive;
    }

    public Status getPrevious() {
		return previous;
	}
    
    public void setPrevious(Status previous) {
		this.previous = previous;
	}

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Ilcd getIlcd() {
        return ilcd;
    }

    public void setIlcd(Ilcd ilcd) {
        this.ilcd = ilcd;
    }

//
//    public Reviewer getReviewer() {
//        return reviewer;
//    }
//
//    public void setReviewer(Reviewer reviewer) {
//        this.reviewer = reviewer;
//    }

    public QualiData getQualiData() {
        return qualiData;
    }

    public void setQualiData(QualiData qualiData) {
        this.qualiData = qualiData;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }

    public Boolean getClosed() {
        return closed;
    }

    public void setClosed(Boolean closed) {
        this.closed = closed;
    }

    public TechnicalReviewer getTechnicalReviewer() {
        return technicalReviewer;
    }

    public void setTechnicalReviewer(TechnicalReviewer technicalReviewer) {
        this.technicalReviewer = technicalReviewer;
    }

    public Boolean getClosed2() {
        return closed2;
    }

    public void setClosed2(Boolean closed2) {
        this.closed2 = closed2;
    }
    
}
