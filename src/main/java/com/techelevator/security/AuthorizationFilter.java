package com.techelevator.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techelevator.model.User;

public class AuthorizationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// WELL THEN...
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		User sessionUser = getUserFromSession(httpRequest);

		String urlRequested = httpRequest.getRequestURI();
		if(urlRequested.contains("/admin/") || urlRequested.contains("/restricted/")) {
			if(sessionUser == null) {
				redirectToLoginPage(httpRequest, httpResponse);
			}
		}
		if(urlRequested.contains("/admin/") && !sessionUser.getRole().equals("admin")) {
			httpResponse.sendError(403);
			return;
		}
		if(urlRequested.contains("/employee/") && (!sessionUser.getRole().equals("employee"))) {
			httpResponse.sendError(403);
			return;
		}
		chain.doFilter(request, response);
		
	}

	private void redirectToLoginPage(HttpServletRequest httpRequest, HttpServletResponse httpResponse)
			throws IOException {
		
		String originalRequest = httpRequest.getRequestURL().toString();
		String queryString = httpRequest.getQueryString();
		if(queryString != null) {
			originalRequest = originalRequest + "?" + queryString;
		}
		
		String context = httpRequest.getServletContext().getContextPath();
		httpResponse.sendRedirect(context+"/login?destination="+URLEncoder.encode(originalRequest, "UTF-8"));
	}

	private User getUserFromSession(HttpServletRequest httpRequest) {
		return (User)httpRequest.getSession().getAttribute("currentUser");
	}

	@Override
	public void destroy() {
		// MKAY.
	}

}
