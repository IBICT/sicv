package br.com.ibict.acv.sicv.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ibict.acv.sicv.model.Ilcd;
import br.com.ibict.acv.sicv.model.Status;

@Transactional
public interface StatusDao extends JpaRepository<Status, Long> {
    
    public Ilcd findById(Long id);
    
//    public List<Ilcd> findByEmail(String email);

    /*
     @Modifying
     @Query("update ilcd i set i.id = ?1, i.name = ?2, i.type = ?3, i.location = ?4, i.clasification = ?5, i.yearToReference = ?6, i.yearToValidate = ?7, i.pathFile = ?8 where i.id = ?9")
     void setIlcdInfoById(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile, String whereId);
     */
}
