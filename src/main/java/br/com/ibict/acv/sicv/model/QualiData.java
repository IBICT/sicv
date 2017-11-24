/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author deivdywilliamsilva
 */
@Entity
@Table(name = "qualidata")
public class QualiData implements Serializable {
    
    @Id
    @Expose
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private Archive archive;
    
    private Boolean q1;
    
    private Boolean q2;
    
    private Boolean q3;
    
    private Boolean q4;
    
    private Boolean q5;
    
    private Boolean q6;
    
    private Boolean q7;
    
    private Boolean q8;
    
    private Boolean q9;
    
    private Boolean q10;
    
    private Boolean q11;
    
    private Boolean q12;
    
    private Boolean q13;
    
    private Boolean q14;
    
    private Boolean q15;
    
    private Boolean q16;
    
    private Boolean q17;
    
    private Boolean q18;
    
    private Boolean q19;
    
    private Boolean q20;
    
    private Boolean q21;
    
    private Boolean q22;
    
    private Boolean q23;
    
    private Boolean q24;
    
    private Boolean q25;
    
    private Boolean q26;
    
    private Boolean q27;
    
    private Boolean q28;
    
    private Boolean q29;
    
    private Boolean q30;
    
    private Boolean q31;
    
    private Boolean q32;
    
    private Boolean q33;
    
    private Boolean q34;
    
    private Boolean q35;
    
    private Boolean q36;
    
    private Boolean q37;
    
    private Boolean q38;
    
    private Boolean q39;
    
    private Boolean q40;
    
    private Boolean q41;
    
    private Boolean q42;
    
}
