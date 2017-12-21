package br.com.ibict.acv.sicv.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.ibict.acv.sicv.model.User;

@Transactional
public interface UserDao extends JpaRepository<User, Long> {

  /**
   * Return the user having the passed email or null if no user is found.
   * 
   * @param email the user email.
   */
  public User findByEmail(String email);
  
  @Query("SELECT DISTINCT u FROM User u JOIN u.roles ur "
          + "WHERE ur LIKE CONCAT('%', :perfil, '%')")
  public List<User> findByPerfil(@Param("perfil") String perfil);

} // class UserDao