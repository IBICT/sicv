package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
    
    @Expose
    @Column(name = "type")
	private Integer type;
	
    @ManyToOne
    @JoinColumn(name = "revisor_id")
    @Expose
    private User revisor;
    
    @ManyToOne
    @JoinColumn(name = "file_id")
    @Expose
    private File file;
    
//    @NotNull
    @Expose
    private Integer status;
}
