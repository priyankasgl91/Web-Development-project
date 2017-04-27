/*Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 */
$(document).ready( function() {
$("#in_out_sku").focus();
history.go(1);
$("#tabs").tabs(); 
    $('#quantity').prop('disabled',true);
   $('#datepicker').prop('disabled',true);
 $('#quantity1').prop('disabled',true);
   $('#datepicker1').prop('disabled',true);

    $('html').on('click', function() {
        history.go(1);
        });

    $("#in_sku").on('blur',function(e){
    	var sku = $("#in_sku").val();
	 $("#datepicker").datepicker({
	    });
	    var myDate = new Date();
	    var currentDate = (myDate.getMonth()+1) + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#datepicker").val(currentDate);
		$("#datepicker1").val(currentDate);

	
	

	// Validating SKU
        if(!isEmpty(sku) && checkSkuFormat(sku)){
        	// If valid SKU get product details.	
        	$.ajax({
        		url:"/jadrn045/servlet/DispatchServlet?action=lookup&sku="+sku,
        		type:"GET",
        		success:function(response){
        			if(response != "ERROR"){
                     $('#quantity').prop('disabled',false);
                     $('#datepicker').prop('disabled',false);
                     $('#in_sku').prop('disabled',true);

            			var data = response.split("|&|");
            			$("#sku_label").text(data[0]);
                        $("#product_sku").val(data[0]);
                        $("#category_label").text(data[1]);
                        $("#vendor_label").text(data[2]);
                        $("#manufacture_id_label").text(data[3]);
                        /*$("#description_label").text(data[4]);
                        $("#features_label").text(data[5]);
                        $("#cost_label").text(data[6]);
                        $("#retail_label").text(data[7]);*/
                        $("#product_image_label").attr("src","/~jadrn045/proj1/_uploadDIR_/"+(data[8]).toLowerCase()+"?random="+Math.random());
        				$('#merchandise_in_out_form').attr('hidden',false);
        			}
        			else{
        				alert("Sku not found in the database");
        				$("#in_out_sku").val("").focus();
        			}
        		}});
        	
        }
        else{
        	alert("Enter a valid SKU");
        	$("#in_out_sku").val("").focus();
                
        }  	
    });
	$("#out_sku").on('blur',function(e){
    	var sku = $("#out_sku").val();
        $("#datepicker1").datepicker({
	    });
	    var myDate = new Date();
	    var currentDate = (myDate.getMonth()+1) + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#datepicker").val(currentDate);
		$("#datepicker1").val(currentDate);
	
	// Validating SKU
        if(!isEmpty(sku) && checkSkuFormat(sku)){
        	// If valid SKU get product details.	
        	$.ajax({
        		url:"/jadrn045/servlet/DispatchServlet?action=lookup&sku="+sku,
        		type:"GET",
        		success:function(response){
        			if(response != "ERROR"){
                   $('#quantity1').prop('disabled',false);
                     $('#datepicker1').prop('disabled',false);
                     $('#out_sku').prop('disabled',true);

            			var data = response.split("|&|");
            			$("#sku_label1").text(data[0]);
                        $("#product_sku1").val(data[0]);
                        $("#category_label1").text(data[1]);
                        $("#vendor_label1").text(data[2]);
                        $("#manufacture_id_label1").text(data[3]);
                        /*$("#description_label").text(data[4]);
                        $("#features_label").text(data[5]);
                        $("#cost_label").text(data[6]);
                        $("#retail_label").text(data[7]);*/
                        $("#product_image_label1").attr("src","/~jadrn045/proj1/_uploadDIR_/"+(data[8]).toLowerCase()+"?random="+Math.random());
        				$('#merchandise_in_out_form').attr('hidden',false);
        			}
        			else{
        				alert("Sku not found in the database");
        				$("#in_out_sku").val("").focus();
        			}
        		}});
        	
        }
        else{
        	alert("Enter a valid SKU");
        	$("#in_out_sku").val("").focus();
        }  	
    });
	
	$("#quantity").on('blur',function(e){
				var quantity = $("#quantity").val().trim();

	
        if(!checkQuantityFormat(quantity)) {
            $("#quantity_error").text('Enter appropriate quantity');
			$('#in').prop('disabled',true);
			$("#quantity").focus();
            e.preventDefault(); 
        }
        else{
			$('#quantity_error').text('');
			$('#in').prop('disabled',false);
			
            return;
		}
    });
    
	$("#quantity1").on('blur',function(e){
				var quantity = $("#quantity1").val().trim();

	
        if(!checkQuantityFormat(quantity)) {
            $("#quantity_error1").text('Enter appropriate quantity');
			$('#out').prop('disabled',true);
			$("#quantity1").focus();
            e.preventDefault(); 
        }
        else{
			$('#quantity_error1').text('');
			$('#out').prop('disabled',false);
			
            return;
		}
    });
    // Handling the logout button.
    $("#logout_button").click(function(){
    	$.ajax({
    		url:"/jadrn045/servlet/DispatchServlet?action=logout",
    		type:"GET",
    		success:function(response){
    			if(response=="SUCCESS"){
    				$('#container').html("<h1><center></center>You are now logged out</h1>");
    				window.location = "/jadrn045/logout_pg.html";
    			}
    			else{
    				window.location = "/jadrn045/login_err.jsp";
    			}
    	}});
    	
    });
    
    // Handling the submit button.
    $('#submit').on('click', function(e) {

        //capturing the data
        var quantity = $("#quantity").val().trim();

	// check Quantity format.
        if(!checkQuantityFormat(quantity)) {
            alert("Enter a valid quantity");
            $("#quantity").focus();
            e.preventDefault(); 
        }
        else
            return;
    });
    
    // HAndling the cancel button.
    $('#reset').on('click', function(e) {
    	
    	$("#in_sku").val("").focus();
		$("#sku_label").text(' ');
                        $("#product_sku").val(' ');
                        $("#category_label").text(' ');
                        $("#vendor_label").text(' ');
                        $("#manufacture_id_label").text(' ');
                        $("#quantity_error").text(' ');
			$('#product_image_label').attr('src', '');
                     

		
    });
	
	$('#reset1').on('click', function(e) {
    	
    	$("#out_sku").val("").focus();
		$("#sku_label1").text(' ');
                        $("#product_sku1").val(' ');
                        $("#category_label1").text(' ');
                        $("#vendor_label1").text(' ');
                        $("#manufacture_id_label1").text(' ');
                        $("#quantity_error1").text(' ');
			$('#product_image_label1').attr('src', '');
    });
    
    
});
    
   
