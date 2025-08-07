<%@ page import="dao.ItemDAO" %>
<%
  String itemNo = request.getParameter("item_id");
  ItemDAO dao = new ItemDAO();
  dao.deleteItem(itemNo);
  response.sendRedirect("additem.jsp");
%>
