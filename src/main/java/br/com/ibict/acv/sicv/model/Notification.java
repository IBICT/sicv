package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.google.gson.annotations.Expose;

/**
 *
 * @author deivdy
 */
@Entity
@Table(name = "notification")
public class Notification implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = -6868521814767507165L;
	
	private static SimpleDateFormat FORMATDATE = new SimpleDateFormat("dd/MM/yyyy");

	@Id @GeneratedValue
    @Expose
    private Long id;
    
    //@NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Expose
    private Date notifyDate;

    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String subject;

    @Expose
    @Column(name = "messages", nullable = false)
    private ArrayList<String> messages = new ArrayList<String>();
    
    @NotNull
    @Expose
    private Boolean isVisualized = false;

    @ManyToOne
    @JoinColumn(name = "ilcd_id")
    //@Expose
    Ilcd ilcd;
    
    @Expose
    @OneToOne
    @JoinColumn(name = "status_id")
    private Status status;
    
//  Verificar a necessidade dos atributos abaixo
    //remover
    @NotNull
    @Column(columnDefinition = "bigint")
    private Long user;

    public Notification() {
    }

    public Notification(Long id, String subject, Boolean isVisualized, Long user) {
        this.id = id;
        this.subject = subject;
        this.isVisualized = isVisualized;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNotifyDate() {
		return FORMATDATE.format(notifyDate);
	}
    
    public void setNotifyDate(Date notifyDate) {
		this.notifyDate = notifyDate;
	}

    public String getSubject() {
		return subject;
	}
    
    public void setSubject(String subject) {
		this.subject = subject;
	}
    
    public ArrayList<String> getMessages() {
        return messages;
    }

    public void setMessage(ArrayList<String> messages) {
        this.messages = messages;
    }
    
    public boolean addMessage(String message){
    	if(this.messages == null ){
    		this.messages = new ArrayList<String>();
    	}
		return this.messages.add(message);
    }

    public Boolean getIsVisualized() {
        return isVisualized;
    }

    public void setIsVisualized(Boolean isVisualized) {
        this.isVisualized = isVisualized;
    }

    public Ilcd getIlcd() {
		return ilcd;
	}
    
    public void setIlcd(Ilcd ilcd) {
		this.ilcd = ilcd;
	}
    
    public Long getUser() {
        return user;
    }

    public void setUser(Long user) {
        this.user = user;
    }
    
    public Status getStatus() {
		return status;
	}
    
    public void setStatus(Status status) {
		this.status = status;
	}
    
    public void fillMsgWAIT_REV(String uuid, String name){
    	setSubject("Submission Waiting Reviewer: " + uuid);
    	setIsVisualized(false);
    	addMessage("Dataset: " + name + " was submited and is waiting reviewer.");
    	addMessage("For more see: ...");
    }
    
    public void fillMsgWAIT_AC(String uuid, String name){
    	setSubject("Submission Waiting ACCEPT: " + uuid);
    	setIsVisualized(false);
    	addMessage("Dataset: " + name + " was submited and is waiting ACCEPT.");
    	addMessage("For more see: ...");
    }
    
}
