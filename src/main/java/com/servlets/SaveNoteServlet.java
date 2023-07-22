package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import com.entities.Note;
import com.helper.FactoryProvider;

@MultipartConfig
public class SaveNoteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
 
    public SaveNoteServlet() 
    {
	    super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			PrintWriter out = response.getWriter();
			String postTitle = request.getParameter("title");
			String postContent = request.getParameter("content");
			
			Note newNote = new Note(postTitle, postContent, new Date());
			
			Session newSession = FactoryProvider.getFactory().openSession();
			newSession.beginTransaction();
			newSession.save(newNote);
			out.println("added");
			newSession.getTransaction().commit();
			newSession.close();
			out.flush();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
