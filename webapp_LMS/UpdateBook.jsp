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
    <%String Isbn_Code = request.getParameter("Isbn_Code"); %>
   <form  method="POST" action="UpdateBook2.jsp?Isbn_Code=<%= Isbn_Code %>"> 
        
       
        
        
        
        <div class="modal-header">
          
          <h4 class="modal-title">Update Book Details</h4>
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
                        
                           
                          
                          
                        pst1 = con1.prepareStatement("select * from lms.books where Isbn_Code = ?");
                        pst1.setString(1, Isbn_Code);
                        rs1 = pst1.executeQuery();
                        
                         while(rs1.next())
                         {
                    
                    %>
                    

                    <div>
                        <label class="form-label">Isbn_Code</label>
                        <input type="number" class="form-control" placeholder="Isbn_Code" value="<%=rs1.getString("Isbn_Code")%>" name="Isbn_Code" id="Isbn_Code" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Book_Name</label>
                        <input type="text" class="form-control" placeholder="Book Name" value="<%=rs1.getString("Book_Name")%>" name="Book_Name" id="Book_Name" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Book_Status</label>
                        <input type="text" class="form-control" placeholder="Book Status" value="<%=rs1.getString("Book_Status")%>" name="Book_Status" id="Book_Status" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Book_Type</label>
                        <input type="number" class="form-control" placeholder="Book Type" value="<%=rs1.getString("Book_Type")%>" name="Book_Type" id="Book_Type" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Book_Edition</label>
                        <input type="number" class="form-control" placeholder="Book Edition" value="<%=rs1.getString("Book_Edition")%>" name="Book_Edition" id="Book_Edition" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Book_Publisher</label>
                        <input type="number" class="form-control" placeholder="Book Publisher" value="<%=rs1.getString("Book_Publisher")%>" name="Book_Publisher" id="Book_Publisher" required >
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