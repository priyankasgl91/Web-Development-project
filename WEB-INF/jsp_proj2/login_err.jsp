<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<!-- Sehgal,Priyanka Account:jadrn045
CS645, Spring 2017
Project 2 -->

<head>
	<title>Login Example</title>
	<meta http-equiv="content-type" 
		content="text/html;charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />        
	<meta http-equiv="Content-Style-Type" content="text/css" />

    <script type="text/javascript" src="/jquery/jquery.js"></script>
    <script type="text/javascript" src="/jadrn045/javascripts/login.js"></script>
    <link rel="stylesheet" href="/jadrn045/css/login_pg.css">
    
    
</head>

<body>
    <div id="main">
        <div class="Proj_Heading">
            <h1>Be You Cosmetics</h1>
        </div>

        <div class="center">
      		<h3>INVENTORY MANAGEMENT </h3>
            <form method="post" action="/jadrn045/servlet/Login">
                <table>
                    <tr>
                                                <td>
                            <table class="data">
                                <tr>
                                    <th>Username:</th>
                                    <th><input id="username" type="text" name="username" size="15"></th>
                                </tr>
                                <tr>
                                    <th>Password:</th>
                                    <th><input id="password" type="password" name="password" size="15"></th>
                                </tr>
                                <tr>
                                    <th><input id="login_reset" type="reset" class="button" value="Clear"></th>
                                    <th><input id="login_submit" type="submit" value="Login" class="button"></th>
                                </tr>
                             </table>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div id="status">
            ERROR, invalid name or password
        </div>
    </div>

</body>
</html>

