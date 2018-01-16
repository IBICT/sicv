package br.com.ibict.acv.sicv.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Archive;
import java.util.List;

@Transactional
public interface ArchiveDao extends JpaRepository<Archive, Long> {
    
    public Archive findById(Long id);
    
}
