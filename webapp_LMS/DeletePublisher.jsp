<%@page import="java.sql.*" %> 
<% 
        String Publisher_Id = request.getParameter("Publisher_Id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/lms","root","Imtheyaz@11");
        pst = con.prepareStatement("delete from lms.publisher where Publisher_Id = ?");
        pst.setString(1, Publisher_Id);
        pst.executeUpdate();  
%>
<script>
        alert("Publisher Deleted");
        window.location.href="Publisher.jsp";
</script>