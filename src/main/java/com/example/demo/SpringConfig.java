package com.example.demo;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class SpringConfig {

   @Bean  
   public CommonsMultipartResolver multipartResolver() throws IOException{   
      CommonsMultipartResolver resolver = new CommonsMultipartResolver();
      resolver.setMaxUploadSize(1024*1024*10);
      resolver.setMaxUploadSizePerFile(1024*1024*2);
      resolver.setMaxInMemorySize(1024*1024);
      //resolver.setUploadTempDir(new FileSystemResource("C:\\upload"));
      resolver.setDefaultEncoding("UTF-8");
    
      return resolver;
   }   
   @Bean
   public PasswordEncoder passwordEncoder() {
      return PasswordEncoderFactories.createDelegatingPasswordEncoder();
   }
}