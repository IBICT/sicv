package br.com.ibict.acv.sicv.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.annotations.Expose;

import java.security.*;
import java.math.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@Entity
@Table(name = "user")
public class User implements Serializable {

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

    @Column(name = "FIRSTNAME", columnDefinition = "varchar(255) default ''")
    @Expose
    private String firstName;

    @Column(name = "LASTNAME", columnDefinition = "varchar(255) default ''")
    @Expose
    private String lastName;

    @NotEmpty
    @NotNull
    @Column(name = "EMAIL", unique = true, columnDefinition = "varchar(255) default ''")
    @Expose
    private String email;

    @Column(name = "organization", columnDefinition = "varchar(255) default ''")
    @Expose
    private String organization = new String();

    @Column(name = "COUNTRY")
    @Expose
    private String country;

    @Column(name = "LANGUAGE")
    @Expose
    private String language;

    @Column(name = "OTHERLANGUAGE")
    @Expose
    private String otherLanguage;

    @Column(name = "TITLE")
    @Expose
    private String title;

    @Column(name = "JOBPOSITION")
    @Expose
    private String jobPosition;

    @Column(name = "ORCID")
    @Expose
    private String orcid;

    @Column(name = "CURRICULUM")
    @Expose
    private String curriculum;

    @Column(name = "DSPURPOSE")
    @Expose
    private String dsPurpose;

    @Column(name = "PASSWORD_HASH")
    private String passwordHash;

    @Column(name = "PASSWORD_HASH_SALT")
    private String passwordHashSalt;

    @Transient
    private String plainPassword;

    @Transient
    private String newPassword;

    @Column(name = "REGISTRATIONKEY")
    private String registrationKey;

    @Column(name = "super_admin_permission")
    private Boolean superAdminPermission;

    @Column(name = "active_code")
    private String activeCode;

    @Column(name = "active")
    private Boolean active;

    @Expose
    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
    @JoinTable(name = "user_roles",
            joinColumns = {
                @JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {
                @JoinColumn(name = "role_id", referencedColumnName = "id")})
    private Set<Role> roles;

    @Column(name = "PHONE")
    @Expose
    private String phone;

    @NotNull
    @Column(columnDefinition = "bigint")
    private Long qntdNotificacoes;

    //cascade = CascadeType.ALL
    @OneToMany(mappedBy = "user", targetEntity = Homologacao.class, fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    private List<Homologacao> homologacoes;

    @OneToMany(mappedBy = "revisor", targetEntity = Status.class, fetch = FetchType.EAGER)
    private Set<Status> status;

    @OneToMany(mappedBy = "user", targetEntity = Notification.class, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @Expose
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Notification> notifications = new ArrayList<Notification>();

    @OneToMany(mappedBy = "user", targetEntity = PasswordReset.class, fetch = FetchType.EAGER)
    private Set<PasswordReset> passwordResets;

    // ------------------------
    // PUBLIC METHODS
    // ------------------------
    public User() {
    }

    public User(long id) {
        this.id = id;
    }

    // Getter and setter methods
    public User(Long id, String dsPurpose, String email, String firstName, String jobPosition, String lastName, String passwordHash, String passwordHashSalt, String registrationKey, Boolean superAdminPermission, String title, String country, String organization, String perfil, String phone, String curriculum, String language) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.organization = organization;
        this.country = country;
        this.language = language;
        this.title = title;
        this.jobPosition = jobPosition;
        this.curriculum = curriculum;
        this.dsPurpose = dsPurpose;
        this.passwordHash = passwordHash;
        this.passwordHashSalt = passwordHashSalt;
        this.registrationKey = registrationKey;
        this.superAdminPermission = superAdminPermission;
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

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getOrcid() {
        return orcid;
    }

    public void setOrcid(String orcid) {
        this.orcid = orcid;
    }

    public String getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(String curriculum) {
        this.curriculum = curriculum;
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

    public String getPlainPassword() {
        return plainPassword;
    }

    public void setPlainPassword(String plainPassword) {
        this.plainPassword = plainPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getOtherLanguage() {
        return otherLanguage;
    }

    public void setOtherLanguage(String otherLanguage) {
        this.otherLanguage = otherLanguage;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public boolean addHomologacao(Homologacao homologacao) {
        if (homologacoes.equals(null)) {
            this.homologacoes = new ArrayList<Homologacao>();
        }
        return this.homologacoes.add(homologacao);
    }

    public Set<Status> getStatus() {
        return status;
    }

    public void setStatus(Set<Status> status) {
        this.status = status;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public boolean addRole(Role role) {
        if (roles == null) {
            this.roles = new HashSet<Role>();
        }
        return this.roles.add(role);
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }

    public boolean addNotification(Notification notify) {
        if (notifications == null) {
            this.notifications = new ArrayList<Notification>();
        }
        return this.notifications.add(notify);
    }

    public String getFullName() {
        return this.firstName + " " + this.lastName;
    }

    public Set<PasswordReset> getPasswordResets() {
        return passwordResets;
    }

    public String getNewActiveCode() {
        try {
            String s = this.email + "patatipatata";
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.update(s.getBytes(), 0, s.length());
            
            return new String(new BigInteger(1, m.digest()).toString(16));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
    
    
}
