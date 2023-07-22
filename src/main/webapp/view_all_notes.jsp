<!-- Java code to fetch the list of all notes -->
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%
Session newSession = FactoryProvider.getFactory().openSession();
Query q = newSession.createQuery("FROM Note");
List<Note> allNotes = q.list();
newSession.close();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Notes</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container col-md-9">
		<%@include file="navbar.jsp"%>
	</div>

	<!-- Body to display the notes starts here -->
	<div class="container my-4 col-md-8">
	<h1>All Notes:</h1>
		<div class="row">
			<%
			for (Note note : allNotes)
			{
			%>
			<div class="col-md-4 mb-4">
				<div class="card m-4" style="width: 280px; border: 2px solid;">
					<div class="card-body">
						<h3 class="card-title">Title: <%=note.getTitle()%></h3>
						<p class="card-text"><%=note.getContent()%></p>
						<p><i>On: <%=note.getAddedOn().toLocaleString()%></i></p>
						<div class="container text-center">
							<a href="DeleteNoteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit_note.jsp?note_id=<%= note.getId() %>"" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!-- Body to display the notes ends here -->
</body>
</html>