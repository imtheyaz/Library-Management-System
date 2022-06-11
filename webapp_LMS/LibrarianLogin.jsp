<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>SignUp || SignIn</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
   <p align="center">
        </div>
      </div>
    
      <!-----Account-page----->
      <div class="account-page">
          <div class="container">
              <div class="row">
                  <div class="col-2">
                      <img  width="100%">
                  </div>
                  <div class="col-2">
                      <div class="form-container">
                          <div class="form-btn">
                              <span onclick="login()">Login</span>
                              <span onclick="register()">Register</span>
                              <hr id="Indicator">
                          </div>
                          <form id="LoginForm" action="Login" method="post">
                              <input type="text" placeholder="Username" name="uname">
                              <input type="password" placeholder="Password" name="pass">
                              <button type="submit" class="btn">Login</button>
                              <a href="forgot.jsp">Forgot password</a>
                          </form>
                          <form id="RegForm" action="Register" method="post">
                            <input type="text" placeholder="Username" name="uname">
                            <input type="email" placeholder="Email" name="email">
                            <input type="number" placeholder="Phone" name="phone">
                            <input type="password" placeholder="Password" name="pass">
                            <button type="submit" class="btn">Register</button>
                        </form>
                      </div>  
                  </div>
              </div>
          </div>
      </div>
</p>

     
      <script>
          var LoginForm = document.getElementById("LoginForm");
          var RegForm=document.getElementById("RegForm");
          var Indicator=document.getElementById("Indicator");
          function register(){
              RegForm.style.transform="translateX(0px)";
              LoginForm.style.transform="translateX(0px)";
              Indicator.style.transform="translateX(100px)";
          }
          function login(){
              RegForm.style.transform="translateX(300px)";
              LoginForm.style.transform="translateX(300px)";
              Indicator.style.transform="translateX(0px)";
          }
      </script>
      </body>
      </html>