package br.com.ibict.acv.sicv.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ibict.acv.sicv.model.Homologacao;

@Transactional
public interface HomologacaoDao extends JpaRepository<Homologacao, Long> {

	public List<Homologacao> findByUser(Long user);
    
}
