<%@page import="java.sql.*" %> 
<% 
        String Book_Type_Id = request.getParameter("Book_Type_Id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.booktype where Book_Type_Id = ?");
        pst.setString(1, Book_Type_Id);
        pst.executeUpdate();  
%>
<script>
        alert("Book Type Deleted");
        window.location.href="BookType.jsp";
</script>