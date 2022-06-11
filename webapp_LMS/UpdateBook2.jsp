
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
        pst = con.prepareStatement("update lms.books set Book_Name=?,Book_Status=?,Book_Type=?,Book_Edition=?,Book_Publisher=? where Isbn_Code = ?");
        pst.setString(1, Book_Name);
        pst.setString(2, Book_Status);
        pst.setString(3, Book_Type);
        pst.setString(4, Book_Edition);
        pst.setString(5, Book_Publisher);
        pst.setString(6, Isbn_Code);
         pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Book Details Updated");
           window.location.href="BooksDetails.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>