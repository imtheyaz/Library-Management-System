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
    	 String Borrower_Id = request.getParameter("Borrower_Id");
         String Member_Id = request.getParameter("Member_Id");
         String Isbn_Code = request.getParameter("Isbn_Code");
         String Librarian_Id = request.getParameter("Librarian_Id");
         String Borrow_Date = request.getParameter("Borrow_Date");
         String Return_Date = request.getParameter("Return_Date");
         String Expected_Return_Date = request.getParameter("Expected_Return_Date");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("update lms.borrower set Member_Id=?,Isbn_Code=?,Librarian_Id=?,Borrow_Date=?,Return_Date=?,Expected_Return_Date=? where Member_Id = ?");
        pst.setString(1, Member_Id);
        pst.setString(2, Isbn_Code);
        pst.setString(3, Librarian_Id);
        pst.setString(4, Borrow_Date);
        pst.setString(5, Return_Date);
        pst.setString(6, Expected_Return_Date);
        pst.setString(7, Borrower_Id);
        pst.executeUpdate();  
  %>
        
        <script>
            
            alert("Borrower Updated");
           window.location.href="Borrower.jsp";
            
       </script>
       
       
       <%} %>
    

</body>
</html>