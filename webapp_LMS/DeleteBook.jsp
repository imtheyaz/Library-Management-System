<%@page import="java.sql.*" %> 
<% 
        String Isbn_Code = request.getParameter("Isbn_Code");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.books where Isbn_Code = ?");
        pst.setString(1, Isbn_Code);
        pst.executeUpdate();  
%>
<script>
        alert("Book Deleted");
        window.location.href="BooksDetails.jsp";
</script>