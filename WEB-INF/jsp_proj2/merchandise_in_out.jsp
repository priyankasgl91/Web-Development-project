<!-- Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 -->
<%@ page import="helpers.*" %>
<%@ page import="java.util.*" %>

<% HashMap<String,Product> productsHash = (HashMap<String,Product>)session.getAttribute("products");
Product product = productsHash.get(request.getParameter("sku")); %>

<%
if( product != null ) { %>
    <%@ include file="product_details.jsp" %>
<% }
else{ %>
	<script type="text/javascript">alert("Sku not found")</script>
<%}
%>






