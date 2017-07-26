package br.com.ibict.acv.sicv.repositories;

import br.com.ibict.acv.sicv.model.Homologacao;
import br.com.ibict.acv.sicv.model.Ilcd;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface HomologacaoDao extends JpaRepository<Homologacao, Long> {

    
}
