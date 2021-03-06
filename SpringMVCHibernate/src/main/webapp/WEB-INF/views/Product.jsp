<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Product Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Product
</h1>

<c:url var="addAction" value="/product/add" ></c:url>

<form:form action="${addAction}" modelAttribute="product">
<table>
	<c:if test="${!empty product.productName}">
	<tr>
		<td>
			<form:label path="productId">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="productId" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="productName">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="productName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="productPrice">
				<spring:message text="Price"/>
			</form:label>
		</td>
		<td>
			<form:input path="productPrice" />
		</td>
	</tr>
	<tr>
	<tr>
		<td>
			<form:label path="productCategory">
				<spring:message text="Category"/>
			</form:label>
		</td>
		<td>
			<form:input path="productCategory" />
		</td> 
	</tr>
	<tr>
	
	<tr>
		<td colspan="2">
			<c:if test="${!empty product.productName}">
				<input type="submit"
					value="<spring:message text="Edit Product"/>" />
			</c:if>
			<c:if test="${empty product.productName}">
				<input type="submit"
					value="<spring:message text="Add Product"/>" />
			</c:if>
		</td>
	</tr> 
	<tr>  <a href="refresh"><br> Refresh</a>    </tr>
</table>	
</form:form>
<br>
<h3>Product List</h3>
<c:if test="${!empty listProducts}">
	<table class="tg">
	<tr>
		<th width="80">Products ID</th>
		<th width="120">Products Name</th>
		<th width="120">Products Price</th>
		<th width="120">Products Category</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listProducts}" var="productobj">
		<tr>
			<td>${productobj.productId}</td>
			<td>${productobj.productName}</td>
			<td>${productobj.productPrice}</td>
			<td>${productobj.productCategory}</td>
			<td><a href="<c:url value='/edit/${productobj.productId}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${productobj.productId}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
