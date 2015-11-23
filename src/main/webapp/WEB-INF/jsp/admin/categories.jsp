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
<div class="container">
<table id="category-list-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Label</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="category" items="${categories}">
			<tr>
				<td>${category.label}</td>
				<td>
				<%-- <a href="/admin/manage/?id=${user.id}">editer</a> --%>
				<a href="/admin/manage_category/?id=${category.id}" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">editer</a>
			</td>
			</tr>
			
		</c:forEach> 
        </tbody>
        </table>
        </div>
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
    $('#category-list-table').DataTable({
    });
    
} );
</script>


</body>
</html>

