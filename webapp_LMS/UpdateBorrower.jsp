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
    <%String Borrower_Id = request.getParameter("Borrower_Id"); %>
   <form  method="POST" action="UpdateBorrower2.jsp?Borrower_Id=<%= Borrower_Id %>"> 
        
       
        
        
        
        <div class="modal-header">
          
          <h4 class="modal-title">Update Borrower</h4>
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
                        
                           
                          
                          
                        pst1 = con1.prepareStatement("select * from lms.borrower where Borrower_Id = ?");
                        pst1.setString(1, Borrower_Id);
                        rs1 = pst1.executeQuery();
                        
                         while(rs1.next())
                         {
                    
                    %>
                    

                     
                    <div>
                        <label class="form-label">Borrower_Id</label>
                        <input type="text" class="form-control" placeholder="Borrower Id" value="<%=rs1.getString("Borrower_Id")%>" name="Borrower_Id" id="Borrower_Id" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Id</label>
                        <input type="text" class="form-control" placeholder="Member Id" value="<%=rs1.getString("Member_Id")%>" name="Member_Id" id="Member_Id" required >
                     </div>
                                              
                    <div>
                        <label class="form-label">Isbn_Code</label>
                        <input type="number" class="form-control" placeholder="Isbn_Code" value="<%=rs1.getString("Isbn_Code")%>" name="Isbn_Code" id="Isbn_Code" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Librarian_Id</label>
                        <input type="text" class="form-control" placeholder="Librarian Id" value="<%=rs1.getString("Librarian_Id")%>" name="Librarian_Id" id="Librarian_Id" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Borrow_Date</label><br>
                         <input type="date" class="form-control" placeholder="Borrow Date" value="<%=rs1.getString("Borrow_Date")%>" name="Borrow_Date" id="Borrow_Date" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Return_Date</label>
                        <input type="date" class="form-control" placeholder="Return Date" value="<%=rs1.getString("Return_Date")%>" name="Return_Date" id="Return_Date"  >
                     </div>
                         
                     <div>
                        <label class="form-label">Expected_Return_Date</label><br>
                        <input type="date" class="form-control" placeholder="Expected Return Date" value="<%=rs1.getString("Expected_Return_Date")%>" name="Expected_Return_Date" id="Expected_Return_Date" required >
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