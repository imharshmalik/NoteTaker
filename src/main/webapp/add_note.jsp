<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Note</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container col-md-9">
		<%@include file="navbar.jsp"%>
	</div>

	<!-- Form to add new note starts -->
	<div class="container col-md-8 my-5"
		style="border: 2px dashed black; padding: 5px 10px 15px;">
		<h2 class="text-center">You are adding a new note</h2>
		<form id="add_note_form" action="SaveNoteServlet" method="post">
			<div class="m-4">
				<label for="title" class="form-label">Note Title:</label> <input
					required type="text" class="form-control" name="title">
			</div>
			<div class="m-4">
				<label for="content" class="form-label">Note Content:</label>
				<textarea class="form-control" name="content" style="height: 200px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-outline-primary">Add
					Note</button>
			</div>
		</form>
	</div>
	<!-- Form to add new note ends -->

	<!-- Script to run when user submits the form -->
	<script>
                     $(document).ready(function () {                  
                            $('#add_note_form').on('submit', function (event) {
                                   event.preventDefault();
                                   let form = new FormData(this);
                                   console.log(form);

                                   $.ajax({
                                          url: "SaveNoteServlet",
                                          type: "POST",
                                          data: form,
                                          processData: false,
                                          contentType: false,
                                          success: function (data, textStatus, jqXHR) {
                                                 if (data.trim() === 'added') {
                                                 swal("Success! New Note Added")
                                                         .then((value) => {
                                                                window.location = "view_all_notes.jsp";
                                                        });
                                                 }
                                                 else {                                            
                                                        swal("Something went wrong! Try again");
                                                 }
                                          }                  
                                   });
                            });
                     });
              </script>


</body>
</html>