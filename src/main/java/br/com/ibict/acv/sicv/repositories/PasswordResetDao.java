package br.com.ibict.acv.sicv.repositories;

import br.com.ibict.acv.sicv.model.PasswordReset;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author deivdy
 */

@Transactional
public interface PasswordResetDao extends JpaRepository<PasswordReset, Long> {
    
    public PasswordReset findByHash(String hash);
    
}
