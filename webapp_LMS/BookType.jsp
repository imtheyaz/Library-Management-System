<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Book_Type_Id = request.getParameter("Book_Type_Id");
        String Book_Type_Name = request.getParameter("Book_Type_Name");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.booktype values(?,?)");
        pst.setString(1, Book_Type_Id);
        pst.setString(2, Book_Type_Name);
      
        pst.executeUpdate();  
%> 
    <script>   
        alert("Added Book Type Successfully");     
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
  background-image: url("https://www.oberlo.com/media/1618562665-quote3.png?w=1824&fit=max");
  background-repeat: no-repeat;
   background-: fixed;
    background-size: cover;
}
 </style>
 </head>
 <body>  
  <div class="container">
   <h1>Book Type</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Book Type</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Book_Type_Id</th>
                                    <th>Book_Type_Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.booktype";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Book_Type_Id = rs.getString("Book_Type_Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Book_Type_Id") %></td>	
                                 <td><%=rs.getString("Book_Type_Name") %></td>	
                                 <td><a href="UpdateBookType.jsp?Book_Type_Id=<%= Book_Type_Id %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeleteBookType.jsp?Book_Type_Id=<%= Book_Type_Id %>">Delete</a></td>
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
          
          <h4 class="modal-title">Adding Book Type</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                     
                     <div>
                        <label class="form-label">Book_Type_Id</label>
                        <input type="number" class="form-control" placeholder="Book Type Id" name="Book_Type_Id" id="Book_Type_Id" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Book_Type_Name</label>
                        <input type="text" class="form-control" placeholder="Book Type Name" name="Book_Type_Name" id="Book_Type_Name" required >
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
  <form  method="POST" action="UpdateBookType.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Book Type Update</h4>
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