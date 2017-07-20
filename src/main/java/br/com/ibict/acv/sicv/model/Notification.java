package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author deivdy
 */
@Entity
@Table(name = "notification")
public class Notification {
    
    @Id
    @Expose
    private Long id;
    
    @NotNull
    @Expose
    @Column(columnDefinition = "TEXT")
    private String message;
    
    @NotNull
    @Expose
    private Boolean isVisualized;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Notification() {
    }

    public Notification(Long id, String message, Boolean isVisualized, User user) {
        this.id = id;
        this.message = message;
        this.isVisualized = isVisualized;
        this.user = user;
    }

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getIsVisualized() {
        return isVisualized;
    }

    public void setIsVisualized(Boolean isVisualized) {
        this.isVisualized = isVisualized;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    
}
