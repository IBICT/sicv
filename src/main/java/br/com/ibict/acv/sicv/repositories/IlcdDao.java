package br.com.ibict.acv.sicv.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.ibict.acv.sicv.model.Ilcd;

@Transactional
public interface IlcdDao extends JpaRepository<Ilcd, Long> {

    public List<Ilcd> findByBase(Long base);

    public Ilcd findByUuid(String UUID);
    
    public Ilcd findById(Long id);
    
    /*s.status=0 and (s.serviceType=9 or 'College' in elements(s.tags)) 
    @Query("SELECT i FROM Ilcd i WHERE i.emails[emails] =:email")
    public List<Ilcd> findByEmail(@Param("email") String email);*/
    
    @Query("SELECT DISTINCT i FROM Ilcd i JOIN i.emails e "
            + "WHERE e LIKE CONCAT('%', :emails, '%')")
    public List<Ilcd> findIlcdsByLikeEmail(@Param("emails") String email);
    

    /*
     @Modifying
     @Query("update ilcd i set i.id = ?1, i.name = ?2, i.type = ?3, i.location = ?4, i.clasification = ?5, i.yearToReference = ?6, i.yearToValidate = ?7, i.pathFile = ?8 where i.id = ?9")
     void setIlcdInfoById(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile, String whereId);
     */
}
