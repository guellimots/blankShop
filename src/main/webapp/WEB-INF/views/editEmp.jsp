<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Query and update Employee</title>
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/blankShop/plugins/uplot/uPlot.min.css">

<script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>

.but01{
 padding: 3px;
 font: 14px "微軟雅黑";
 width: 200px;

}

.but02{
 padding: 3px;
 font: 14px "微軟雅黑";
 width: 100px;

}
</style>


</head>
<body>
<div class="card card-primary">
  <div class="card-header">
        <h3 class="card-title">員工查詢與維護</h3>
       </div>


<hr>

<table class="dataTable cell-border stripe hover"  id="EmployeeList" style="width: 100%">
              <thead class="thead-light">
               <tr>
                <th>員工編號</th>
                <th>姓名</th>
                <th>電話</th>
                <th>住址</th>
                <th>部門</th>
                <th>職稱</th>
                <th>到職日</th>
               </tr>
              </thead>
             </table>

<script type="text/javascript">
$(function(){
	
	if("${msg}".length>0)
	swal("資料變更成功!!","","success",{button:"確定"})
//     if("${msg}"=="success")
//  	  {alert("資料新增成功!!");}

})


  //創建TABLE

  $(function() {
   $('#EmployeeList').DataTable({
    "destroy" : true,
    "sAjaxSource" : "/blankShop/emp/showAllEmployees",
    "sAjaxDataProp" : "",
    "order" : [ [ 3, "desc" ] ],
    "columnDefs": [
		{ targets: 0,
		render: function(data) {
			 return "<a href=../emp/updateEmp/"+data+">"+data+"</a>"
			}
		}   
	],
    "aoColumns" : [ {
     "mData" : "empId"
    }, {
     "mData" : "empName"
    }, {
     "mData" : "mobile"
    }, {
     "mData" : "address"
    }, {
     "mData" : "deptNo.deptName"
    }, {
     "mData" : "rankTitle"
    },{
     "mData" : "hireDate"
    },  ]
   });
   
  })

  
  
 </script>


</div>
</body>
</html>