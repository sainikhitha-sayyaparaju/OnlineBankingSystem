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
    </style>
  </head>
  <body>
    <div class="container">

      <% int acc1, acc2, amount, am1, am2, updated_balance1 ,updated_balance2, flag = 0; 
acc1 = 123456789; 
acc2=Integer.parseInt(request.getParameter("accno2")); 
amount = Integer.parseInt(request.getParameter("amount"));
try{
      Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useSSL=false","root","snsvkl2002");
	
	PreparedStatement stm1=con.prepareStatement("select balance from customers where accnumber=?"); 
	stm1.setInt(1,acc1); 
	ResultSet rs1=stm1.executeQuery(); 
	rs1.next();
	am1 = rs1.getInt(1);	

      PreparedStatement stm2=con.prepareStatement("select balance from customers where accnumber=?"); 
	stm2.setInt(1,acc2); 
	ResultSet rs2=stm2.executeQuery(); 
	if(! rs2.next()){
	response.sendRedirect("failure.html");
	PreparedStatement upd=con.prepareStatement("insert into transactions values(?,?,?,?)"); 
	upd.setInt(1, acc1);
	upd.setInt(2, acc2);
	upd.setInt(3, amount);
	upd.setString(4,"Failed");
	int r = upd.executeUpdate();
	return;
	}
	
	am2 = rs2.getInt(1);
	if(am1 >= amount){
		updated_balance1 = am1 - amount;
		updated_balance2 = am2 + amount;
	}else{
	response.sendRedirect("failure.html");
PreparedStatement upd=con.prepareStatement("insert into transactions values(?,?,?,?)"); 
	upd.setInt(1, acc1);
	upd.setInt(2, acc2);
	upd.setInt(3, amount);
	upd.setString(4,"Failed");
	int r = upd.executeUpdate();
return;
	}
	PreparedStatement update_stm1 = con.prepareStatement("update customers set balance = ? where accnumber = ?");
	update_stm1.setInt(1,updated_balance1);
	update_stm1.setInt(2,acc1);
	int r1 = update_stm1.executeUpdate();

	PreparedStatement update_stm2 = con.prepareStatement("update customers set balance = ? where accnumber = ?");
	update_stm2.setInt(1,updated_balance2);
	update_stm2.setInt(2,acc2);
	int r2 = update_stm2.executeUpdate();
	
	if(r1 > 0 && r2 > 0){
response.sendRedirect("success.html");
PreparedStatement upd=con.prepareStatement("insert into transactions values(?,?,?,?)"); 
	upd.setInt(1, acc1);
	upd.setInt(2, acc2);
	upd.setInt(3, amount);
	upd.setString(4,"Successful");
	int r = upd.executeUpdate();
}else{
response.sendRedirect("failure.html");
PreparedStatement upd=con.prepareStatement("insert into transactions values(?,?,?,?)"); 
	upd.setInt(1, acc1);
	upd.setInt(2, acc2);
	upd.setInt(3, amount);
	upd.setString(4,"Failed");
	int r = upd.executeUpdate();
return;
	}

 
con.close(); 
} catch(Exception e){
      System.out.println(e.getMessage()); } %>
  </body>
</html>
