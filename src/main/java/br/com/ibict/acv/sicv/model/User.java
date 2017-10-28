package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "user")
public class User implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = -2259904575694653061L;

	// ------------------------
    // PRIVATE FIELDS
    // ------------------------
    // An autogenerated id (unique for each user in the db)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    @Expose
    private Long id;

    @Column(name = "DSPURPOSE")
    @Expose
    private String dsPurpose;

    @NotNull
    @Column(name = "EMAIL")
    @Expose
    private String email;

    @Column(name = "FIRSTNAME")
    @Expose
    private String firstName;

    @Column(name = "GENDER")
    @Expose
    private String gender;

    @Column(name = "JOBPOSITION")
    @Expose
    private String jobPositon;

    @Column(name = "LASTNAME")
    @Expose
    private String lastName;

    @Column(name = "PASSWORD_HASH")
    private String passwordHash;

    @Column(name = "PASSWORD_HASH_SALT")
    private String passwordHashSalt;

    @Column(name = "REGISTRATIONKEY")
    private String registrationKey;

    @Column(name = "super_admin_permission")
    private Boolean superAdminPermission;

    @Column(name = "TITLE")
    @Expose
    private String title;

    @Column(name = "USERNAME")
    @Expose
    private String userName;

    @Column(name = "CITY")
    @Expose
    private String city;

    @Column(name = "COUNTRY")
    @Expose
    private String country;

    @Column(name = "STREETADDRESS")
    @Expose
    private String streetAddress;

    @Column(name = "ZIPCODE")
    @Expose
    private String zipCode;

    @Column(name = "organization")
    @Expose
    private Boolean organization;

    @NotNull
    @Column(name = "PERFIL")
    @Expose
    private String perfil;

    @Column(name = "TELEFONE")
    @Expose
    private String telefone;

    @Column(name = "INSTITUICAO")
    @Expose
    private String instituicao;

    @Column(name = "PURPOSE")
    @Expose
    private String purpose;

    @Column(name = "MOSTRAR")
    private Boolean mostrar;

    @NotNull
    @Column(columnDefinition = "bigint")
    private Long qntdNotificacoes;
    
    //cascade = CascadeType.ALL
    @OneToMany(mappedBy = "user", targetEntity = Homologacao.class, fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    private List<Homologacao> homologacoes;
    
    @OneToMany(mappedBy = "revisor", targetEntity = Status.class, fetch = FetchType.LAZY)
    private Set<Status> status;
    
    
    // ------------------------
    // PUBLIC METHODS
    // ------------------------
    public User() {
    }

    public User(long id) {
        this.id = id;
    }

    // Getter and setter methods
    public User(Long id, String dsPurpose, String email, String firstName, String gender, String jobPositon, String lastName, String passwordHash, String passwordHashSalt, String registrationKey, Boolean superAdminPermission, String title, String userName, String city, String country, String streetAddress, String zipCode, Boolean organization, String perfil, String telefone, String instituicao, String purpose, Boolean mostrar) {
        this.id = id;
        this.dsPurpose = dsPurpose;
        this.email = email;
        this.firstName = firstName;
        this.gender = gender;
        this.jobPositon = jobPositon;
        this.lastName = lastName;
        this.passwordHash = passwordHash;
        this.passwordHashSalt = passwordHashSalt;
        this.registrationKey = registrationKey;
        this.superAdminPermission = superAdminPermission;
        this.title = title;
        this.userName = userName;
        this.city = city;
        this.country = country;
        this.streetAddress = streetAddress;
        this.zipCode = zipCode;
        this.organization = organization;
        this.perfil = perfil;
        this.telefone = telefone;
        this.instituicao = instituicao;
        this.purpose = purpose;
        this.mostrar = mostrar;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDsPurpose() {
        return dsPurpose;
    }

    public void setDsPurpose(String dsPurpose) {
        this.dsPurpose = dsPurpose;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getJobPositon() {
        return jobPositon;
    }

    public void setJobPositon(String jobPositon) {
        this.jobPositon = jobPositon;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPasswordHashSalt() {
        return passwordHashSalt;
    }

    public void setPasswordHashSalt(String passwordHashSalt) {
        this.passwordHashSalt = passwordHashSalt;
    }

    public String getRegistrationKey() {
        return registrationKey;
    }

    public void setRegistrationKey(String registrationKey) {
        this.registrationKey = registrationKey;
    }

    public Boolean getSuperAdminPermission() {
        return superAdminPermission;
    }

    public void setSuperAdminPermission(Boolean superAdminPermission) {
        this.superAdminPermission = superAdminPermission;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Boolean getOrganization() {
        return organization;
    }

    public void setOrganization(Boolean organization) {
        this.organization = organization;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getInstituicao() {
        return instituicao;
    }

    public void setInstituicao(String instituicao) {
        this.instituicao = instituicao;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public Boolean getMostrar() {
        return mostrar;
    }

    public void setMostrar(Boolean mostrar) {
        this.mostrar = mostrar;
    }
    
    public Long getQntdNotificacoes() {
		return qntdNotificacoes;
	}
    
    public void setQntdNotificacoes(Long qntdNotificacoes) {
		this.qntdNotificacoes = qntdNotificacoes;
	}
    
    public List<Homologacao> getHomologacoes() {
		return homologacoes;
	}
    
    public void setHomologacoes(List<Homologacao> homologacoes) {
		this.homologacoes = homologacoes;
	}
    
    public boolean addHomologacao(Homologacao homologacao){
    	if(homologacoes.equals( null) ){
    		this.homologacoes = new ArrayList<Homologacao>();
    	}
		return this.homologacoes.add(homologacao);
    }

} // class User
