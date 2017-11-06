package br.com.ibict.acv.sicv;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import br.com.ibict.sicv.enums.EnumProfile;

/**
 * Resolve url after success authentication by spring security. The target url depends on users authority they have.
 * 
 * @author Wellington Stanley
 */
@Component
public class CustomAuthenticationHandler implements AuthenticationSuccessHandler{

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		String targetUrl = determineTargetUrl(authentication);

		if (response.isCommitted()) {
			//System.out.println("Can't redirect");
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	/*
	 * This method extracts the roles of currently logged-in user and returns
	 * appropriate URL according to his/her role.
	 */
	protected String determineTargetUrl(Authentication authentication) {
		String url = "";

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority a : authorities) {
			roles.add(a.getAuthority());
		}

		if ( isAdmin(roles) || isManager(roles) ) {
			url = "/";
		} else if (isQualityReviewer(roles)) {
			url = "/";
		} else if (isUser(roles)) {
			url = "/";
		} else {
			url = "/403";
		}
		return url;
	}

	private boolean isUser(List<String> roles) {
		if ( roles.contains( EnumProfile.USER.name()) && roles.size() == 1 ) {
			return true;
		}
		return false;
	}

	private boolean isQualityReviewer(List<String> roles) {
		if ( roles.contains(EnumProfile.QUALITY_REVIEWER.name()) ) {
			return true;
		}
		return false;
	}
	
	private boolean isManager(List<String> roles) {
		if ( roles.contains(EnumProfile.MANAGER.name()) ) {
			return true;
		}
		return false;
	}

	private boolean isAdmin(List<String> roles) {
		if (roles.contains(EnumProfile.ADMIN.name())) {
			return true;
		}
		return false;
	}

	public boolean hasRole(String role) {
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();
		boolean hasRole = false;
		for (GrantedAuthority authority : authorities) {
			hasRole = authority.getAuthority().equals(role);
			if (hasRole) {
				return hasRole;
			}
		}
		return hasRole;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

}
