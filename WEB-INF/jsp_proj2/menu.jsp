<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!-- Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 -->
<head>
	<title>Main Menu</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />        
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<!--link rel="stylesheet" href="/jadrn045/css/main.css" /-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<link rel="stylesheet" href="/jadrn045/css/tab_example.css" />
    <script src="/jquery/jquery.js"></script>
    <script src="/jquery/jQueryUI.js"></script>
    <script src="/jadrn045/javascripts/format.js"></script>
    <script src="/jadrn045/javascripts/menu.js"></script>
	<script type="text/javascript">
	$(document).ready( function() {
	
	    $("#datepicker").datepicker({
	    });
	    var myDate = new Date();
	    var currentDate = (myDate.getMonth()+1) + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#datepicker").val(currentDate);
		$("#datepicker1").val(currentDate);

	$("#datepicker1").datepicker({
	    });
	    var myDate = new Date();
	    var currentDate = (myDate.getMonth()+1) + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#datepicker").val(currentDate);
		$("#datepicker1").val(currentDate);
	});




</script>
<script>
    function changecolor(evt, tab) {
      var i, x, tablinks;
      x = document.getElementsByClassName("tab");
      for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" tab-red", "");
    }
    document.getElementById(tab).style.display = "block";
    evt.currentTarget.className += " tab-red";

    //  $('#sku').prop('autofocus',false);
    // $('#d_sku').prop('autofocus',false);
    //   $('#e_sku').prop('autofocus',false);

   /* if (tab == "tabs-1")
      document.getElementById("sku").focus();

    if (tab == "tabs-2")
      document.getElementById("e_sku").focus();*/

  
    }
  </script> 
</head>

<body>
   <div id="container">
	    <div class="Proj_Heading">
	        <h1>Be You Cosmetics</h1>
		</div>
		
		<div id="logout">
        	<form method="post">
            	<input type="button" id="logout_button" name="action" value="Logout" class="logout_button"/>
            </form>
        </div>
		
        <div id="tabs">
			<ul>
				<li><a href="#tabs-1" class="tablink tab-red" onclick= "changecolor(event, 'tabs-1');"><span>Merchandise In</span></a></li>
				<li><a href="#tabs-2" class="tablink" onclick= "changecolor(event, 'tabs-2');"><span>Merchandise Out</span></a></li>
			</ul>
	  
	    
        <form id="product_details" method="post" action="/jadrn045/servlet/DispatchServlet"> 
        <div id="tabs-1" class="multitab tab">
         
			
    <table  style="border:0px" class="product_table">
	<h4>Enter the SKU to add products in Inventory</h4>

		<tr class = "product">
			<td style = "width:150px"><label for="in_sku">
					       <b>Enter SKU:</b>
					   </label></td>
			<td style = "width:150px"><input type="text" id="in_sku" name="sku" size="20"/> 
					   	  <div id = "SKU_error"></div> </td>
						  <input type="hidden" id="product_sku" name="product_sku" value="" ></td>
		</tr>
    	<tr>
            <td><label>Quantity:</label></td>
            <td><input type="number" id="quantity" name="quantity"/>
			<div id = "quantity_error"></div> </td>
		</tr>
		<tr>
            <td><label>Date:</label></td>
            <div id="dp">
            <td><input type="text" id="datepicker" name="datepicker"/></td>
            </div>
        </tr>
        
		<tr class="product">
            <td><label>Category:</label></td>
            <td><label id="category_label"></label></td>
        </tr>
        <tr class="product">
            <td><label>Vendor:</label></td>
            <td><label id="vendor_label"></label></td>
		</tr>
		<tr class="product">
            <td><label>Manufacturer's Identifier:</label></td>
            <td><label id="manufacture_id_label"></label></td>
        </tr>
        
         
        <tr>
            <td><label>Product Image:</label></td>
            <td colspan="3"><img src="" id="product_image_label" 
            				alt="" width=170 height=170 class="image"/></td>
        </tr>
        <tr>
            <td align="right"><input type="submit" value="merchandise_in" name="action" id="in" disabled /></td>
            
		</tr>
		<tr>
            <td align="center"><input type="reset" value="Reset" name="reset" id="reset" /></td>
            
		</tr>
    </table>
    </br>

	</div>
	</form>
		
<form id="product_details1" method="post" action="/jadrn045/servlet/DispatchServlet"> 		
			<div id="tabs-2" class="multitab tab">
         
			
    <table  style="border:0px" class="product_table">
	<h4>Enter the SKU to take out products from the Inventory</h4>

		<tr class = "product">
			<td style = "width:150px"><label for="out_sku">
					       <b>Enter SKU:</b>
					   </label></td>
			<td style = "width:150px"><input type="text" id="out_sku" name="sku" size="20"/> 
					   	  <div id = "SKU_error"></div> </td>
						  <input type="hidden" id="product_sku1" name="product_sku1" value="" ></td>
		</tr>
    	
		<tr>
            <td><label>Quantity:</label></td>
            <td><input type="number" id="quantity1" name="quantity1"/>
			<div id = "quantity_error1"></div></td>
		</tr>
		<tr>
            <td><label>Date:</label></td>
            <td><input type="text" id="datepicker1" name="datepicker1"/></td>
        </tr>
        <tr>
		
        <tr class="product">
            <td><label>Category:</label></td>
            <td><label id="category_label1"></label></td>
        </tr>
        <tr class="product">
            <td><label>Vendor:</label></td>
            <td><label id="vendor_label1"></label></td>
		</tr>
		<tr class="product">
            <td><label>Manufacturer's Identifier:</label></td>
            <td><label id="manufacture_id_label1"></label></td>
        </tr>
        
         
            <td><label>Product Image:</label></td>
            <td colspan="3"><img src="" id="product_image_label1" 
            				alt="" width=170 height=170 class="image"/></td>
        </tr>
        <tr>
            
            <td><input type="submit" value="merchandise_out" name="action" id="out" disabled /></td>
		</tr>
		<tr>
            <td align="center"><input type="reset" value="Reset" name="reset" id="reset1" /></td>
            
		</tr>
    </table>
    </br>

         </div>
		 </form>
		 </div>
</div>
        	<div id="status"></div>
     
</body>
</html>


