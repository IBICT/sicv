package br.com.ibict.acv.sicv;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.Sha512Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import br.com.ibict.acv.sicv.model.Role;
import br.com.ibict.acv.sicv.model.User;
import br.com.ibict.acv.sicv.repositories.UserDao;

/**
 * Provide authentication from user credentials to spring security. 
 * 
 * @author Wellington Stanley
 */
@Component
public class CustomAuthProvider implements AuthenticationProvider {

    @Autowired
    private UserDao userReposiroty;
    
    @Override
    public Authentication authenticate(Authentication auth) throws AuthenticationException {
        String email = auth.getName();
        String password = auth.getCredentials().toString();


        // Exception if user not fill email and password
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(password)) {
            throw new AuthenticationServiceException("Error in LOGIN recovery!!!");
        }
        
        User usuarioBd = userReposiroty.findByEmail(email);
        try{
	        if (usuarioBd != null) {
	            if (usuarioAtivo(usuarioBd)) {
	            	String hashSalt = usuarioBd.getPasswordHashSalt();
	
	            	// Data base password is encrypted
	            	boolean passwordMatch = isPasswordMatching(usuarioBd.getPasswordHash(), password, hashSalt);
	                
	            	if( passwordMatch && usuarioBd.getActive()){
	            		/*
		            	Set<GrantedAuthority> authorities = new HashSet<>();
		            	authorities.add(new  SimpleGrantedAuthority( usuarioBd.getPerfil() ));
		                Collection<? extends GrantedAuthority> authorities = usuarioBd.getPerfil();*/
		            	usuarioBd.setPlainPassword(password);
		                getHttpSession().setAttribute("user", usuarioBd);
		                return new UsernamePasswordAuthenticationToken(email, usuarioBd.getPasswordHash(), getGrantedAuthorities(usuarioBd.getRoles()));
	            	}
	            } else {
	                throw new BadCredentialsException("User is not enabled.");
	            }
	        }else
	        	throw new UsernameNotFoundException("Credentials not matching.");
	        	return null;
        }catch(AuthenticationServiceException e){
            throw e;
        }catch(Throwable e){
            throw new AuthenticationServiceException("A error ocurred while authenticate.", e);
        }
    }

    @Override
    public boolean supports(Class<?> auth) {
        return auth.equals(UsernamePasswordAuthenticationToken.class);
    }
    
    private List<GrantedAuthority> getGrantedAuthorities(Set<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return authorities;
    }
    

    private boolean usuarioAtivo(User usuario) {
        if (usuario != null) {
        	//TODO criar status para usuário se esta ativo ou nao
//            if (usuario.getStatus() == true) {
            return true;
        }
        	return false;
    }
    
    private boolean isPasswordMatching(String passwordHashBd, String password, String hashSalt){
    	password = new Sha512Hash( password, hashSalt, 5 ).toHex();
    	
    	return password.equals(passwordHashBd);    	
    }
    
    public static HttpSession getHttpSession() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest().getSession(true);
    }
    
}
