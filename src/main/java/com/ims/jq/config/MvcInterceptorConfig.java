package com.ims.jq.config;


import com.ims.jq.interceptor.AuthorityInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@Slf4j
public class MvcInterceptorConfig implements WebMvcConfigurer {


    private static final String VIEW_PREFIX = "/WEB-INF/views/";// 视图前缀
    private static final String VIEW_SUFFIX = ".jsp";// 视图后缀
    private static final String VIEW_CONTENT_TYPE = "text/html;charset=UTF-8";//视图的内容类型。


//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new DoNothingInterceptor())
//                .addPathPatterns("/**")
//                .excludePathPatterns("/static/**");
//    }


    //	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
//		WebMvcConfigurer.super.addResourceHandlers(registry);
//	}


    @Override
    public void addInterceptors(InterceptorRegistry registry){

        registry.addInterceptor(new AuthorityInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/static/**","/doLogin","/logout");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/","classpath:/static/static/");
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

//    @Override
//    public void configureViewResolvers(ViewResolverRegistry registry) {
//        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//        resolver.setCache(true);
//        resolver.setPrefix(VIEW_PREFIX);
//        resolver.setSuffix(VIEW_SUFFIX);
//        resolver.setExposeContextBeansAsAttributes(true);
//        resolver.setContentType(VIEW_CONTENT_TYPE);
//        registry.viewResolver(resolver);
//    }


}


