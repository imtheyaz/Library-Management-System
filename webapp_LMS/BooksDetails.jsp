<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
    	String Isbn_Code = request.getParameter("Isbn_Code");
        String Book_Name = request.getParameter("Book_Name");
        String Book_Status = request.getParameter("Book_Status");
        String Book_Type = request.getParameter("Book_Type");
        String Book_Edition = request.getParameter("Book_Edition");
        String Book_Publisher = request.getParameter("Book_Publisher");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.books values(?,?,?,?,?,?)");
        pst.setString(1, Isbn_Code);
        pst.setString(2, Book_Name);
        pst.setString(3, Book_Status);
        pst.setString(4, Book_Type);
        pst.setString(5, Book_Edition);
        pst.setString(6, Book_Publisher);
        pst.executeUpdate();  
%> 
    <script>   
        alert("Added Book Successfully");     
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
   <h1>Books Details</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Book</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Isbn_Code</th>
                                    <th>Book_Name</th>
                                    <th>Book_Status</th>
                                    <th>Book_Type</th>
                                    <th>Book_Edition</th>
                                    <th>Book_Publisher</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.books";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Isbn_Code = rs.getString("Isbn_Code");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Isbn_Code") %></td>
                                 <td><%=rs.getString("Book_Name") %></td>	
                                 <td><%=rs.getString("Book_Status") %></td>
                                 <td><%=rs.getString("Book_Type") %></td>
                                 <td><%=rs.getString("Book_Edition")%></td>
                                 <td><%=rs.getString("Book_Publisher")%></td>	
                                 <td><a href="UpdateBook.jsp?Isbn_Code=<%= Isbn_Code %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeleteBook.jsp?Isbn_Code=<%= Isbn_Code %>">Delete</a></td>
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
          
          <h4 class="modal-title">Adding Book</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                    <div>
                        <label class="form-label">Isbn_Code</label>
                        <input type="number" class="form-control" placeholder="Isbn_Code" name="Isbn_Code" id="Isbn_Code" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Book_Name</label>
                        <input type="text" class="form-control" placeholder="Book Name" name="Book_Name" id="Book_Name" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Book_Status</label>
                        <input type="text" class="form-control" placeholder="Book Status" name="Book_Status" id="Book_Status" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Book_Type</label>
                        <input type="number" class="form-control" placeholder="Book Type" name="Book_Type" id="Book_Type" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Book_Edition</label>
                        <input type="number" class="form-control" placeholder="Book Edition" name="Book_Edition" id="Book_Edition" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Book_Publisher</label>
                        <input type="number" class="form-control" placeholder="Book Publisher" name="Book_Publisher" id="Book_Publisher" required >
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
  <form  method="POST" action="UpdateBook.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Book Update</h4>
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