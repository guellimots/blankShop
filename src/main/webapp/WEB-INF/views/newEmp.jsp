<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>新增員工</title>
  
<!-- datepicker --> 

  <!-- daterange picker -->
  <link rel="stylesheet" href="/blankShop/plugins/daterangepicker/daterangepicker.css">
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="/blankShop/js/backEnd/addemp.js"></script>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
	<!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/blankShop/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">



</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>員工資料管理</h1>
            </div>
<!--             <div class="col-sm-6"> -->
<!--               <ol class="breadcrumb float-sm-right"> -->
<!--                 <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--                 <li class="breadcrumb-item active">General Form</li> -->
<!--               </ol> -->
<!--             </div> -->
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">新增員工</h3>
                </div>
 
              <form action="/blankShop/emp/newemp" id='form1' name="form1" method="post"  enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="row">
                      <div class="form-group col-6">
                        <label for="exampleInputEmail1">姓名</label>
                        <input type="text" class="form-control" id="empName" name="empName" placeholder="輸入姓名.." onblur='checkName()'/>
                        <span class="sp" id="verifyNameResult"></span>
                      </div>
                      <div class="form-group col-6">
                        <label for="exampleInputPassword1">聯絡電話</label>
                        <input type="text" class="form-control" id="mobile" name='mobile' placeholder="輸入電話.." onblur='checkMobile()' />
                        <span class="sp" id="verifyMobileResult"></span>
                      </div>
                    </div>
                    
        <!--   datePicker -->
                 <div class="row">   
                 <div class="form-group col-6">
                    <label>生日</label><br>
                    <input id="birthday" type="date" name="birthday" onblur='checkDate()'/>
                    <span class="sp" id="verifyBirthResult"></span>
                        
          
                </div>
                  <div class="form-group col-6">
                    <label>到職日</label><br>
                       <input id="hireDate" type="date" name="hireDate" onblur='checkDate1()'/>
                       <span class="sp" id="verifyHireDateResult"></span>
                </div>
                </div>
                            
                    <div class="row">
                      <div class="form-group col-6">
                        <label for="exampleInputPassword1">電子郵件</label>
                        <input type="text" class="form-control" id="email" name='email' placeholder="輸入E-mail" onblur='checkEmail()' />
                        <span class="sp" id="verifyEmailResult"></span>
                      </div>
                      <div class="form-group col-6">
                        <label for="exampleInputPassword1">身分證</label>
                        <input type="text" class="form-control" id="personID" name='personID' placeholder="第一個英文字大寫.." onblur='checkIdentID()' />
                        <span class="sp" id="verifyPersonIDResult"></span>
                      </div>
                    </div>



                    <div class="row">
                      <div class="form-group col-6">
                        <label for="exampleInputPassword1">地址</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="區碼 地址.." onblur='checkAddress()' />
                        <span class="sp" id="verifyAddressResult"></span>
                      </div>
                      <div class="form-group col-6">
                        <label for="exampleInputPassword1">登入密碼</label>
                        <input type="text" class="form-control" id="password" name="password"
                          placeholder="6位以上含數字,英文,特殊符號.." onblur="checkPassword()" />
                          <span class="sp" id="verifyPasswordResult"></span>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-6">
                        <label for="exampleInputFile">照片上傳</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input"  accept="image/*" accept="image/*" id="upload_img" name="fileUpload" onchange="showUpload(event)">
                            <label class="custom-file-label" for="exampleInputFile">選擇檔案</label>
                          
                          </div>
                        </div>
                        <br>
                        <img id="previewArea" src="${strbase64}" class="rounded float-left" style="width: 10rem ;display:none" 
                        alt="..." >
      
                      </div>

                      <div class="form-group col-6">

                        <div class="card card-secondary">

                          <div class="card-body">

                            <div class="row">
                              <p>職稱</p>
                              <div class="custom-control custom-radio">
                                <input type="radio" class="form-check-input with-gap" id="rankTitle1" name="rankTitle" value="員工"
                                  checked>
                                <label class="customRadio1" for="radioGap1">員工 </label>
                              </div>

                              <div class="custom-control custom-radio">
                                <input type="radio" class="form-check-input with-gap" id="rankTitle2" name="rankTitle" value="主管">
                                <label class="customRadio1" for="radioGap2">主管</label>
                              </div>


                            </div>
                            <div class="row">
                              <p>權限</p>
                              <div class="custom-control custom-radio">
                                <input type="radio" class="form-check-input with-gap" id="empStatus1" name="empStatus"
                                  value="Y" checked>
                                <label class="customRadio1" for="radioGap1">開啟 </label>
                              </div>

                              <div class="custom-control custom-radio">
                                <input type="radio" class="form-check-input with-gap" id="empStatus2" name="empStatus"
                                  value="N">
                                <label class="customRadio1" for="radioGap2">關閉</label>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-12">
                                <!-- select -->
                                <div class="form-group">
                                  <label>所屬部門</label>
                                  <select class="custom-select" name="deptNo" id="dept">
                                    <option value="100">管理部</option>
                                    <option value="200" selected="selected">行銷部</option>
                                    <option value="300">創意部</option>

                                  </select>
                                </div>
                              </div>

                            </div>

                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                    </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                      <button type="submit" id="but01" class="btn btn-primary">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;
                      <button type="reset" class="btn btn-primary">reset</button>&nbsp;&nbsp;&nbsp;&nbsp;
                      
                      <input type ='button' class="btn btn-primary" style="background-color: #9F4D95;" onclick="KeyIn();" value="一鍵輸入"></input>

                    </div>
                </form>
              </div>



            </div>
            <!--/.col (left) -->
            <!-- right column -->

            <!--/.col (right) -->
          </div>
          <!-- /.row -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">

    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="/blankShop/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="/blankShop/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <!-- date-range-picker -->
  <script src="/blankShop/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- bs-custom-file-input -->
  <script src="/blankShop/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
  <!-- BS-Stepper -->
<script src="/blankShop/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="/blankShop/plugins/dropzone/min/dropzone.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/blankShop/js/backEnd/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="/blankShop/js/backEnd/demo.js"></script>
  <!-- Page specific script -->
  <script src="/blankShop/js/backEnd/addemp.js"></script>
  <script>
    $(function () {
      bsCustomFileInput.init();
    });
  </script>
  <script>
    //圖片預覽
    function showUpload(event) {
      var reader = new FileReader();
      reader.onload = function () {
        var previewArea = document.getElementById('previewArea');
        previewArea.src = reader.result;
        document.getElementById("previewArea").style = "width: 12rem ;display:default" ;
      };
      reader.readAsDataURL(event.target.files[0]);

    }

    
    
   
  </script>
</body>

</html>