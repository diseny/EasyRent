<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form method="post" modelAttribute="imageFile"  enctype="multipart/form-data" commandName="imageFile">
    <table>
        <tr>
           <td>Selecciona fichero: </td>
           <td><input type="file" name="fichero" /></td>
        </tr>
        <tr>
    
        </tr>
        <tr><td colspan="2" align="center">
    	<input type="submit" value="Subir fichero"></td>
        </tr>
     </table>
</form:form>
</body>
</html>