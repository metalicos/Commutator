package net.cyberdone.commutator.service.mail;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;

@Service
@Slf4j

public class MailSenderService {
    @Autowired
    private JavaMailSender mailSender;

    @Value("spring.mail.username")
    private String username;

    public static final String REGISTRATION_ACTIVATE_EMAIL = """
            Cyber Done Commutator
                                
            Вітаємо, %s!
                                
            Ваша заява на рейстрацію успішно оброблена нашим сервісом. Для підтвердження реєстрації перейдіть за посиланням:
            http://192.168.1.100/auth/activate/%s
                                
                                
            З повагою,
            Адміністрація сервісу Cyber Done Commutator
            """;

    public void sendMessage(String email, String subject, String message) {
        log.info("Email Message details email={}, subject={}, message={}", email, subject, message);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(username);
        mailMessage.setTo(email);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);
        mailMessage.setSentDate(Date.valueOf(LocalDate.now()));

        mailSender.send(mailMessage);
        log.info("Sending email Message {}", mailMessage);
    }
}
