<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WinAtWaiting.login2" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Win @ Waiting</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />
    <!--//fonts-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="OMEGA Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <!-- js -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!-- js -->
    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
            });
        });
    </script>
    <!-- start-smooth-scrolling -->

</head>
<body>
    <!-- banner -->
    <form runat="server" >
        <div id="home" class="banner">
            <div class="container">
                <!-- error -->
                <div id="form_error" runat="server">
                    <div class="banner-info text-center">
                        <h1>Win at Waiting is currently offline</h1>
                        <h2>We apologize for any inconvenience</h2>
                    </div>
                </div>
                <!-- login -->
                <div id="form_login" runat="server">
                    <div class="banner-info text-center">
                        <img src="images/hourglass.png" alt="" />
                        <h1>WIN @ WAITING</h1>
                        <h2>WHY WASTE TIME WHEN YOU COULD BE SAVING IT?</h2>
                        <div class="contact-form">
                            <div class="contact-center">
                                <input runat="server" id="text_email" type="text" placeholder="E-Mail" />
                            </div>
                            <div class="contact-center">
                                <input runat="server" type="password" id="text_password" placeholder="Password" />
                            </div>
                            <div class="contact-center">
                                <p id="text_email_error" runat="server" style=" color: #FFFFFF; font-size: x-large; font-weight: bold;" visible="false" >Your email or password entered is incorrect</p>
                            </div>
                            <div class="learnmore">
                                <a runat="server" onserverclick="buttonLogin" class="hvr-sweep-to-right button">LOGIN</a>
                                <a runat="server" onserverclick="buttonRegisterPage" class="hvr-sweep-to-right button">REGISTER</a>
                                <a href="mysql.aspx" class="hvr-sweep-to-right button">HEY! DON'T CLICK THIS BUTTON</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- register -->
                <div id="form_register" runat="server">
                    <div class="banner-info text-center">
                        <img src="images/hourglass.png" alt="" />
                        <div class="contact-form">
                            <div class="contact-center">
                                <input runat="server" id="text_reg_email" type="text" placeholder="E-Mail" />
                            </div>
                            <div class="contact-center">
                                <input runat="server" id="text_reg_fname" type="text" placeholder="First Name" />
                            </div>
                            <div class="contact-center">
                                <input runat="server" id="text_reg_lname" type="text" placeholder="Last Name" />
                            </div>
                            <div class="contact-center">
                                <input runat="server" id="text_reg_pass" type="text" placeholder="Password" />
                            </div>
                            <div class="contact-center">
                                <input runat="server" id="text_reg_conpass" type="text" placeholder="Confirm Password" />
                            </div>
                            <div class="contact-center">
                                <p id="text_reg_error" runat="server" style=" color: #FFFFFF; font-size: x-large; font-weight: bold;" visible="false" ></p>
                            </div>
                            <div class="learnmore">
                                <a runat="server" onserverclick="buttonLoginPage" class="hvr-sweep-to-right button">CANCEL</a>
                                <a runat="server" onserverclick="buttonRegister" class="hvr-sweep-to-right button">REGISTER</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
