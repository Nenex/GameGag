package com.gamegag.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    protected static final String VIEW_NAME_HOMEPAGE = "index";
    protected static final String VIEW_NAME_PUBLIC = "public/index";
    protected static final String VIEW_NAME_ERROR_403 = "public/403";

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String showHomePage() {
        LOGGER.debug("Rendering homepage.");
        return VIEW_NAME_HOMEPAGE;
    }
    
    @RequestMapping(value="/public", method = RequestMethod.GET)
    public String showPublicPage() {
        LOGGER.debug("Rendering homepage.");
        return VIEW_NAME_PUBLIC;
    }
    
    @RequestMapping(value="/403", method = RequestMethod.GET)
    public String showError403Page() {
        LOGGER.debug("Rendering homepage.");
        return VIEW_NAME_ERROR_403;
    }
}
