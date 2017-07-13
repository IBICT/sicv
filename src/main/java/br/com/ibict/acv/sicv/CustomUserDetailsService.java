package br.com.ibict.acv.sicv;

//import br.com.ibict.acv.sicv.SUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class CustomUserDetailsService implements UserDetailsService {
    //@Autowired
    //private SUserService suserService;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        /*SUser user = suserService.findUserByEmail(userName);
        if (user == null) {
            throw new UsernameNotFoundException("UserName " + userName + " not found");
        }*/
        return null;//new SecurityUser(user);
    }
}
