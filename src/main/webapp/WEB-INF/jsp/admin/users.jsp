<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="container">
<table id="user-list-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Date de cr�ation</th>
                <th>Email</th>
                <th>Nom</th>
                <th>Pr�nom</th>
                <th>Role</th>
                <th>Provider</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="user" items="${user}">
        
			<tr>
				<td>${user.creationTime}</td>
				<td>${user.email}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.role}</td>
				<td>${user.signInProvider}</td>
				<td>
					<a href="/admin/manage_role/?id=${user.id}&role=${user.role}&person=${user.firstName}%20${user.lastName}" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">editer</a>
				</td>
			</tr>
		</c:forEach> 
        </tbody>
        </table>
          <!-- Modal HTML -->
	    <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <!-- Content -->
	            </div>
	        </div>
	    </div>
        </div>
       
	  
<script src="${pageContext.request.contextPath}/static/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	    $('#user-list-table').DataTable({
	    });
	    
	});
	
	$('#myModal').on('hidden.bs.modal', function () {
	   $('#myModal').removeData('bs.modal');
	   $('#myModal').find('.modal-content').html('');
	});
</script>
</body>
</html>

