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
        String Publisher_Id = request.getParameter("Publisher_Id");
        String Publisher_Name = request.getParameter("Publisher_Name");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("update lms.publisher set Publisher_Name=? where Publisher_Id = ?");
        pst.setString(1, Publisher_Name);
        pst.setString(2, Publisher_Id);
         pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Publisher Updated");
           window.location.href="Publisher.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>