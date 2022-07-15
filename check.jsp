<%@page import="java.sql.*"%>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width = device-width" initial-scale="1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <style>
      body {
        background-color: black;
        color: white;
      }
      .registrationcard {
        width: 700px;
        height: 500px;
        display: inline-block;
        border-radius: 10px;
        padding: 10px 15px;
        box-sizing: border-box;
        cursor: pointer;
        margin: 10px 15px;
        background-position: center;
        background-size: cover;
        background-color: #007aa5;
        transition: transform 0.5;
      }
    </style>
  </head>
  <body>
<br><br>
    <center>
      <div class="container" style="margin-top: 2%">
        <div
          class="registrationcard"
          style="backdrop-filter: blur(5px); border-radius: 5px"
        >
          <br /><br><br><br><br>
          <div align="center" style="font-size: 40px">Your Account Balance is</div>

          

    <% int acc = Integer.parseInt(request.getParameter("accno")); try{
    Class.forName("com.mysql.jdbc.Driver"); Connection
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useSSL=false","root","snsvkl2002");
    PreparedStatement stm1=con.prepareStatement("select balance from customers where accnumber=?"); 
	stm1.setInt(1,acc); 
	ResultSet rs1=stm1.executeQuery(); 
	rs1.next();
%>
    <div align="center" style="font-size:60px">&#8377; <%=rs1.getInt(1)%></div>
    <% con.close(); } catch(Exception e){ System.out.println(e.getMessage()); }
    %>
<br />
<a href="index.html">
<button class="btn btn-success btn-lg" align="center">Done</button></a>
        </div>
      </div>
    </center>
  </body>
</html>
