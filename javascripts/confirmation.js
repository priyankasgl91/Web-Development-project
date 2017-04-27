/*Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 */
$(document).ready( function() {
	history.go(1); 
    
    $('html').on('click', function() {
        history.go(1);
        });
    
    // Handling the logout button.
    $("#logout").click(function(){
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
});




