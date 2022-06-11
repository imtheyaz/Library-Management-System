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
    	String Member_Type_Id = request.getParameter("Member_Type_Id");
        String Member_Type_Name = request.getParameter("Member_Type_Name");
        String Member_Type_Fine = request.getParameter("Member_Type_Fine");

        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("update lms.membertype set Member_Type_Name=?,Member_Type_Fine=? where Member_Type_Id = ?");
        pst.setString(1, Member_Type_Name);
        pst.setString(2, Member_Type_Fine);
        pst.setString(3, Member_Type_Id);
         pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Member Type Updated");
           window.location.href="MemberType.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>