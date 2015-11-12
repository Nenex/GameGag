<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>


<jsp:include page="/WEB-INF/views/pages/header.jsp">
	<jsp:param name="param1" value="plouf"/>
</jsp:include>

<body>
	<h1>Hello world!</h1>
${apprentis[0].firstname}
</body>
</html>
