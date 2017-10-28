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
@Table(name = "homologacao")
public class Homologacao implements Serializable {

    /**
	 * 
	 */
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

    @OneToMany(mappedBy = "homologation", targetEntity = Notification.class, fetch = FetchType.LAZY)
    @Expose
    private List<Notification> notifications;
    
//    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Expose
    private Date submission;

//    @NotNull
    @Expose
    @OneToOne(mappedBy="homologation", cascade = CascadeType.REFRESH)
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
    @OneToOne(mappedBy="homologation", cascade = CascadeType.PERSIST)
    private Status lastStatus;
    
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

	public List<Notification> getNotifications() {
		return notifications;
	}
	
	public void setNotifications(List<Notification> notifications) {
		this.notifications = notifications;
	}
    
    public boolean addNotification(Notification notification){
    	if(this.notifications == null ){
    		this.notifications = new ArrayList<Notification>();
    	}
		return this.notifications.add(notification);
    }
    
    public Date getSubmission() {
		return submission;
	}
    
    public void setSubmission(Date submission) {
		this.submission = submission;
	}
    
    public Status getLastStatus() {
    	if(lastStatus == null){
    		this.lastStatus = new Status();
    	}
		return lastStatus;
	}
    
    public void setLastStatus(Status lastStatus) {
		this.lastStatus = lastStatus;
	}
}
