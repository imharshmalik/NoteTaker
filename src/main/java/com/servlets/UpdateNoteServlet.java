package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateNoteServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int noteID = Integer.parseInt(request.getParameter("noteID").trim());
		String noteTitle = request.getParameter("title");
		String NoteContent = request.getParameter("content");
		
		Session newSession = FactoryProvider.getFactory().openSession();
		newSession.beginTransaction();
		
		Note noteObj = (Note) newSession.get(Note.class, noteID);
		noteObj.setId(noteID);
		noteObj.setTitle(noteTitle);
		noteObj.setContent(NoteContent);
		
		newSession.getTransaction().commit();
		newSession.close();
		
		response.sendRedirect("view_all_notes.jsp");
	}

}
