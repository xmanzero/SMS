<%-- 
    Document   : getdata
    Created on : May 27, 2014, 9:46:31 AM
    Author     : smile_000
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="path.Dir"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectdb.MySQLConnect" %>

<%
    MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
    ResultSet result;
    int pagni = 0;
    String type = request.getParameter("type");
    //type="count";
    if (type == "count") {

        String ite = request.getParameter("items");
        //ite="5";
        result = connect.excuteQuery("Select count(id) as co from all_sms_queue_in");
        String count = "";
        while (result.next()) {
            count = result.getString("co");
        }
        int total = Integer.parseInt(count);
        int item = Integer.parseInt(ite);
        if ((total % item) == 0) {
            pagni = total / item;
        } else {
            pagni = total / item + 1;
        }
        JSONObject obj = new JSONObject();
        //obj.put("to", "foo");
        obj.put("total", new Integer(pagni));
        //out.print(count);
        out.print(obj);
    }
    if(type=="list"){
        String ite= request.getParameter("item");
        String curren= request.getParameter("currentPage");
        int item= Integer.parseInt(ite);
        int currentPage= Integer.parseInt(curren);
        int offset= (currentPage-1)*item;
        String sql= "Select * from all_sms_queue_in limit"+offset+","+item;
        result=connect.excuteQuery(sql);
        String[] book;
        while(result.next()){
           
        }
        
    }
%>
