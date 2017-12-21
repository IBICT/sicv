package br.com.ibict.acv.sicv.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role implements Serializable {
	 /**
	 * 
	 */
	private static final long serialVersionUID = -3391250534248371210L;

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    int id;

    private String role;

    public Role(Integer id,String role) {
        this.id = id;
        this.role = role;
    }
    
    public Role(){}
    
    public int getId() {
		return id;
	}
    
    public void setId(int id) {
		this.id = id;
	}
    
    public String getRole() {
		return role;
	}
    
    public void setRole(String role) {
		this.role = role;
	}
}