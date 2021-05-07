package net.cyberdone.commutator.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User getUser(String email) {
        log.info("getting user from database by email {}", email);
        return userRepository.findUserByEmail(email)
                .orElseThrow(EntityNotFoundException::new);
    }


    public User createUser(User user) {
        log.info("creating user {}", user);
        if (!userRepository.existsUserByEmail(user.getEmail()))
            return userRepository.save(user);
        throw new EntityExistsException();
    }

    public User updateUser(User user) {
        log.info("updating user in database: {}", user);
        return userRepository.save(user);
    }

    public void deleteUser(String email)  {
        log.info("deleting user in database by email {}", email);
        User user = userRepository.findUserByEmail(email)
                .orElseThrow(EntityNotFoundException::new);
        userRepository.delete(user);
    }
}
