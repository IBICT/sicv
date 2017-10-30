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
import javax.validation.constraints.NotNull;

import com.google.gson.annotations.Expose;

/**
 *
 * @author Deivdy.Silva
 */
@Entity
@Table(name = "ilcd")
public class Ilcd implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8177506191201359444L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;
	
    @Expose
    private String UUID;

    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String author;
        
    @NotNull
    @Expose
    private String email;
    
    @NotNull
    @Expose
    private String title;
    
    @NotNull
    @Expose
    private String category;
    
    @NotNull
    @Expose
    private String description;
    
    @Expose
    @OneToOne(cascade = CascadeType.REFRESH)
    private Homologacao homologation;
    
//    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String name;
    
    @OneToMany(mappedBy = "ilcd", targetEntity = Notification.class, cascade = CascadeType.PERSIST)
    @Expose
    private List<Notification> notifications;
    
    @OneToMany(mappedBy = "ilcd", targetEntity = Status.class, fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    private List<Status> status;

//    Verificar a necessidade dos atributos abaixo    
    
 //   @NotNull
    @Expose
    private String type;

//    @NotNull
    @Expose
    private String location;

//    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String clasification;

//    @NotNull
    @Expose
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToReference;

//    @NotNull
    @Expose
    @Temporal(TemporalType.TIMESTAMP)
    private Date yearToValidate;

//    @NotNull
    @ManyToOne
    @JoinColumn(name = "user_id")
    @Expose
    private User user;

//    @NotNull
    @Expose
    private Long base;

    @Column(columnDefinition = "TEXT")
    @Expose
    private String json1;

    @Column(columnDefinition = "TEXT")
    @Expose
    private String json2;

    public Ilcd() {
    }

    public Ilcd(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile, User user, Long base, Long status) {
//        this.id = id;
        this.name = name;
        this.type = type;
        this.location = location;
        this.clasification = clasification;
        this.yearToReference = yearToReference;
        this.yearToValidate = yearToValidate;
        //this.pathFile = pathFile;
        this.user = user;
        this.base = base;
        //this.status = status;
    }

    public String getUUID() {
		return UUID;
	}
    
    public void setUUID(String uUID) {
		UUID = uUID;
	}
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public List<Status> getStatus() {
		return status;
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
    
    public void setStatus(List<Status> status) {
		this.status = status;
	}
    
    public boolean addStatus(Status status){
    	if(this.status == null ){
    		this.status = new ArrayList<Status>();
    	}
		return this.status.add(status);
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
        return homologation;
    }

    public void setHomologacao(Homologacao homologation) {
        this.homologation = homologation;
    }

}
