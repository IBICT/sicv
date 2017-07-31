package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "technical_reviewer")
public class TechnicalReviewer {
    
    @Id
    @Expose
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Expose
    @Column(columnDefinition = "TEXT")
    private String comment;
    
    @Expose
    @NotNull
    private String ilcd;
    
    @Expose
    @NotNull
    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

    public TechnicalReviewer() {
    }

    public TechnicalReviewer(Long id, String comment, String ilcd, User user) {
        this.id = id;
        this.comment = comment;
        this.ilcd = ilcd;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getIlcd() {
        return ilcd;
    }

    public void setIlcd(String ilcd) {
        this.ilcd = ilcd;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}
