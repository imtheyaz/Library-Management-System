
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Borrower_Id = request.getParameter("Borrower_Id");
        String Member_Id = request.getParameter("Member_Id");
        String Isbn_Code = request.getParameter("Isbn_Code");
        String Librarian_Id = request.getParameter("Librarian_Id");
        String Borrow_Date = request.getParameter("Borrow_Date");
        String Return_Date = request.getParameter("Return_Date");
        String Expected_Return_Date = request.getParameter("Expected_Return_Date");
        

        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.borrower values(?,?,?,?,?,?,?)");
        pst.setString(1, Borrower_Id);
        pst.setString(2, Member_Id);
        pst.setString(3, Isbn_Code);
        pst.setString(4, Librarian_Id);
        pst.setString(5, Borrow_Date);
        pst.setString(6, Return_Date);
        pst.setString(7, Expected_Return_Date);
       
        pst.executeUpdate();  
%> 
    <script>   
        alert("Added Borrower Successfully");     
    </script> 
<%             
    }
%>
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
        <style>

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image: url("https://st3.depositphotos.com/8846918/16072/i/1600/depositphotos_160721334-stock-photo-books-stack-on-white-background.jpg");
  background-repeat: no-repeat;
   background-: fixed;
    background-size: cover;
}
 </style>
 </head>
 <body>  
  <div class="container">
   <h1>Borrower Details</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Borrower</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Borrower_Id</th>
                                    <th>Member_Id</th>
                                    <th>Isbn_Code</th>
                                    <th>Librarian_Id</th>
                                    <th>Borrow_Date</th>
                                    <th>Return_Date</th>
                                    <th>Expected_Return_Date</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.borrower";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Borrower_Id = rs.getString("Borrower_Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Borrower_Id") %></td>
                                 <td><%=rs.getString("Member_Id") %></td>
                                 <td><%=rs.getString("Isbn_Code") %></td>	
                                 <td><%=rs.getString("Librarian_Id") %></td>
                                 <td><%=rs.getString("Borrow_Date") %></td>
                                 <td><%=rs.getString("Return_Date") %></td>
                                 <td><%=rs.getString("Expected_Return_date") %></td>	
                                 <td><a href="UpdateBorrower.jsp?Borrower_Id=<%= Borrower_Id %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeleteBorrower.jsp?Borrower_Id=<%= Borrower_Id %>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  
        </div>

</div>


 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      <form  method="POST" action="#" > 
        <div class="modal-header">
          
          <h4 class="modal-title">Adding Borrower</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                     <div>
                        <label class="form-label">Borrower_Id</label>
                        <input type="number" class="form-control" placeholder="Borrower Id" name="Borrower_Id" id="Borrower_Id" required >
                     </div>
     
                     <div>
                        <label class="form-label">Member_Id</label>
                        <input type="number" class="form-control" placeholder="Member Id" name="Member_Id" id="Member_Id" required >
                     </div>
                                              
                    <div>
                        <label class="form-label">Isbn_Code</label>
                        <input type="text" class="form-control" placeholder="Isbn Code" name="Isbn_Code" id="Isbn_Code" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Librarian_Id</label>
                        <input type="number" class="form-control" placeholder="Librarian Id" name="Librarian_Id" id="Librarian_Id" required >
                     </div>
                                              
                     <div>
                        <label class="form-label">Borrow_Date</label><br>
                         <input type="date" class="form-control" placeholder="Borrow Date" name="Borrow_Date" id="Borrow_Date" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Return_Date</label>
                        <input type="date" class="form-control" placeholder="Return Date" name="Return_Date" id="Return_Date"  >
                     </div>
                         
                     <div>
                        <label class="form-label">Expected_Return_Date</label><br>
                        <input type="date" class="form-control" placeholder="Expected Return Date" name="Expected_Return_Date" id="Expected_Return_Date" required >
                     </div>
                                  
            </div>
        </div>
        </div>
        <div class="modal-footer">
           <div alight="right">
                         <input type="submit" id="submit" value="save" name="submit" class="btn btn-info">
                      <!-- <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning"> -->   
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     </div>  
        </div>
        </form>
      </div>
      
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
<div class="modal-content">
  <form  method="POST" action="UpdateBorrower.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Update Borrower</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
     </div>
       	<div class="modal-body">
          	<div class="row">
            	<div>
				</div>
      		</div>
      	</div>	
        </form>
      </div>
      
    </div>
  </div>
  
 
    </body>
</html>