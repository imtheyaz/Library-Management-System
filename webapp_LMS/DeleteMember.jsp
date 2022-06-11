<%@page import="java.sql.*" %> 
<% 
        String Member_Id = request.getParameter("Member_Id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.member where Member_Id = ?");
        pst.setString(1, Member_Id);
        pst.executeUpdate();  
%>
<script>
        alert("Member Deleted");
        window.location.href="Member.jsp";
</script>