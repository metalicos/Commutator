package net.cyberdone.commutator.auth;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<User> userByEmail;
        try {
            userByEmail = userRepository.findUserByEmail(email);
        } catch (Exception ex) {
            log.info("Exception while find username as email (UserDetailsServiceImpl) \n {}", ex.getMessage());
            throw new UsernameNotFoundException("User name (EMAIL) was not found");
        }
        if (userByEmail.isPresent()) {
            return new MyUserDetails(userByEmail.get());
        }
        throw new UsernameNotFoundException("User name (EMAIL) was not found");
    }
}
