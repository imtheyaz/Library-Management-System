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
    <%String Member_Id = request.getParameter("Member_Id"); %>
   <form  method="POST" action="UpdateMember2.jsp?Member_Id=<%= Member_Id %>"> 
        
       
        
        
        
        <div class="modal-header">
          
          <h4 class="modal-title">Update Member</h4>
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
                        
                           
                          
                          
                        pst1 = con1.prepareStatement("select * from lms.member where Member_Id = ?");
                        pst1.setString(1, Member_Id);
                        rs1 = pst1.executeQuery();
                        
                         while(rs1.next())
                         {
                    
                    %>
                    

                     
                    <div>
                        <label class="form-label">Member_Id</label>
                        <input type="text" class="form-control" placeholder="Member Id" value="<%=rs1.getString("Member_Id")%>" name="Member_Id" id="Member_Id" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Fname</label>
                        <input type="text" class="form-control" placeholder="Member Fname" value="<%=rs1.getString("Member_Fname")%>" name="Member_Fname" id="Member_Fname" required >
                     </div>
                         
                     <div>
                       <label class="form-label">Member_Lname</label>
                        <input type="text" class="form-control" placeholder="Member Lname" value="<%=rs1.getString("Member_Lname")%>" name="Member_Lname" id="Member_Lname" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Phone</label>
                        <input type="int" class="form-control" placeholder="Member Phone" value="<%=rs1.getString("Member_Phone")%>" name="Member_Phone" id="Member_Phone" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Member_Email</label>
                        <input type="email" class="form-control" placeholder="Member Email" value="<%=rs1.getString("Member_Email")%>" name="Member_Email" id="Member_Email" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Member_Type</label>
                        <input type="int" class="form-control" placeholder="Member Type" value="<%=rs1.getString("Member_Type")%>" name="Member_Type" id="Member_Type" required >
                     </div>
                     
                     <div>
                       <label class="form-label">Member_Address</label>
                        <input type="text" class="form-control" placeholder="Member Address" value="<%=rs1.getString("Member_Address")%>" name="Member_Address" id="Member_Address" required >
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