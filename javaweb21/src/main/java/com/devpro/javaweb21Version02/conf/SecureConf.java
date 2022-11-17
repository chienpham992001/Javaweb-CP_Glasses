package com.devpro.javaweb21Version02.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.devpro.javaweb21Version02.services.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity // bật tính năng bảo mật
public class SecureConf extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // bắt đầu cấu hình: tất cả các requests từ 
		// trình duyệt đều được bắt trong hàm này
		
		//cho phép các request static resources không bị ràng buộc(permitAll)
		.antMatchers("/css/**", "/js/**", "/upload/**", "/img/**", "/login", "/logout").permitAll()
		
		//các request kiểu: "/admin/" phải xác thực rồi(đã login) mới được vào (authenticated)
		.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
		
		.and()
		
		//nếu chưa xác thực thì hiển thị trang login
		// /login: một request trong LoginController
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		.successHandler(authenticationSuccessHandler())
		//.defaultSuccessUrl("/home", true) // login thành công thì luôn trở về trang người dùng
		.failureUrl("/login?login_error=true")
		
		.and()
		
		//cấu hình cho phần logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}	
	
	@Autowired
	private UserDetailsServiceImpl userDetailsService;	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService)
			.passwordEncoder(new BCryptPasswordEncoder(4));
	}
	
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler(){
	    return new UrlAuthenticationSuccessHandler();
	}
	
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("1234"));
	}
}
