<%@page contentType="text/html" pageEncoding="windows-31j"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.lang3.*"%>
<%@page import="common.OrderInfoList"%>
<%@page import="common.OrderItemList"%>
<%@page import="common.SelectModel"%>
<%@page session="true"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Context-Type" content="text/html"; charset="windows-31j" > 
		<title>óÚ×\¦</title>
	</head>
	<body>
		<h1>óÚ×\¦</h1>
				
		<form action="OrderDetailController" method="post">
			<input type="submit" name='backToSelect' value='ßé' /><br/></br>
		</form>



	<table border=3>
		<tr>
			<td>óNo</td>
			<td>óút</td>
			<td>ÚqR[h</td>
			<td>Úq¼</td>
			<td>SÒR[h</td>
			<td>SÒ¼</td>
			<td>vàz</td>
			<td>ÁïÅ</td>
			<td>¿àz</td>
			<%
				int orderNo = (Integer)session.getAttribute("orderNo");
				String word = (String)session.getAttribute("word");
				
			    SelectModel select = new SelectModel();
				ArrayList<OrderInfoList> orderInfoList = select.getOrderList(word);
				
				if (orderInfoList.size() != 0) {
					for (OrderInfoList or : orderInfoList) {
						 if (or.getOrderNumber() == orderNo) {
							 int orderNumber= or.getOrderNumber();			//óNo
								Date orderData = or.getOrderDate();			//óút
								int customCode = or.getCustomCode();		//ÚqR[h
								String customName = or.getCustomName();		//Úq¼O
								String salesCode =	or.getSalesCode();		//SÒR[h
								String salesName = or.getSalesName();		//SÒ¼O
								double totalMoney = or.getTotalMoney();		//vàz
								double tax = or.getTax();					//ÁïÅ
								double requestMoney = or.getRequestMoney();//¿àz
					
								out.println(String.format("<tr><td>%d</td><td>%s</td><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>",
									orderNumber,orderData,customCode,customName,salesCode,salesName,totalMoney,tax,requestMoney));
						} 
					}
				}
			%></table><br />
	
	<table border=3>
		<tr>
			<td>¤iR[h</td>
			<td>¤i¼</td>
			<td>P¿</td>
			<td>Ê</td>
			
			<%
			ArrayList<OrderItemList> orderItemList = select.getOrderItemList(orderNo);
				for (OrderItemList or : orderItemList) {
					int itemCode = or.getItemCode();
					String itemName = or.getItemName();
					int itemQuantity = or.getItemQuantity();
					double price = or.getItemPrice();

					out.println(String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td>", 
							itemCode, itemName, price, itemQuantity));
				}
			%></table></br>

	<form action="OrderDetailController" method="post">
		<input type="submit" name='deletion' value="óí" />
	</form>
	</body>
</htmt>
