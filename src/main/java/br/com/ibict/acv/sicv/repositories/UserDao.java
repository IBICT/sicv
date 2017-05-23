package br.com.ibict.acv.sicv.repositories;

import br.com.ibict.acv.sicv.model.User;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface UserDao extends JpaRepository<User, Long> {

  /**
   * Return the user having the passed email or null if no user is found.
   * 
   * @param email the user email.
   */
  public User findByEmail(String email);

} // class UserDao