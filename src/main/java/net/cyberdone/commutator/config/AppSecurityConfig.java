package net.cyberdone.commutator.config;

import lombok.AllArgsConstructor;
import net.cyberdone.commutator.auth.UserDetailsServiceImpl;
import net.cyberdone.commutator.model.repository.UserRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.util.concurrent.TimeUnit;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

    // private final DataSource dataSource;
    private final UserRepository userRepository;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/",
                        "/auth/registration",
                        "/auth/forgot-password",
                        "/auth/activate/*",
                        "/auth/check-email-page",
                        "/auth/remove-account/*",
                        "/auth/logout",
                        "/auth/login",
                        "/css/**",
                        "/js/**",
                        "/img/**").permitAll()
                .anyRequest().authenticated()

                .and()
                .formLogin()
                .loginPage("/auth/login")
                .defaultSuccessUrl("/devices", true)
                .usernameParameter("email")
                .passwordParameter("password")
                .permitAll()

                .and()
                .rememberMe()
                .tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
                .key("5e6R78-3x45c6-Sh4Fe-DfdSeR-53F3HyY")
                .rememberMeCookieName("REMEMBERME")
                .rememberMeParameter("remember-me")

                .and()
                .exceptionHandling()
                .accessDeniedPage("/accessDenied")

                .and()
                .logout()
                .logoutUrl("/auth/logout")
                .logoutRequestMatcher(new AntPathRequestMatcher("/auth/logout", "GET"))
                .logoutSuccessUrl("/auth/login")
                .clearAuthentication(true)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID", "REMEMBERME")
                .permitAll();


    }

    @Bean(name = "MyPasswordEncoder")
    PasswordEncoder getPassEncoder() {
        return new BCryptPasswordEncoder(10);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(new UserDetailsServiceImpl(userRepository))
                .passwordEncoder(getPassEncoder());
    }

/*

@Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/",
                        "/auth/registration",
                        "/auth/forgot-password",
                        "/auth/activate/*",
                        "/auth/check-email-page",
                        "/auth/remove-account/*",
                        "/auth/logout",
                        "/auth/login",
                        "/css/**",
                        "/js/**",
                        "/img/**").permitAll()
                .anyRequest().authenticated()

                .antMatchers(
                        "/devices", "/devices/*",
                        "/schedules", "/schedules/*",
                        "/timers", "/timers/*")
                .hasAnyRole(USER.name(), ADMIN.name())

                .antMatchers("/redactor","/redactor/*")
                .hasRole(ADMIN.name())


                .and()
                .formLogin()
                .loginPage("/auth/login")
                .defaultSuccessUrl("/devices", true)
                .usernameParameter("email")
                .passwordParameter("password")

                .and()
                .rememberMe()
                .tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
            .key("SECURED_KEY_zpemcYhsLlJDrJ:LPLGDE")
                .rememberMeCookieName("REMEMBERME")
                .rememberMeParameter("remember-me")

                .and()
                .logout()
                .logoutUrl("/auth/logout")
                .logoutRequestMatcher(new AntPathRequestMatcher("/auth/logout", "GET"))
            .logoutSuccessUrl("/auth/login")
                .clearAuthentication(true)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID", "REMEMBERME");


}
    @Bean
    @Override
    public UserDetailsService userDetailsServiceBean() throws Exception {
        UserDetails userUser = User.builder()
                .username("user")
                .password(passwordEncoder.encode("password"))
                //.roles(USER.name())
                .authorities(USER.grantedAuthorities())
                .build();
        UserDetails userAdmin = User.builder()
                .username("admin")
                .password(passwordEncoder.encode("password"))
                //.roles(ADMIN.name())
                .authorities(ADMIN.grantedAuthorities())
                .build();
        UserDetails userLowAccessAdmin = User.builder()
                .username("admin-5")
                .password(passwordEncoder.encode("password"))
                //.roles(LOW_ACCESS_ADMIN.name())
                .authorities(LOW_ACCESS_ADMIN.grantedAuthorities())
                .build();
        return new InMemoryUserDetailsManager(
                userUser,
                userAdmin
        );
    }
*/

/*
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .passwordEncoder(NoOpPasswordEncoder.getInstance())
                .usersByUsernameQuery("select email, password, active from user where username=?")
                .authoritiesByUsernameQuery("select u.email, ")
    }
 */
}
