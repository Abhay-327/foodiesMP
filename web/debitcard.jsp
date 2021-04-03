<%-- 
    Document   : debitcard
    Created on : 15 Apr, 2017, 8:19:52 PM
    Author     : Ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
      function check(){
        var x=document.first.name.value;
        var y=document.first.number.value;
        var z=document.first.cvv.value;
        
        var k=y.length;
        var l=z.length;
        if((x==="")&&((k<16)&&(l<3))) 
        {  
            alert("Please enter right details");
           return false;
        }
        else
        {
            alert("You can proceed");
        return true;
        }
    }
        </script>
          <% session.setAttribute("transaction","debitcard"); %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
         <h1>Please enter your debit card details</h1>
        <form  name="first" target="_self" method="POST" autocomplete="off" onsubmit="return check ()" action="cash" >
            Card Holder Name <input type='text' name="name" required="required" /> <br>
           <br> Card Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type='password' maxlength="16" name="number" required="required">
            <br><br>Cvv &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" maxlength="3" name="cvv" required="required">
            <br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            
            <input  type="submit" value="Go">
        </form>
    </body>
</html>
