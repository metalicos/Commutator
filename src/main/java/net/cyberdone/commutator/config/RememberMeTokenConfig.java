//package net.cyberdone.commutator.config;
//
//import lombok.AllArgsConstructor;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
//import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
//import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
//
//import javax.sql.DataSource;
//
//@Configuration
//@AllArgsConstructor
//public class RememberMeTokenConfig {
//
//    private final DataSource dataSource;
//
//    @Bean
//    PersistentTokenRepository getPersistentTokenRepository(){
//        PersistentTokenRepository repository = new JdbcTokenRepositoryImpl();
//        repository.createNewToken(new PersistentRememberMeToken());
//        repository.
//    }
//}
