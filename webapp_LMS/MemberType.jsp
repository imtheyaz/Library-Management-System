
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Member_Type_Id = request.getParameter("Member_Type_Id");
        String Member_Type_Name = request.getParameter("Member_Type_Name");
        String Member_Type_Fine = request.getParameter("Member_Type_Fine");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.membertype values(?,?,?)");
        pst.setString(1, Member_Type_Id);
        pst.setString(2, Member_Type_Name);
        pst.setString(3, Member_Type_Fine);
        pst.executeUpdate();  
%> 
    <script>   
        alert("Added Member Successfully");     
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
   <h1>Member Type</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Member Type</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Member_Type_Id</th>
                                    <th>Member_Type_Name</th>
                                    <th>Member_Type_Fine</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.membertype order by Member_Type_Id";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Member_Type_Id = rs.getString("Member_Type_Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Member_Type_Id") %></td>
                                 <td><%=rs.getString("Member_Type_Name") %></td>	
                                 <td><%=rs.getString("Member_Type_Fine") %></td>
                                 <td><a href="UpdateMemberType.jsp?Member_Type_Id=<%= Member_Type_Id %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeleteMemberType.jsp?Member_Type_Id=<%= Member_Type_Id %>">Delete</a></td>
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
          
          <h4 class="modal-title">Adding Member Type</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                    <div>
                        <label class="form-label">Member_Type_Id</label>
                        <input type="text" class="form-control" placeholder="Member Type Id" name="Member_Type_Id" id="Member_Type_Id" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Type_Name</label>
                        <input type="text" class="form-control" placeholder="Member Type Name" name="Member_Type_Name" id="Member_Type_Name" required >
                     </div>
                         
                     <div>
                       <label class="form-label">Member_Type_Fine</label>
                        <input type="number" class="form-control" placeholder="Member Type Fine" name="Member_Type_Fine" id="Member_Type_Fine" required >
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
  <form  method="POST" action="UpdateMemberType.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Member Type Update</h4>
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