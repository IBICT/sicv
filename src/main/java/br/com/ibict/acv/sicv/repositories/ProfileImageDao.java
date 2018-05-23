package br.com.ibict.acv.sicv.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ibict.acv.sicv.model.ProfileImage;
import br.com.ibict.acv.sicv.model.User;

@Transactional
public interface ProfileImageDao extends JpaRepository<ProfileImage, Long> {
    
    public ProfileImage findById(Long id);
    
    public ProfileImage findByUser(User user);
    
}
