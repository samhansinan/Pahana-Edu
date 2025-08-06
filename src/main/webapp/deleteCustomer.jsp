<%@ page import="dao.CustomerDAO" %>
<%
    String accNo = request.getParameter("accountNumber");
    CustomerDAO dao = new CustomerDAO();
    dao.deleteCustomer(accNo);
    response.sendRedirect("addCustomer.jsp");
%>
