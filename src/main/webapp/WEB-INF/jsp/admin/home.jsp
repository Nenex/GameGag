<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<table id="user-list-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Id</th>
                <th>Date de création</th>
                <th>Email</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Role</th>
                <th>Provider</th>
                <th></th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Id</th>
                <th>Date de création</th>
                <th>Email</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Role</th>
                <th>Provider</th>
                <th></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach var="user" items="${user}">
			<tr>
				<td>${user.id}</td>
				<td>${user.creationTime}</td>
				<td>${user.email}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.role}</td>
				<td>${user.signInProvider}</td>
				<td>
					<%-- <a href="/admin/manage/?id=${user.id}">editer</a> --%>
					<a href="/admin/manage/?id=${user.id}&role=${user.role}&person=${user.firstName}%20${user.lastName}" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">editer</a>
    
				</td>
			</tr>
		</c:forEach> 
        </tbody>
        </table>
        <c:forEach var="role2" items="${role2}">
		  ${role2}
		  </c:forEach>
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Content -->
            </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/static/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#user-list-table').DataTable();
} );
</script>
</body>
</html>