package es.uji.ei1027.easyrent.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.CredentialsDao;
import es.uji.ei1027.easyrent.dao.MessageDao;
import es.uji.ei1027.easyrent.domain.PopUpMessage;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.Message;
import es.uji.ei1027.easyrent.domain.User;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	private MessageDao messageDao;
	private CredentialsDao credentialsDao;

	@Autowired
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	@Autowired
	public void setCredentialsDao(CredentialsDao credentialsDao) {
		this.credentialsDao = credentialsDao;
	}
	
	@RequestMapping(value="/list")
	public String list(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		List<Message> received = messageDao.getReceivedMessages(user.getUsername());
		List<Message> sent = messageDao.getSentMessages(user.getUsername());
		model.addAttribute("received", received);
		model.addAttribute("sent", sent);
		int notRead = 0;
		for(Message m: received){
			if(!m.getAnswered()){
				notRead++;
			}
		}
		model.addAttribute("notRead", notRead);
		Integer popUpCounter = (Integer)session.getAttribute("counter");
		if(popUpCounter!=null){
			if(popUpCounter==0){
				popUpCounter++;
				session.setAttribute("counter", popUpCounter);
			}
			else{
				session.removeAttribute("counter");
				session.removeAttribute("popUp");
			}
		}
		return "message/list";
	}
	
	@RequestMapping(value="/read/{id}")
	public String read(Model model, @PathVariable int id, HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		Message message = messageDao.getMessage(id);
		message.setAnswered(true);
		messageDao.updateMessage(message);
		PopUpMessage popUp = new PopUpMessage();
		popUp.setTitle("Hecho");
		popUp.setMessage("Has marcado como contestado el mensaje del usuario " + message.getTransmitter() + ".");
		session.setAttribute("popUp", popUp);
		session.setAttribute("counter", 0);
		return "redirect:../list.html";
	}
	
	@RequestMapping(value="/answer/{id}")
	public String answer(Model model, @PathVariable int id, HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		Message message = messageDao.getMessage(id);
		String receiver = message.getTransmitter();
		message.setId(messageDao.generateId()+1);
		message.setTransmitter(message.getReceiver());
		message.setReceiver(receiver);
		message.setMessage(null);
		model.addAttribute("message", message);
		return "message/answer";
	}
	
	@RequestMapping(value="/answer/{id}", method = RequestMethod.POST)
	public String answerPost(@ModelAttribute("message") Message message, @PathVariable int id, Model model, HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		Message first = messageDao.getMessage(id-1);
		first.setAnswered(true);
		messageDao.updateMessage(first);
		message.setAnswered(false);
		PopUpMessage popUp = new PopUpMessage();
		try{
			messageDao.addMessage(message);
		} catch(Exception e){
			popUp.setTitle("Error");
			popUp.setMessage("No se ha podido mandar el mensaje a " + message.getReceiver() + ".");
			session.setAttribute("popUp", popUp);
			session.setAttribute("counter", 0);
			return "redirect:../list.html";
		}
		popUp.setTitle("Hecho");
		popUp.setMessage("Has contestado el mensaje del usuario " + message.getReceiver() + ".");
		session.setAttribute("popUp", popUp);
		session.setAttribute("counter", 0);
		return "redirect:../list.html";
	}
	
	@RequestMapping(value="/create")
	public String create(Model model, HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		Message message = new Message();
		message.setId(messageDao.generateId()+1);
		message.setTransmitter(user.getUsername());
		message.setAnswered(false);
		model.addAttribute("message", message);
		List<String> username = new LinkedList<String>();
		List<Credentials> credentials = credentialsDao.getCredentials();
		for(Credentials c: credentials){
			if(!c.getUsername().equals(user.getUsername()))
				username.add(c.getUsername());
		}
		model.addAttribute("usernames", username);
		return "message/create";
	}
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public String createPost(@ModelAttribute("message") Message message, Model model, HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		}
		PopUpMessage popUp = new PopUpMessage();
		try{
			messageDao.addMessage(message);
		} catch(Exception e){
			popUp.setTitle("Error");
			popUp.setMessage("No se ha podido mandar el mensaje a " + message.getReceiver() + ".");
			session.setAttribute("popUp", popUp);
			session.setAttribute("counter", 0);
			return "redirect:../list.html";
		}
		popUp.setTitle("Hecho");
		popUp.setMessage("Has enviado un mensaje al usuario " + message.getReceiver() + ".");
		session.setAttribute("popUp", popUp);
		session.setAttribute("counter", 0);
		return "redirect:list.html";
	}
	
}
