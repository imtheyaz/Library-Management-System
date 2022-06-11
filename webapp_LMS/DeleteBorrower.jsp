<%@page import="java.sql.*" %> 
<% 
        String Borrower_Id = request.getParameter("Borrower_Id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.borrower where Borrower_Id = ?");
        pst.setString(1, Borrower_Id);
        pst.executeUpdate();  
%>
<script>
        alert("Borrower Deleted");
        window.location.href="Borrower.jsp";
</script>