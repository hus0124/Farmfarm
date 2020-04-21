<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import = "edu.Farmfarm.domain.SensorVO" %> --%>
<%-- <%@ page import="java.util.List" %>     --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<%-- <% List<SensorVO> pageList = (List<SensorVO>)request.getAttribute("testList");%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	
      function drawChart() {
       
    	var data = google.visualization.arrayToDataTable([
    		['Time', 'Temp'],
    		['${testList.get(0).getTime()}', ${testList.get(0).getTemp()}],
    		['${testList.get(1).getTime()}', ${testList.get(1).getTemp()}],
    		['${testList.get(2).getTime()}', ${testList.get(2).getTemp()}],
    		['${testList.get(3).getTime()}', ${testList.get(3).getTemp()}],
    		['${testList.get(4).getTime()}', ${testList.get(4).getTemp()}],
    		['${testList.get(5).getTime()}', ${testList.get(5).getTemp()}],
    		['${testList.get(6).getTime()}', ${testList.get(6).getTemp()}]
//           ['Year', 'Sales', 'Expenses'],
//           ['2004',  1000,      400],
//           ['2005',  1170,      460],
//           ['2006',  660,       1120],
//           ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
    
  </body>
</html>