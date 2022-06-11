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
        String Book_Type_Id = request.getParameter("Book_Type_Id");
        String Book_Type_Name = request.getParameter("Book_Type_Name");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("update lms.booktype set Book_Type_Name=? where Book_Type_Id = ?");
        pst.setString(1, Book_Type_Name);
        pst.setString(2, Book_Type_Id);
         pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Book Type Updated");
           window.location.href="BookType.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>