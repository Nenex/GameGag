package com.gamegag.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamegag.dropzone.controller.FileController;
import com.gamegag.user.dto.ProfilForm;
import com.gamegag.user.model.User;
import com.gamegag.user.repository.UserRepository;
import com.gamegag.user.service.UserService;

@Controller
public class MemberController {

	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);

	protected static final String VIEW_PUBLIC_PROFIL = "user/profil";
	protected static final String VIEW_PUBLIC_PROFIL_EDIT = "user/edit";

	@Autowired
	private UserRepository repository_user;
	@Autowired
	private UserService service;

	@RequestMapping(value = "/user/profil", method = RequestMethod.GET)
	public String showPublicProfilPage(Model model) {
		LOGGER.debug("Rendering public profil page.");
		// Authentication auth =
		// SecurityContextHolder.getContext().getAuthentication();
		// if (!(auth instanceof AnonymousAuthenticationToken)) {
		// }
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		final User user = repository_user.findByEmail(userDetails.getUsername());
		// model.addAttribute("id",user.getId());

		FileController file = new FileController("profil");

		ProfilForm dto = new ProfilForm();
		dto.setFirstName(user.getFirstName());
		dto.setLastName(user.getLastName());
		dto.setPassword("xxx");

		LOGGER.debug("Rendering profil form with information: {}", dto);

		model.addAttribute("profil", dto);
		
		model.addAttribute("fileName", file.getFileName(user.getId()));
		model.addAttribute("firstName", user.getFirstName());
		model.addAttribute("lastName", user.getLastName());

		return VIEW_PUBLIC_PROFIL;
	}

	/*
	 * @RequestMapping(value="/user/profil/edit", method = RequestMethod.GET)
	 * public String showPublicProfilEditPage(HttpServletRequest request,Model
	 * model) { //Long id = Long.parseLong(request.getParameter("id"),10);
	 * LOGGER.debug("Rendering public profil edit page."); UserDetails
	 * userDetails =
	 * (UserDetails)SecurityContextHolder.getContext().getAuthentication().
	 * getPrincipal(); final User user =
	 * repository_user.findByEmail(userDetails.getUsername());
	 * //model.addAttribute("id",user.getId());
	 * 
	 * FileController file = new FileController("profil");
	 * 
	 * model.addAttribute("fileName",file.getFileName(user.getId()));
	 * model.addAttribute("firstName",user.getFirstName());
	 * model.addAttribute("lastName",user.getLastName());
	 * model.addAttribute("id",user.getId());
	 * 
	 * return VIEW_PUBLIC_PROFIL_EDIT; }
	 */

	@RequestMapping(value = "/user/profil", method = RequestMethod.POST)
	public @ResponseBody JsonResponse doLogin(@Valid @ModelAttribute(value = "profil") ProfilForm profil,
			BindingResult result, HttpServletRequest request) {

		JsonResponse res = new JsonResponse();

		ValidationUtils.rejectIfEmpty(result, "firstName", "firstName can not be empty.");
		ValidationUtils.rejectIfEmpty(result, "lastName", "lastName can not be empty.");
		try {
			if (!result.hasErrors()) {
				UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
						.getPrincipal();
				User user = repository_user.findByEmail(userDetails.getUsername());

				// user = createUserProfil(userProfilData, result);

				String firstName = profil.getFirstName();
				String lastName = profil.getLastName();
				String password = profil.getPassword();

				Boolean modif = false;
				LOGGER.debug("==============");
				if (!password.isEmpty()) {
					user.setPassword(service.changeUserPassword(user, password));
					modif = true;
				}
				if (!firstName.equals(user.getFirstName())) {
					user.setFirstName(firstName);
					modif = true;
				}
				if (!lastName.equals(user.getLastName())) {
					user.setLastName(lastName);
					modif = true;
				}
				if (modif.equals(true)) {
					repository_user.save(user);
				}
				res.setStatus("SUCCESS");
				res.setResult(user.getId());
				LOGGER.debug(res.getResult().toString());

			} else {
				res.setStatus("FAIL");
				res.setResult(result.getAllErrors());
			}

		} catch (Exception e) {
			LOGGER.debug(e.getMessage());
			res.setStatus("FAIL");
			res.setResult(1432L);
		}
		return res;
	}

}
