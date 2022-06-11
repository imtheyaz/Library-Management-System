<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
    <%String Publisher_Id = request.getParameter("Publisher_Id"); %>
   <form  method="POST" action="UpdatePublisher2.jsp?Publisher_Id=<%= Publisher_Id %>"> 
        
       
        
        
        
        <div class="modal-header">
          
          <h4 class="modal-title">Update Publisher</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
            
                <%    
                      try{
                    	  
                    	  Connection con1;
                        PreparedStatement pst1;
                        ResultSet rs1;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con1 = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                        
                           
                          
                          
                        pst1 = con1.prepareStatement("select * from lms.publisher where Publisher_Id = ?");
                        pst1.setString(1, Publisher_Id);
                        rs1 = pst1.executeQuery();
                        
                         while(rs1.next())
                         {
                    
                    %>
                   
                     
                     <div>
                        <label class="form-label">Publisher_Id</label>
                        <input type="number" class="form-control" placeholder="Binding Id" value="<%=rs1.getString("Publisher_Id")%>" name="Publisher_Id" id="Publisher_Id" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Publisher_Name</label>
                        <input type="text" class="form-control" placeholder="Publisher Name" value="<%=rs1.getString("Publisher_Name")%>" name="Publisher_Name" id="Publisher_Name" required >
                     </div>
                      </br>
                         
                    
                         <% } 
                      }
                catch (ClassNotFoundException e) {
                	e.printStackTrace();
                	}
                         %>
                         
                
            </div>
        </div>
        </div>
        <div class="modal-footer">
          
        <div alight="right">
                         <input type="submit" id="submit" value="update" name="submit1" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>
          
           
        </div>
      
        </form>
    </body>
</html>