<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <% 
      
      
        String str=request.getParameter("submit1");
        out.println("str");
    if(str!=null)
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
        pst = con.prepareStatement("update lms.member set Member_Fname=?,Member_Lname=?,Member_Phone=?,Member_Email=?,Member_Type=?,Member_Address=? where Member_Id = ?");
        pst.setString(1, Member_Fname);
        pst.setString(2, Member_Lname);
        pst.setString(3, Member_Phone);
        pst.setString(4, Member_Email);
        pst.setString(5, Member_Type);
        pst.setString(6, Member_Address);
        pst.setString(7, Member_Id);
         pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Member Updated");
           window.location.href="Member.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>