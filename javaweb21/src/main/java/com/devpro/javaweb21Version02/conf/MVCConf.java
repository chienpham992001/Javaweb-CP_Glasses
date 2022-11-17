package com.devpro.javaweb21Version02.conf;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/*1. Báo cho spring mvc biết đây là cấu hình
 *2. Tạo instance của cấu hình này <=> MVCConf mvc = new MVCConf();
 *mvc sẽ được lưu vào trong string-container(kiểu dữ liệu List,Map)
* */
@Configuration
public class MVCConf implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// ERROR: http://localhost:8080/css/style.css 404
		// bất cứ request nào có dạng : http://localhost:8080/css/style.css sẽ vào foder
		// src/main/resources/css
		// classpath: = /src/main/resources
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");

		// ERROR: http://localhost:8080/js/script.js 404
		// bất cứ request nào có dạng : http://localhost:8080/js/script.js sẽ vào foder
		// src/main/resources/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");

		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("classpath:/fonts/");
		// Đăng ký Folder Upload
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");
	}

	/**
	 * @Bean báo spring biết cần phải tạo instance ViewResolver vr = new
	 *       ViewResolver(); vr sẽ được lưu vào trong string-container(kiểu dữ
	 *       liệuList,Map) Spring MVC sẽ sử dụng vr để biết foder chứa view
	 * @return
	 */
	@Bean
	public ViewResolver viewResolver() {
		// Class InternalResouceViewResolver implements ViewResolver
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// Đường dẫn thư mục gốc chứa view
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của
		bean.setSuffix(".jsp");

		return bean;
	}
	
	@Override
	public Validator getValidator() {
		// TODO Auto-generated method stub
		return validator();
	}
	
	@Bean
	public LocalValidatorFactoryBean validator() {
		LocalValidatorFactoryBean v = new LocalValidatorFactoryBean();
		v.setValidationMessageSource(messageSource());
		return v;
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("message");
		return source;
	}
}
