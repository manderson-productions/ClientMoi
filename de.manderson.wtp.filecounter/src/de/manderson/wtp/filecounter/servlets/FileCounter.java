package de.manderson.wtp.filecounter.servlets;



// servlet stuff
//import java.io.FileWriter;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.commons.codec.language.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import de.manderson.wtp.filecounter.FileServlet;

@WebServlet("/FileCounter")
public class FileCounter extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	// count variable to keep track of times visited
	int count;
	
	private FileServlet servlet;
	
	// initialize the Servlet
	public void init() throws ServletException {
		servlet = new FileServlet();
		try {
			count = servlet.getCount();
		}
		catch (Exception e) {
			getServletContext().log("An exception occurred in FileCounter", e);
			throw new ServletException("An exception occurred in FileCounter" + e.getMessage());
		}
	}
	
	// post request: recieves string from iOS app, encodes various Soundex codes and returns
	// the results to the iOS app
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");

		// set up the Http session
		HttpSession session = request.getSession(true);
		// sets the interval in which count will increase
		session.setMaxInactiveInterval(5);
		// set the content type to plain text
		response.setContentType("text/plain");
		
		// printWriter for response to iOS
		PrintWriter toClient = response.getWriter();
		// store the incoming string into strToEncode
		String strToEncode = request.getParameter("param");

		// new instance of Soundex
		Soundex sndx = new Soundex();
		// new instance of DoubleMetaphone
		DoubleMetaphone doubleMetaphone = new DoubleMetaphone();
		// new instance of RefinedSoundex 
		RefinedSoundex refined = new RefinedSoundex();
				
		// prints the resulting soundex codes to the iOS device
		toClient.println("Your string says: " + strToEncode);
		toClient.println("Soundex Code is: " + sndx.encode(strToEncode));
		toClient.println("Refined Soundex code is: " + refined.soundex(strToEncode));
		toClient.println("Double Metaphone primary code is: " + doubleMetaphone.doubleMetaphone(strToEncode));
		toClient.println("Double Metaphone secondary code is: " + doubleMetaphone.doubleMetaphone(strToEncode, true));
		
		// check to see if 5 seconds have passed since the servlet was accessed
		if (session.isNew()) {
			count++;
		}
		// prints the number of times the servlet has been accessed
		toClient.println("This servlet has been accessed " + count + " times.");
		toClient.close();
	}
	// destroy session
	public void destroy() {
		super.destroy();
		try {
			servlet.save(count);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
