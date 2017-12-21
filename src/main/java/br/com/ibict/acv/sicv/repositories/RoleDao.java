package br.com.ibict.acv.sicv.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import br.com.ibict.acv.sicv.model.Role;

public interface RoleDao extends JpaRepository<Role, Long> {

	  /**
	   * Return the user having the passed email or null if no user is found.
	   * 
	   * @param email the user email.
	   */
	  public Role findByRole(String role);
	  
}
