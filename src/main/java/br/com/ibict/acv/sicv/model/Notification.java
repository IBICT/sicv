package br.com.ibict.acv.sicv.model;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.google.gson.annotations.Expose;

/**
 *
 * @author deivdy
 */
@Entity
@Table(name = "notification")
public class Notification {

    @Id @GeneratedValue
    @Expose
    private Long id;

    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String subject;

    @Column(name = "messages", nullable = false)
    private ArrayList<String> messages = new ArrayList<String>();
    
    @NotNull
    @Expose
    private Boolean isVisualized;

    @ManyToOne
    @JoinColumn(name = "homologation_id")
    @Expose
    Homologacao homologation;
    
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

    public Long getUser() {
        return user;
    }

    public void setUser(Long user) {
        this.user = user;
    }
    
    public void fillMsgWAIT_REV(String uuid, String name){
    	setSubject("Submission Waiting Reviewer: " + uuid);
    	setIsVisualized(false);
    	addMessage("Dataset: " + name + " was submited and is waiting reviewer.");
    	addMessage("For more see: ...");
    }
    
}
