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
    @Column(columnDefinition = "bigint")
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
    
    public void fillMsgUSER_SUBMISSION(Long ilcdId, String userName){
    	setSubject("Submissão do Conjunto de Dados");
    	addMessage("Sua submissão foi realizada com sucesso.");
    	addMessage("Acompanhe o andamento em <a href=\"<%=Strings.BASE%>/authorIlcd/" + ilcdId.toString() + ">" + userName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_REV_Q_REPPROVED(String ilcdName){
    	setSubject("A submissão " + ilcdName + " não foi aceita para integrar o SICV Basil.");
    	addMessage("O conjunto de dados enviado está em desacordo com os requisitos previstos no Qualidata. Tente submeter um novo conjunto de dados observando os requisitos citados no <Qualidata: link para pdf>");
    	addMessage("Para saber mais entre em contato com o Gestor do sistema.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_REV_T_REPPROVED(String ilcdName){
    	setSubject("A submissão " + ilcdName + " não foi aceita para integrar o SICV Basil.");
    	addMessage("O conjunto de dados submetido não foi aprovado na revisão crítica/ técnica.");
    	addMessage("Para saber mais entre em contato com o Gestor do sistema.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_REV_Q_NEEDADJUST(Long ilcdId, String idQualidataIlcd){
    	setSubject("Aprovado mediante correção na revisão Qualidata");
    	addMessage("Sua submissão será aprovada na revisão de qualidade, mediante algumas correções, que certificarão a uniformização do conjunto de dados conforme os requisitos previstos no Qualidata.<p>"
    			+ "Na " + "<a href=\"<%=Strings.BASE%>/authorIlcd/" + ilcdId.toString() + ">" + "<b>página de visualização do inventário</b>" + "</a>" + "anexe um novo conjunto de dados conforme sugestões do revisor.");
    	addMessage("<a href=\"<%=Strings.BASE%>/qualityreview/" + idQualidataIlcd + "/view>" + " Visualizar parecer do revisor" + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_REV_T_NEEDADJUST(Long ilcdId){
    	setSubject("Aprovado mediante correção na revisão Técnica");
    	addMessage("Sua submissão será APROVADA na revisão técnica, MEDIANTE ALGUMAS CORREÇÕES.");
    	addMessage("Anexe no local indicado um novo conjunto de dados conforme " + "<a href=\"<%=Strings.BASE%>/authorIlcd/" + ilcdId + ">" + "sugestões do revisor" + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
     
    public void fillMsgUSER_MANAGER_REV_Q_APPROVED(Long ilcdId, String idQualidataIlcd){
    	setSubject("Sua submissão foi aprovada na revisão Qualidata");
    	addMessage("O próximo passo será a revisão técnica, na qual avaliaremos a veracidade e conteúdo dos dados.");
    	addMessage("Acompanhe o andamento da revisão técnica na " + "<a href=\"<%=Strings.BASE%>/authorIlcd/" + ilcdId.toString() + ">" + " página do inventário" + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_APPROVED(Long ilcdId, String idQualidataIlcd){
    	setSubject("Sua submissão foi aprovada");
    	addMessage("Parabéns, sua submissão passou pelas etapas de Revisão QUALIDATA e Revisão TÉCNICA e foi considerada apta para a publicação no SICV BRASIL.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgUSER_MANAGER_PUBLISH(Long ilcdId, String ilcdName){
    	setSubject("Conjunto de dados Publicado");
    	addMessage("Seu conjunto de dados foi PUBLICADO COM SUCESSO e está disponível para acesso em: " + "<a href=\"<%=Strings.BASE%>/authorIlcd/" + ilcdId.toString() + ">" 
    				+ ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }

    public void fillMsgMANAGER_WAIT_Q_REV(Long ilcdId, String ilcdName){
    	setSubject("Submissão do Conjunto de Dados");
    	addMessage("Novo conjunto de dados aguardando designação do gestor para REVISÃO QUALIDATA");
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_WAIT_T_REV(Long ilcdId, String ilcdName){
    	setSubject("Conjunto de Dados aguardando revisor");
    	addMessage("O conjunto de dados está aguardando designação do gestor para Revisão de Técnica:");
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgQUALITY_WAIT_AC(Long ilcdId, String ilcdName){
    	setSubject("Solicitação de revisão");
    	addMessage(" Você foi convidado para avaliar se o conjunto de dados " + "<a href=\"<%=Strings.BASE%>/qualityreview/" + ilcdId.toString() + ">" 
    			+ ilcdName + "</a>" + " segue os requisitos determinados pelo <QUALIDATA>"); 
    	addMessage("Para aceitar o convite acesse a página de revisão do conjunto de dados na aba <Revisor Qualidata>.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgQUALITY_INVITE_CANCEL(String ilcdName){
    	setSubject("Convite cancelado");
    	addMessage("Seu convite para realizar a Revisão Qualidata do conjunto de dados " + ilcdName + " foi cancelado."); 
    	addMessage("Para mais informações, entre em contato com o Gestor do sistema.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgQUALITY_NEW_SUBMISSION_Q_REV(String userName, String ilcdName, Long ilcdId){
    	setSubject("Novo arquivo ILCD");
    	addMessage("O usuário " + userName + ", autor do inventário" + "<a href=\"<%=Strings.BASE%>/qualityreview/" + ilcdId.toString() + ">" + ilcdName + "</a>");
    	addMessage("submeteu novo arquivo ILCD que deverá passar por uma nova revisão de Qualidade.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgQUALITY_NEW_SUBMISSION_T_REV(String userName, String ilcdName, Long ilcdId){
    	setSubject("Novo arquivo ILCD");
    	addMessage("O usuário " + userName + ", autor do inventário" + "<a href=\"<%=Strings.BASE%>/technicalreview/" + ilcdId.toString() + ">" + ilcdName + "</a>");
    	addMessage("submeteu novo arquivo ILCD que deverá passar por uma nova revisão de Técnica.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgTECHNICAL_WAIT_AC(Long ilcdId, String ilcdName){
    	setSubject("Solicitação de revisão");
    	addMessage(" Você foi convidado para avaliar a consistência do conjunto de dados " + "<a href=\"<%=Strings.BASE%>/qualityreview/" + ilcdId.toString() + ">" 
    			+ ilcdName + "</a>" + " por meio de uma REVISÃO TÉCNICA."); 
    	addMessage("Para aceitar o convite acesse a página de revisão do conjunto de dados na aba <Revisor Técnico.>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgTECHNICAL_INVITE_CANCEL(String ilcdName){
    	setSubject("Convite cancelado");
    	addMessage("Seu convite para realizar a Revisão Técnica do conjunto de dados " + ilcdName + " foi cancelado."); 
    	addMessage("Para mais informações, entre em contato com o Gestor do sistema.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_NEW_SUBMISSION_Q_REV(String userName, String ilcdName, Long ilcdId){
    	setSubject("Novo arquivo ILCD");
    	addMessage("O usuário " + userName + ", autor do inventário" + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + ilcdName + "</a>"
    				+ "submeteu novo arquivo ILCD que deverá passar por uma nova revisão de Qualidade.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_NEW_SUBMISSION_T_REV(String userName, String ilcdName, Long ilcdId){
    	setSubject("Novo arquivo ILCD");
    	addMessage("O usuário " + userName + ", autor do inventário" + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + ilcdName + "</a>"
    				+ "submeteu novo arquivo ILCD que deverá passar por uma nova revisão de Técnica.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_INVITE_Q_ACC(String nameReviwerQ, String nameIlcd, Long ilcdId){
    	setSubject("Convite aceito");
    	addMessage("O revisor de qualidade " + nameReviwerQ +" está disponível para efetuar a revisão da submissão.");
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + nameIlcd + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_INVITE_T_ACC(String nameReviwerT, String nameIlcd, Long ilcdId){
    	setSubject("Convite aceito");
    	addMessage("O revisor de técnico " + nameReviwerT +" está disponível para efetuar a revisão da submissão.");
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId.toString() + ">" + nameIlcd + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_INVITE_Q_REJECT(String nameReviwerQ, String nameIlcd, Long ilcdId){
    	setSubject("Convite recusado");
    	addMessage("O revisor de qualidade " + nameReviwerQ + " não está disponível para efetuar a revisão do"
    			+ "<a href=\"<%=Strings.BASE%>/qualityreview/" + ilcdId.toString() + ">" + " conjunto de dados." + "</a>"); 
    	addMessage("Escolha um novo revisor para o conjunto de dados " + nameIlcd);
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_INVITE_T_REJECT(String nameReviwerQ, String nameIlcd, Long ilcdId){
    	setSubject("Convite recusado");
    	addMessage("O revisor de ténico " + nameReviwerQ + " não está disponível para efetuar a revisão do "
    			+ "<a href=\"<%=Strings.BASE%>/technicalreview/" + ilcdId.toString() + ">" + " conjunto de dados." + "</a>"); 
    	addMessage("Escolha um novo revisor para o conjunto de dados " + nameIlcd);
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_REV_Q_REPROVED(Long idQualidataIlcd, Long ilcdId){
    	setSubject("Revisão Qualidata finalizada com parecer desfavorável - REPROVADO");
    	addMessage("<a href=\"<%=Strings.BASE%>/qualityreview/" + idQualidataIlcd + "/view>" + "Ver parecer do revisor" + "</a>"); 
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + "Acessar página da submissão" + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_REV_T_REPROVED(Long idTechnicalReviewerIlcd, Long ilcdId){
    	setSubject("Revisão Técnica finalizada com parecer desfavorável - REPROVADO");
    	addMessage("<a href=\"<%=Strings.BASE%>/technicalreview/" + idTechnicalReviewerIlcd + "/view>" + "Ver parecer do revisor" + "</a>"); 
    	addMessage("<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + "Acessar página da submissão" + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_REV_Q_NEED_ADJUST(String ilcdName, Long idQualidataIlcd, Long ilcdId){
    	setSubject("Revisão Qualidata finalizada com parecer favorável mediante correção - APROVADO MEDIANTE CORREÇÃO.");
    	addMessage("Veja o " + "<a href=\"<%=Strings.BASE%>/qualityreview/" + idQualidataIlcd + "/view>" + " parecer do revisor" + "</a>"); 
    	addMessage("Acessar página da submissão: " + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_REV_T_NEED_ADJUST(String ilcdName, Long idTechnicalReviwerIlcd, Long ilcdId){
    	setSubject("Revisão Técnica finalizada com parecer favorável mediante correção - APROVADO MEDIANTE CORREÇÃO.");
    	addMessage("Veja o " + "<a href=\"<%=Strings.BASE%>/technicalreview/" + idTechnicalReviwerIlcd + "/view>" + " parecer do revisor" + "</a>"); 
    	addMessage("Acessar página da submissão: " + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }

    public void fillMsgMANAGER_REV_Q_APPROVED(String ilcdName, Long idQualidataIlcd, Long ilcdId){
    	setSubject("Revisão Qualidata finalizada com parecer favorável – APROVADO.");
    	addMessage("Veja o " + "<a href=\"<%=Strings.BASE%>/qualityreview/" + idQualidataIlcd + "/view>" + " parecer do revisor" + "</a>"); 
    	addMessage("Acessar página da submissão: " + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_REV_T_APPROVED(String ilcdName, Long idTechnicalReviwerIlcd, Long ilcdId){
    	setSubject("Revisão Técnica finalizada com parecer favorável – APROVADO.");
    	addMessage("Veja o " + "<a href=\"<%=Strings.BASE%>/technicalreview/" + idTechnicalReviwerIlcd + "/view>" + " parecer do revisor" + "</a>"); 
    	addMessage("Acessar página da submissão: " + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + ilcdName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
    public void fillMsgMANAGER_APPROVED(String ilcdName, Long ilcdId){
    	setSubject("Submissão APROVADA.");
    	addMessage("A submissão " + "<a href=\"<%=Strings.BASE%>/gestor/" + ilcdId + ">" + ilcdName + "</a>" + "foi revisada, aprovada e está aguardando publicação.");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }

    public void fillMsgADMIN_NEW_REG(Long userId, String userName){
    	setSubject("Cadastro de usuário");
    	addMessage("Novo cadastro realizado no sistema:");
    	addMessage("<a href=\"<%=Strings.BASE%>/profile/" + userId.toString() + ">" + userName + "</a>");
    	setIsVisualized(false);
    	setNotifyDate(new Date());
    }
    
}
