<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Plant Diseases</title>
</head>
<body>
<h2>Plant Diseases List</h2>
<%
    
	String dbURL = "jdbc:mysql://hrishimysqlserver.mysql.database.azure.com:3306/plant_disease"; // Update with your database URL
    String user = "hrishi@hrishimysqlserver"; // Update with your database username
    String pass = "YourStrongPassword!"; // Update with your database password

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, user, pass);
        stmt = conn.createStatement();
        String sql = "SELECT DiseaseName, PlantNames, Symptoms, Solutions FROM PlantDisease";
        rs = stmt.executeQuery(sql);

        out.println("<table border='1'><tr><th>Disease Name</th><th>Affected Plants</th><th>Symptoms</th><th>Solutions</th></tr>");
        while(rs.next()){
            String diseaseName = rs.getString("DiseaseName");
            String plantNames = rs.getString("PlantNames");
            String symptoms = rs.getString("Symptoms");
            String solutions = rs.getString("Solutions");

            out.println("<tr><td>" + diseaseName + "</td><td>" + plantNames +
                        "</td><td>" + symptoms + "</td><td>" + solutions + "</td></tr>");
        }
        out.println("</table>");
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {};
        try { if (stmt != null) stmt.close(); } catch (Exception e) {};
        try { if (conn != null) conn.close(); } catch (Exception e) {};
    }
%>
</body>
</html>
