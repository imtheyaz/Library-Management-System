<%@page import="java.sql.*" %> 
<% 
        String Member_Type_Id = request.getParameter("Member_Type_Id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.membertype where Member_Type_Id = ?");
        pst.setString(1, Member_Type_Id);
        pst.executeUpdate();  
%>
<script>
        alert("Member Type Deleted");
        window.location.href="MemberType.jsp";
</script>