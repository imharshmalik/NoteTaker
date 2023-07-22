package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Note;
import com.helper.FactoryProvider;


public class DeleteNoteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       

    public DeleteNoteServlet() 
    {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int noteID = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session newSession = FactoryProvider.getFactory().openSession();
			newSession.beginTransaction();
			
			Note noteObj = (Note) newSession.get(Note.class, noteID);
			
			newSession.delete(noteObj);			
			newSession.getTransaction().commit();
			newSession.close();
			
			response.sendRedirect("view_all_notes.jsp");
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
