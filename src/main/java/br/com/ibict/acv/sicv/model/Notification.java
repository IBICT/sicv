package br.com.ibict.acv.sicv.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
    private String message;

    @NotNull
    @Expose
    private Boolean isVisualized;

    @NotNull
    @Column(columnDefinition = "bigint")
    private Long user;

    public Notification() {
    }

    public Notification(Long id, String message, Boolean isVisualized, Long user) {
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

    public Long getUser() {
        return user;
    }

    public void setUser(Long user) {
        this.user = user;
    }
    
}