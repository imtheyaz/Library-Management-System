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
    <%String Member_Type_Id = request.getParameter("Member_Type_Id"); %>
   <form  method="POST" action="UpdateMemberType2.jsp?Member_Type_Id=<%= Member_Type_Id %>"> 
        
       
        
        
        
        <div class="modal-header">
          
          <h4 class="modal-title">Update Member Type</h4>
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
                        
                           
                          
                          
                        pst1 = con1.prepareStatement("select * from lms.membertype where Member_Type_Id = ?");
                        pst1.setString(1, Member_Type_Id);
                        rs1 = pst1.executeQuery();
                        
                         while(rs1.next())
                         {
                    
                    %>
                    

                     
                    <div>
                        <label class="form-label">Member_Type_Id</label>
                        <input type="text" class="form-control" placeholder="Member Type Id" value="<%=rs1.getString("Member_Type_Id")%>" name="Member_Type_Id" id="Member_Type_Id" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Type_Name</label>
                        <input type="text" class="form-control" placeholder="Member Type Name" value="<%=rs1.getString("Member_Type_Name")%>" name="Member_Type_Name" id="Member_Type_Name" required >
                     </div>
                         
                     <div>
                       <label class="form-label">Member_Type_Fine</label>
                        <input type="text" class="form-control" placeholder="Member Type Fine" value="<%=rs1.getString("Member_Type_Fine")%>" name="Member_Type_Fine" id="Member_Type_Fine" required >
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