<%-- 
    Document   : index
    Created on : May 19, 2014, 11:14:07 PM
    Author     : smile_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="resource/css/indexstyle.css">
        <script src="resource/js/jquery-1.11.1.min.js"></script>
        <script src="resource/js/jquery.validate.min.js"></script>     
        <script> $(document).ready(function() {
                var validator = $("#form").validate({
                    rules: {
                        username: "required",
                        password: {
                            required: true,
                            
                        }
                        
                    },
                    messages: {
                        username: "*",
                        password: {
                            required: "*",
                            
                        }
                    }
                });
            })
        </script>  
    </head>
    <body>
        <div id="planet"><img src="resource/images/planet_half.png" alt=""></div>
        <div id="message" style="display: none;">
            <div class="inner">
            </div>
        </div>
        <div id="control">	
            <form method="post" action="CheckIn.jsp" id="form">
                <div id="label1" class="label">Tên đăng nhập</div>
                <div class="rounded_input">
                    <input id="field1" name="username"  value="" type="text" class="required" >
                </div>
                <div id="label2" class="label">Mật khẩu</div>
                <div class="rounded_input">
                    <input id="field2" name="password" type="password" class="required">
                </div>
                <input class="button"  value="Đăng nhập" type="submit">
                <div id="forgot1" class="forgot">
                    <a href="">Bạn quên mật khẩu?</a>
                </div>		
            </form>
            <div id="flagpole">
                <div id="title">Đăng nhập </div>
            </div>
        </div>
    </div>
</html>
