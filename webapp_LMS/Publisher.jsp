<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Publisher_Id = request.getParameter("Publisher_Id");
        String Publisher_Name = request.getParameter("Publisher_Name");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.publisher values(?,?)");
        pst.setString(1, Publisher_Id);
        pst.setString(2, Publisher_Name);
      
        pst.executeUpdate();  
%> 
    <script>   
        alert("Added Publisher Successfully");     
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
  background-image: url("https://5.imimg.com/data5/OR/JS/MY-1005196/book-binding-thread-500x500.jpg");
  background-repeat: no-repeat;
   background-: fixed;
    background-size: cover;
}
 </style>
     
 </head>
 <body>  
  <div class="container">
   <h1>Publisher</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Publisher</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Publisher_Id</th>
                                    <th>Publisher_Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.publisher";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Publisher_Id = rs.getString("Publisher_Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Publisher_Id") %></td>	
                                 <td><%=rs.getString("Publisher_Name") %></td>	
                                 <td><a href="UpdatePublisher.jsp?Publisher_Id=<%= Publisher_Id %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeletePublisher.jsp?Publisher_Id=<%= Publisher_Id %>">Delete</a></td>
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
          
          <h4 class="modal-title">Adding Publisher</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                     
                     <div>
                        <label class="form-label">Publisher_Id</label>
                        <input type="number" class="form-control" placeholder="Publisher Id" name="Publisher_Id" id="Publisher_Id" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Publisher_Name</label>
                        <input type="text" class="form-control" placeholder="Publisher Name" name="Publisher_Name" id="Publisher_Name" required >
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
  <form  method="POST" action="UpdatePublisher.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Publisher Update</h4>
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