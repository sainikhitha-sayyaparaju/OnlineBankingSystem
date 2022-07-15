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
      table {
        border-spacing: 2px;
        font-size: 20px;
      }
      th,
      td {
        vertical-align: middle;
      }
      tr {
        height: 20px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <nav
        class="navbar navbar-expand-lg navbar-dark bg-dark fixed fixed-top"
        style="
          font-family: candara;
          font-size: 18px;
          box-shadow: 0px 0px 10px 0px black;
        "
      >
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <b>
            <ul class="navbar-nav">
              <li class="nav-item" style="margin-left: 15px">
                <img src="logo.png" width="50px" height="40px">
              </li>
              <li class="nav-item nav-links" style="margin-left: 15px">
                <a
                  class="nav-link text-nowrap"
                  aria-current="page"
                  href="index.html"
                  >Home</a
                >
              </li>
              <li class="nav-item" style="margin-left: 15px">
                <a class="nav-link text-nowrap" href="sendMoney.html"
                  >Tranfer Money</a
                >
              </li>
              <li class="nav-item" style="margin-left: 15px">
                <a
                  class="nav-link active text-nowrap"
                  href="http://localhost:4040/bank/customers.jsp"
                  >View Customers</a
                >
              </li>
              <li class="nav-item" style="margin-left: 15px">
                <a class="nav-link text-nowrap" href="checkbalance.html"
                  >Check Balance</a
                >
              </li>
              <li class="nav-item" style="margin-left: 15px">
                <a
                  class="nav-link text-nowrap"
                  href="http://localhost:4040/bank/transactions.jsp"
                  >Transactions</a
                >
              </li>
            </ul>
          </b>
        </div>
      </nav>
      <br />
      <br /><br />
      <br />
      <h1 align="center">Customers</h1>
      <br /><br />
      <table
        class="table table-stripped table-light"
        width="100%"
        padding="50px"
        cellspacing="20px"
        cellpadding="10px"
      >
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Balance</th>
            <th scope="col">Email</th>
            <th scope="col">Account Number</th>
          </tr>
        </thead>
        <tbody>
          <% try{ Class.forName("com.mysql.jdbc.Driver"); Connection
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useSSL=false","root","snsvkl2002");
          Statement stm=con.createStatement(); ResultSet
          rs=stm.executeQuery("select * from customers"); while(rs.next()) { %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getInt(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getInt(4)%></td>
          </tr>
          <% } con.close(); } catch(Exception e){
          System.out.println(e.getMessage()); } %>
        </tbody>
      </table>
    </div>
  </body>
</html>
