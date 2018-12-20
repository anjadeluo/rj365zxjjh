package cn.jade.rjzxjjh.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class AuthUtils {

	public static Authentication getAuthentication() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		return auth;
	}

	public static String getAuthorizedIp() {
		try {
			WebAuthenticationDetails details = (WebAuthenticationDetails) getAuthentication().getDetails();
			return details.getRemoteAddress();
		} catch (NullPointerException e) {
			return "";
		}
	}

	public static String getAuthorizedUser() {
		Authentication auth = getAuthentication();

		if (auth == null)
			return "";

		if (auth.getPrincipal() == null) {
			return "";
		}

		if (auth.getPrincipal() instanceof User) {
			return ((User) auth.getPrincipal()).getUsername();
		}
		if (auth.getPrincipal() instanceof UserDetails) {
			return ((UserDetails) auth.getPrincipal()).getUsername();
		}
		return "";
	}

	public static String getAttemptedUser() {
		Authentication auth = getAuthentication();

		if (auth == null)
			return "";

		return auth.getName();
	}

	public static boolean isAuthorizedFor(String... roles) {
		Authentication auth = getAuthentication();
		if (auth == null) {
			return false;
		}

		Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
		if (auths == null) {
			return false;
		}

		List<String> lr = Arrays.asList(roles);

		for (GrantedAuthority au : auths) {
			if (lr.contains(au.getAuthority())) {
				return true;
			}
		}

		return false;
	}
}
