package net.cyberdone.commutator.service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.cyberdone.commutator.model.dto.UserDto;
import net.cyberdone.commutator.model.entity.User;
import net.cyberdone.commutator.model.entity.enums.Role;
import net.cyberdone.commutator.model.entity.enums.Status;
import net.cyberdone.commutator.model.repository.UserRepository;
import net.cyberdone.commutator.service.mail.MailSenderService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.Optional;
import java.util.UUID;

import static net.cyberdone.commutator.service.mail.MailSenderService.REGISTRATION_ACTIVATE_EMAIL;

@Slf4j
@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final MailSenderService mailSenderService;
    @Qualifier("MyPasswordEncoder")
    private final PasswordEncoder passwordEncoder;

    public User getUser(String email) {
        log.info("getting user from database by email {}", email);
        User user = userRepository.findUserByEmail(email)
                .orElseThrow(EntityNotFoundException::new);
        if (user.getActivationCode() != null) {
            throw new EntityNotFoundException();
        }
        return user;
    }


    public User createUser(UserDto userDto) {
        User user = new User();
        user.setEmail(userDto.getEmail());

        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        log.info("creating user {}", user);
        if (!userRepository.existsUserByEmail(user.getEmail())) {
            user.setStatus(Status.ACTIVE);
            user.setRole(Role.USER);
            user.setActivationCode(UUID.randomUUID().toString());

            String greeting = String.format(REGISTRATION_ACTIVATE_EMAIL,
                    user.getFirstName() + " " + user.getLastName(),
                    user.getActivationCode()
            );
            mailSenderService.sendMessage(user.getEmail(), "Код активації Cyber Done Commutator", greeting);


            return userRepository.save(user);
        }
        throw new EntityExistsException();
    }


    public User updateUser(User user) {
        log.info("updating user in database: {}", user);
        return userRepository.save(user);
    }

    public void deleteUser(String email) {
        log.info("deleting user in database by email {}", email);
        User user = userRepository.findUserByEmail(email)
                .orElseThrow(EntityNotFoundException::new);
        userRepository.delete(user);
    }

    public boolean activateUser(String code) {
        Optional<User> userByActivationCode = userRepository.findUserByActivationCode(code);
        if (userByActivationCode.isPresent()) {
            User user = userByActivationCode.get();
            user.setActivationCode(null);
            userRepository.save(user);
            return true;
        }
        return false;
    }

    @Transactional
    public boolean deleteNotActivatedUser(String code) {
        Optional<User> userByActivationCode = userRepository.findUserByActivationCode(code);
        if (userByActivationCode.isPresent()) {
            User user = userByActivationCode.get();
            userRepository.deleteUserByEmail(user.getEmail());
            return true;
        }
        return false;
    }

}
