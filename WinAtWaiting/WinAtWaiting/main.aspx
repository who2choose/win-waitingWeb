<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WinAtWaiting.main1" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <title>Win @ Waiting</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <div id="home" class="banner">
        <div class="container">
            <div class="banner-info text-center">
                <img src="images/hourglass.png" alt="" />
                <h1>WIN @ WAITING</h1>
                <h2>WHY WASTE TIME WHEN YOU COULD BE SAVING IT?</h2>
                <h3 id="banner_welcome_message" runat="server"></h3>
            </div>
        </div>
    </div>
    <!-- //banner -->
    <!-- navigation -->
    <div class="navigation">
        <div class="wrap">
            <div class="fixed-header">
                <div class="nav-left">
                    <a href="#">
                        <img src="images/hourglass2.png" alt="" /></a>
                </div>
                <div class="nav-right">
                    <span class="menu">
                        <img src="images/menu.png" alt="" /></span>
                    <nav class="cl-effect-1">
                        <ul class="nav1">
                            <li><a class="scroll" href="#home">HOME</a></li>
                            <li><a class="scroll" href="#pricing">TASKS</a></li>
                            <li><a class="scroll" href="#clients-info">ADD TASK</a></li>
                            <li><a class="scroll" href="#clients">TODO</a></li>
                            <li><a class="scroll" href="#contact-info">CONTACT</a></li>
                        </ul>
                    </nav>
                    <!-- script for menu -->
                    <script>
                        $("span.menu").click(function () {
                            $("ul.nav1").slideToggle(300, function () {
                                // Animation complete.
                            });
                        });
                    </script>
                    <!-- //script for menu -->
                    <!-- script-for sticky-nav -->
                    <script>
                        $(document).ready(function () {
                            var navoffeset = $(".navigation").offset().top;
                            $(window).scroll(function () {
                                var scrollpos = $(window).scrollTop();
                                if (scrollpos >= navoffeset) {
                                    $(".navigation").addClass("fixed");
                                } else {
                                    $(".navigation").removeClass("fixed");
                                }
                            });

                        });
                    </script>
                    <!-- /script-for sticky-nav -->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- pricing tables -->
    <div id="pricing" class="pricing">
        <div class="container">
            <div class="pricing-info">
                <h3>Task List</h3>
                <div class="strip"></div>
                <p>Here you can find a list of the tasks you have created on the web or mobile device.</p>
            </div>
            <div class="pricing-grids" id="thisistomod" runat="server">
                <!-- Fill this in with stuff -->
            </div>
        </div>
    </div>
    <!-- //pricing tables -->
    <!-- Add Task -->
    <div id="clients-info" class="addtask">
        <div class="container">
            <div class="pricing-info">
                <h3>Create New Tasks</h3>
                <div class="strip"></div>
                <p>Here you can add a new task to be viewed later.</p>
            </div>
            <div class="addtask-info">
                <div class="setline-info">
                    <form runat="server">
                        <input runat="server" id="addtask_name" type="text" placeholder="Name" />
                        <p>
                            Duration:
                                <asp:DropDownList runat="server" CssClass="ddl" ID="addtask_duration">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                </asp:DropDownList>
                        </p>
                        <p>
                            Private:
                                <asp:CheckBox runat="server" ID="addtask_privacy" CssClass="cbx" Checked="true" />
                        </p>
                        <p>
                            Priority:
                                <asp:DropDownList runat="server" CssClass="ddl" ID="addtask_priority">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                        </p>
                        <input runat="server" id="addtask_description" type="text" maxlength="200" placeholder="Additional Information" />
                        <br />
                        <a runat="server" onserverclick="buttonAddTask" class="hvr-sweep-to-right button">ADD</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //Add Task -->
    <!-- clients -->
    <div id="clients" class="clients">
        <div class="container">
            <div class="clients-info">
                <h3>To Do List</h3>
                <div class="strip"></div>
                <p>Take a look at your to-do list and get things done.</p>
            </div>
            <form>
                <div class="client-center">
                    <textarea id="todolist_textarea1" name="todolist_textarea1" runat="server" maxlength="200"> </textarea>
                    <textarea id="todolist_textarea2" name="todolist_textarea2" runat="server" maxlength="200"> </textarea>
                    <textarea id="todolist_textarea3" name="todolist_textarea3" runat="server" maxlength="200"> </textarea>
                    <textarea id="todolist_textarea4" name="todolist_textarea4" runat="server" maxlength="200"> </textarea>
                    <textarea id="todolist_textarea5" name="todolist_textarea5" runat="server" maxlength="200"> </textarea>
                </div>
            </form>
            <div class="learnmore">
                <a runat="server" onserverclick="buttonSaveTodo" class="hvr-sweep-to-right button">SAVE</a>
            </div>
        </div>
    </div>
    <!-- //clients --
    <!-- contact -->
    <div id="contact" class="contact">
        <div class="container">
            <div class="contact-info">
                <h3>Contact Us</h3>
                <div class="strip"></div>
            </div>
            <div class="contact-form">
                <form>
                    <div class="contact-left">
                        <input type="text" placeholder="Name" required>
                        <input type="text" placeholder="E-mail" required>
                        <input type="text" placeholder="Subject" required>
                    </div>
                    <div class="contact-right">
                        <textarea placeholder="Message" required></textarea>
                    </div>
                    <div class="clearfix"></div>
                    <input type="submit" value="SUBMIT">
                </form>
            </div>
        </div>
    </div>
    <!-- //contact -->
    <!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="footer-left">
                <p>Copyright &copy; 2015 Win @ Waiting</p>
            </div>
            <div class="footer-right">
                <ul>
                    <li><a href="#" class="fb"></a></li>
                    <li><a href="#" class="twit"></a></li>
                    <li><a href="#" class="googl"></a></li>
                    <li><a href="#" class="linkin"></a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //footer -->
    <!-- here stars scrolling icon -->
    <script type="text/javascript">
        $(document).ready(function () {
            /*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
				};
			*/

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <!-- //here ends scrolling icon -->
</body>
</html>
