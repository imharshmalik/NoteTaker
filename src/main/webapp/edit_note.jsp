<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%
int noteID = Integer.parseInt(request.getParameter("note_id").trim());
Session newSession = FactoryProvider.getFactory().openSession();
Note noteObj = (Note) newSession.get(Note.class, noteID);
newSession.close();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container col-md-9">
		<%@include file="navbar.jsp"%>
	</div>
	
	<!-- Form to edit note starts -->
	<div class="container col-md-8 my-5"
		style="border: 2px dashed black; padding: 5px 10px 15px;">
		<h2 class="text-center">You are updating a note</h2>
		<form id="update_note_form" action="UpdateNoteServlet" method="post">
		<input value="<%= noteObj.getId()%>" name="noteID" type="hidden">
			<div class="m-4">
				<label for="title" class="form-label">New Title:</label> 
				<input required type="text" class="form-control" name="title" value="<%= noteObj.getTitle()%>">
			</div>
			<div class="m-4">
				<label for="content" class="form-label">New Content:</label>
				<textarea class="form-control" name="content" style="height: 200px;"><%= noteObj.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-outline-success">Update</button>
			</div>
		</form>
	</div>
	<!-- Form to edit note ends -->
	
</body>
</html>