package br.com.ibict.acv.sicv.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.ibict.acv.sicv.model.Notification;
import br.com.ibict.acv.sicv.model.User;

@Transactional
public interface NotificationDao extends JpaRepository<Notification, Long> {

    //public List<Notification> findByUser(Long user);

    /*
     @Modifying
     @Query("update ilcd i set i.id = ?1, i.name = ?2, i.type = ?3, i.location = ?4, i.clasification = ?5, i.yearToReference = ?6, i.yearToValidate = ?7, i.pathFile = ?8 where i.id = ?9")
     void setIlcdInfoById(String id, String name, String type, String location, String clasification, Date yearToReference, Date yearToValidate, String pathFile, String whereId);
     */

    @Query("SELECT n FROM Notification n WHERE n.user.id = :idUser")
    public List<Notification> findByIdUser(@Param("idUser") Long idUser);
}
