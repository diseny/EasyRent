<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyRent - Gestionar Facturas</title>
</head>
<body>
	<h1>Lista de facturas</h1>
	<table>
		<tr>
			<th>Numero</th>
			<th>Factura</th>
			<th>Fecha</th>
			<th>Vat</th>
		</tr>
		<c:forEach items="${invoice}" var="invoice">
			<tr>
				<td>${invoice.trackingNumber}</td>
				<td>${invoice.invoiceNumber}</td>
				<td>${invoice.invoiceDate}</td>
				<td>${invoice.vat}</td>
				<td><a href="update/${invoice.trackingNumber},${invoice.invoiceNumber}.html">Edita</a>
				<td><a href="delete/${invoice.trackingNumber},${invoice.invoiceNumber}.html">Borra</a>
			</tr>
		</c:forEach>
	</table>
	<a href="add.html">Añade Factura</a>
</body>
</html>