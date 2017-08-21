package br.com.ibict.acv.sicv.util;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;

@Service
public class Mail {
	
	@Autowired
    private Configuration freemarkerConfig;
	
	public void sendEmail(String to, String from, String subject, Map<String, Object> model, String template) throws Exception{

		// Using a subfolder such as /templates here
//        freemarkerConfig.setClassForTemplateLoading(this.getClass(), "/templates");
        
        freemarker.template.Template t = freemarkerConfig.getTemplate(template);
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(t, model );
		try {
			final String username = "sicv.acv@apps.ibict.br";
			final String password = "debeP3ep";
			
			Session emailSession = Session.getDefaultInstance( getProgerties(), new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });

			Message emailMessage = new MimeMessage(emailSession);
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			emailMessage.setFrom(new InternetAddress(from));
			emailMessage.setSubject(subject);
			emailMessage.setContent(text,"text/html;charset=UTF-8");
			
			emailSession.setDebug(true);
			provideCertificate();
			Transport.send(emailMessage);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * Provide a certificate to mail port 587
	 * 
	 * @author ibict
	 * */
	public static void provideCertificate() {
        final TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {

        	@Override
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
			
			@Override
			public void checkServerTrusted(X509Certificate[] chain, final String authType)
					throws CertificateException {
				
			}
			
			@Override
			public void checkClientTrusted(X509Certificate[] chain, final String authType)
					throws CertificateException {
				
			}
			
		}};
        
        try {
            final SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            SSLContext.setDefault(sc);
        } catch (final Exception e) {
            e.printStackTrace();
        }
    }
	
	public Properties getProgerties(){
		Properties properties = new Properties();
		//deve ser o servidor que o usuário deseja configurar para tarefas de email
		properties.put("mail.smtp.host", "smtp.apps.ibict.br");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		return properties;
	}
}
