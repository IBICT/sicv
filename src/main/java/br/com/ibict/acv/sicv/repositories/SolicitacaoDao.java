package br.com.ibict.acv.sicv.repositories;

import br.com.ibict.acv.sicv.model.Solicitacao;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public interface SolicitacaoDao extends JpaRepository<Solicitacao, Long> {

    
}
