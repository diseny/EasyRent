<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Crear nueva factura</title>
</head>
<body>
	<h2>Nueva factura</h2>
	<form:form method="post" modelAttribute="invoice">
		<table>
			<tr>
				<td><form:label path="trackingNumber">Numero</form:label></td>
				<td><form:input path="trackingNumber" /></td>
				<td><form:errors path="trackingNumber"/></td>
			</tr>
			<tr>
				<td><form:label path="invoiceNumber">Factura</form:label></td>
				<td><form:input path="invoiceNumber" /></td>
				<td><form:errors path="invoiceNumber"/></td>
			</tr>
			<tr>
				<td><form:label path="invoiceDate">Fecha</form:label></td>
				<td><form:input path="invoiceDate" /></td>
				<td><form:errors path="invoiceDate"/></td>
			</tr>
			<tr>
				<td><form:label path="vat">VAT</form:label></td>
				<td><form:input path="vat" /></td>
				<td><form:errors path="vat"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Añade factura" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>