package org.mitre.openid.connect.web;

import org.mitre.oauth2.repository.AuthenticationHolderRepository;
import org.mitre.openid.connect.model.Authority;
import org.mitre.openid.connect.model.DefaultUserInfo;
import org.mitre.openid.connect.model.User;
import org.mitre.openid.connect.model.UserInfo;
import org.mitre.openid.connect.service.UserInfoService;
import org.mitre.openid.connect.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping(value = OnlineRegistrationEndpoint.URL)
public class OnlineRegistrationEndpoint {

	public static final String URL = "registration";

	private final UserInfoService userInfoService;

	private final UserService userService;

	@Autowired
	public OnlineRegistrationEndpoint(UserService userService, UserInfoService userInfoService, AuthenticationHolderRepository authenticationHolderRepository) {
		this.userService = userService;
		this.userInfoService = userInfoService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String displayRegitrationPage(Model model) {
		UserDTO userDTO = new UserDTO();
		model.addAttribute("user", userDTO);
		return "registration";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView registerNewUser(@ModelAttribute("user") @Valid UserDTO accountDTO,
										BindingResult result) {
		if (!result.hasErrors()) {
			User user = mapDtoToUser(accountDTO);
			UserInfo userInfo = mapDtoToUserInfo(accountDTO);

			userService.registerNewUser(user);
			userInfoService.registerNewUser(userInfo);
			userService.registerUserAuthority(new Authority(user, "ROLE_USER"));

		} else {
			return new ModelAndView("registration", "user", accountDTO);
		}

		return new ModelAndView("registration_success", "user", accountDTO);
	}

	private UserInfo mapDtoToUserInfo(UserDTO userDTO) {
		final UserInfo userInfo = new DefaultUserInfo();
		userInfo.setPreferredUsername(userDTO.getUserName());
		userInfo.setEmail(userDTO.getEmail());
		userInfo.setPhoneNumber(userDTO.getPhone());
		return userInfo;
	}

	private User mapDtoToUser(UserDTO userDTO) {
		final User user = new User();
		user.setUsername(userDTO.getUserName());
		user.setPassword(userDTO.getPassword());
		user.setEnabled(true);
		return user;
	}
}
