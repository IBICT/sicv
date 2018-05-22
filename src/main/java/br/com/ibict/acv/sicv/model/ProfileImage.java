package br.com.ibict.acv.sicv.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "profile_image")
public class ProfileImage implements Serializable {
	     
    private static final long serialVersionUID = 1L;
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", unique = true, nullable = false)
    private Long id;
     
    @Column(name = "image_name", unique = false, length = 100)
    private String imageName;
     
    @Column(name = "data", unique = false, length = 100000)
    private byte[] data;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    
    public ProfileImage(){    }
    
    public ProfileImage(User user){
    	this.user = user;
    }
    
    public Long getId() {
		return id;
	}
    
    public void setId(Long id) {
		this.id = id;
	}
    
    public String getImageName() {
		return imageName;
	}
    
    public void setImageName(String imageName) {
		this.imageName = imageName;
	}
    
    public byte[] getData() {
		return data;
	}
    
    public void setData(byte[] data) {
		this.data = data;
	}
    
    public User getUser() {
		return user;
	}
    
    public void setUser(User user) {
		this.user = user;
	}
}
