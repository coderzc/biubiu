package com.web_socket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class GetHttpSessionConfigurator extends Configurator {

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		// TODO Auto-generated method stub
		HttpSession httpSession = (HttpSession) request.getHttpSession();
		sec.getUserProperties().put(HttpSession.class.getName(), httpSession);

//		ServletContext servletContext = httpSession.getServletContext();
//		sec.getUserProperties().put(ServletContext.class.getName(), servletContext);
	}

}