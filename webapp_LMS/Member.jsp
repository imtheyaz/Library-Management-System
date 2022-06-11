
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String Member_Id = request.getParameter("Member_Id");
        String Member_Fname = request.getParameter("Member_Fname");
        String Member_Lname = request.getParameter("Member_Lname");
        String Member_Phone = request.getParameter("Member_Phone");
        String Member_Email = request.getParameter("Member_Email");
        String Member_Type = request.getParameter("Member_Type");
        String Member_Address = request.getParameter("Member_Address");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;   
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("insert into lms.member values(?,?,?,?,?,?,?)");
        pst.setString(1, Member_Id);
        pst.setString(2, Member_Fname);
        pst.setString(3, Member_Lname);
        pst.setString(4, Member_Phone);
        pst.setString(5, Member_Email);
        pst.setString(6, Member_Type);
        pst.setString(7, Member_Address);
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
   <h1>Members</h1>
   <a href="LibrarianHome.jsp">Back to Home</a>
   </br>
    <div class="row">        
     <div class="col-sm-12">
                 <div class="panel-body">
                 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">+ Add Member</button>
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Member_Id</th>
                                    <th>Member_Fname</th>
                                    <th>Member_Lname</th>
                                    <th>Member_Phone</th>
                                    <th>Member_Email</th>
                                    <th>Member_Type</th>
                                    <th>Member_Address</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
                                
                                  String query = "select * from lms.member order by Member_Id";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String Member_Id = rs.getString("Member_Id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("Member_Id") %></td>
                                 <td><%=rs.getString("Member_Fname") %></td>	
                                 <td><%=rs.getString("Member_Lname") %></td>
                                 <td><%=rs.getString("Member_Phone") %></td>
                                 <td><%=rs.getString("Member_Email") %></td>	
                                 <td><%=rs.getString("Member_Type") %></td>
                                 <td><%=rs.getString("Member_Address") %></td>	
                                 <td><a href="UpdateMember.jsp?Member_Id=<%= Member_Id %>"  data-toggle="modal" data-target="#myModal1" name="edit" >Edit</a></td>
                                 <td><a href="DeleteMember.jsp?Member_Id=<%= Member_Id %>">Delete</a></td>
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
          
          <h4 class="modal-title">Adding Member</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div>
                
                    
                    <div>
                        <label class="form-label">Member_Id</label>
                        <input type="text" class="form-control" placeholder="Member Id" name="Member_Id" id="Member_Id" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Fname</label>
                        <input type="text" class="form-control" placeholder="Member Fname" name="Member_Fname" id="Member_Fname" required >
                     </div>
                         
                     <div>
                       <label class="form-label">Member_Lname</label>
                        <input type="text" class="form-control" placeholder="Member Lname" name="Member_Lname" id="Member_Lname" required >
                     </div>
                         
                    <div>
                        <label class="form-label">Member_Phone</label>
                        <input type="number" class="form-control" placeholder="Member Phone" name="Member_Phone" id="Member_Phone" required >
                     </div>
                     
                     <div>
                        <label class="form-label">Member_Email</label>
                        <input type="email" class="form-control" placeholder="Member Email" name="Member_Email" id="Member_Email" required >
                     </div>
                         
                     <div>
                        <label class="form-label">Member_Type</label>
                        <input type="int" class="form-control" placeholder="Member Type" name="Member_Type" id="Member_Type" required >
                     </div>
                     
                     <div>
                       <label class="form-label">Member_Address</label>
                        <input type="text" class="form-control" placeholder="Member Address" name="Member_Address" id="Member_Address" required >
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
  <form  method="POST" action="UpdateMember.jsp" > 
     <div class="modal-header">
     <h4 class="modal-title">Member Update</h4>
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