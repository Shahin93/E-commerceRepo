<%-- 
    Document   : checkout
    Created on : Nov 28, 2013, 1:07:35 PM
    Author     : General
--%>

<%@page import="ecommerce.business.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1, maximum-scale=1" />
		<meta name="viewport" content="width=device-width" />
		<title>Checkout</title>
	
	<!-- Font CSS Link -->
	    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
	<!-- Font CSS Link -->	
		
	<!-- Start CSS Link -->
		<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/responsive.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/main.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/custom_responsive.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/menu.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/supermenu.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/bounce_slider.css" type="text/css" media="all" />
		<link rel="stylesheet" href="css/jcarousel.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css" media="screen" />	
		<link rel="stylesheet" href="css/grid-list.css" type="text/css" />
		<link rel="stylesheet" href="css/accrodin.css" type="text/css"/>
		<link rel="stylesheet" href="css/ui.css" type="text/css"/>
		<link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css"/>
	<!-- End CSS Link -->
	
	</head>
	<body>

		<div class="header">
			<div class="container main">
					<div class="row">
					<div class="header_top">
						<div class="currency_translator span5">	
							<div class="currency">
								CURRENCY:
									<select class="select_bg">
										<option value="dollar">DOLLAR</option>
										<option value="euro">EURO</option>
										<option value="taka">TAKA</option>
										<option value="rupe">RUPE</option>
									</select>
							</div>
							<ul class="translator">
								<li class="en"><a class="active" href="#">EN</a></li>
								<li class="en"><a href="#">ES</a></li>
								<li class="en"><a href="#">FR</a></li>
							</ul>				
						</div>
						<div class="account_login span7">
						
							<ul class="account_info">
                                                                <%
                                                                User user;
                                                                if(session.getAttribute("user")!=null){
                                                                    user = (User) session.getAttribute("user");
                                                                %>
                                                                    <li><a href="#"><img alt="" src="images/my_account.png"> Hi <%=user.getFirstName()%> <%=user.getLastName()%></a></li>
                                                                    <li><a href="wish_list.jsp"><img alt="" src="images/mywish_list.png"> MY WISHLIST</a></li>
                                                                    <li><a href="cart.jsp"><img alt="" src="images/shopping_cart.png"> MY CART</a></li>
                                                                    <li><a href="checkout.jsp"><img alt="" src="images/checkout.png"> MY CHECKOUT</a></li>
                                                                    <li><a href="logout">
                                                                        <img alt="" src="images/login.png"> SIGN OUT</a></li>
                                                                <%
                                                                }
                                                                else{
                                                                %>
                                                                    <li><a href="NotSignedIn"><img alt="" src="images/my_account.png"> MY ACCOUNT</a></li>
                                                                    <li><a href="NotSignedIn"><img alt="" src="images/mywish_list.png"> MY WISHLIST</a></li>
                                                                    <li><a href="NotSignedIn"><img alt="" src="images/shopping_cart.png"> MY CART</a></li>
                                                                    <li><a href="NotSignedIn"><img alt="" src="images/checkout.png"> MY CHECKOUT</a></li>
                                                                    <li><a href="log_in.jsp"><img alt="" src="images/login.png"> SIGN IN</a></li>
								<%
                                                                }
                                                                %>
							</ul>
						
						</div>
					</div>
					</div>
					<div class="row">
					<div class="header_top">
						<div class="span4">
							<a href="index-2.jsp">
								<div class="logo"></div>
							</a>
						</div>
						<div class="call_info span4">
							<p>PHONE: <span class="color">1 (234) 56 78 901</span></p>
							<p>Call us Monday - Saturday: 9:00 am - 6:00 pm</p>
						</div>
						<div class="cart_info span3">
							<div class="cart_data">Shopping Cart - $0.00</div>
							<button class="cart_btn btn btn-navbar" data-toggle="collapse" data-target=".item_cart_wrap"><img alt="" src="images/shopping_cart_btn_img.png"></button>
							<div class="item_cart_content">
								<div class="item_cart_wrap collapse">
									<div class="item_cart">
										<p class="item_cart_products">No Products</p>
										<p class="item_cart_info">Shipping - $0.00</p>
										<p class="item_cart_info">Total - $0.00</p>
										<button class="checkout">Checkout</button>
										<button class="cart">Cart</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				
			</div>
		</div>
			
		<div class="navigation navbar">
			
			<div class="row">
				<div class="navbar">
					<div class="container main">
	 
					<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
					<!-- Be sure to leave the brand out there if you want it shown -->
	 
					<!-- Everything you want hidden at 940px or less, place within here -->
						<div class="nav-collapse collapse">
						<!-- .nav, .navbar-search, .navbar-form, etc -->
							<ul class="sf-menu">
								<li><a href="index-2.jsp">Home</a></li>
								<li>
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										Men
									</a>
									<ul class="dropdown-menu">
										<li><a href="men.jsp">Dresses</a></li>
										<li><a href="product_details.jsp">Product Details</a></li>
									</ul>
								</li>
								<li class="deeper parent dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										Women
									</a>
									<ul class="dropdown-menu">
										<li><a href="grid.jsp">Dresses</a></li>
										<li><a href="men.jsp">Bags</a></li>
										<li><a href="product_details.jsp">Product Details</a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										Kids
									</a>
									<ul class="dropdown-menu">
										<li><a href="men.jsp">Dresses</a></li>
										<li><a href="product_details.jsp">Product Details</a></li>
									</ul>
								</li>
								<li><a href="contact.jsp">Contact Us</a></li>		
							</ul>
							<div class="search">
								<input type="search" name="search" placeholder="search">
									<button class="search_btn">
										<img alt="" src="images/icon_search.png">
									</button>
							</div>
					
						</div>
					
					</div>
				</div>
				
			</div>
			
		</div>

		<div class="breadcrumbs">
			<div class="container main">
				<ul>
					<li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Check Out</a></li>
				</ul>
			</div>	
		</div>	

		<div class="main_content">
			<div class="container main">
			<div class="row">
				<div class="span9 checkout_area">
					<h2 class="title-wrap">
						Checkout Informaiton
					</h2>
					<div class="line"></div>
						<div id="accordion">
							<h3>Step 1: <span>Checkout Information</span></h3>
							<div class="row">
							<div class="checkout_info">
								<div class="span4 new_customer">
									<h2>New Customer</h2>
									<div class="customer_select">
										<p>Mauris mauris ante</p>
										<form>
											<input type="radio" name="account" value="register"><div class="account_name">Register</div>
											<input type="radio" name="account" value="guest"><div class="account_name">Guest</div>
										</form>
									</div>	
									<p>Mauris dapibus quam id turpis dignissim rutrum. Phasellus placerat nunc.</p>
									<button class="register">Continue</button>
								</div>
								<div class="span4 returning_customer">
									<h2>Returning Customer</h2>
									<div class="customer_select">
										<p>I'm a returning customer</p>
										<form>
											<p>
												<label><small>Email<strong>*</strong></small></label>
												<input type="text" name="email" class="width" value="" size="42" tabindex="1" />
											</p>

											<p>
												<label><small>Password<strong>*</strong></small></label>
												<input type="text" name="password" class="width" value="" size="42" tabindex="2" />
											</p>
										</form>
									</div>	
									<p class="forgot_pass">Forgot your password</p>
									<button class="register">Login</button>
								</div>
							</div>
							</div>
							<h3>Step 2: <span>Billing Information</span></h3>
							<div>
								<div class="delivery_details">
									<h2>Billing Details</h2>
									<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
									<form>
										
											<label><small>Name<strong>*</strong></small></label>
											<input type="text" name="name" class="width" value="" size="42" tabindex="1" />
										
										
										
											<label><small>Last Name<strong>*</strong></small></label>
											<input type="text" name="lastname" class="width" value="" size="42" tabindex="2" />
										
										
										
											<label><small>Address Line 1<strong>*</strong></small></label>
											<input type="text" name="address" class="width" value="" size="42" tabindex="1" />
										
											<label><small>Address Line 2<strong>*</strong></small></label>
											<input type="text" name="address" class="width" value="" size="42" tabindex="1" />
									
										
									
										
											<label><small>Cell Phone No<strong>*</strong></small></label>
											<input type="text" name="cellphone" class="width" value="" size="42" tabindex="1" />
										
										
											<label><small>State<strong>*</strong></small></label>
											<input type="text" name="state" class="width" value="" size="42" tabindex="2" />
										
										
											<label><small>City<strong>*</strong></small></label>
											<input type="text" name="city" class="width" value="" size="42" tabindex="1" />
										
											<label><small>Country<strong>*</strong></small></label>
											<input type="text" name="country" class="width" value="" size="42" tabindex="2" />
										
									</form>
									<button class="confirm_btn">Confirm</button>
								</div>	
							</div>
							<h3>Step 3: <span>Delivery Details</span></h3>
							<div>
								<div class="delivery_details">
									<h2>Delivery Details</h2>
									<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
									<form>
										
											<label><small>Name<strong>*</strong></small></label>
											<input type="text" name="name" class="width" value="" size="42" tabindex="1" />
										
										
											<label><small>Last Name<strong>*</strong></small></label>
											<input type="text" name="lastname" class="width" value="" size="42" tabindex="2" />
										
										
											<label><small>Address Line 1<strong>*</strong></small></label>
											<input type="text" name="address" class="width" value="" size="42" tabindex="1" />
											
											<label><small>Address Line 2<strong>*</strong></small></label>
											<input type="text" name="address" class="width" value="" size="42" tabindex="1" />
										
										
											<label><small>Cell Phone No<strong>*</strong></small></label>
											<input type="text" name="cellphone" class="width" value="" size="42" tabindex="1" />
										
										
											<label><small>State<strong>*</strong></small></label>
											<input type="text" name="state" class="width" value="" size="42" tabindex="2" />
										
										
											<label><small>City<strong>*</strong></small></label>
											<input type="text" name="city" class="width" value="" size="42" tabindex="1" />
										
											<label><small>Country<strong>*</strong></small></label>
											<input type="text" name="country" class="width" value="" size="42" tabindex="2" />
										
									</form>
									<button class="confirm_btn">Confirm</button>
								</div>
							</div>
							<h3>Step 4: <span>Payment Methods</span></h3>
							<div>
								<div class="delivery_details">
									<form>
										<h2>Direct Bank Transfer</h2>
										<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
										<input type="radio" name="payment" value="direct_bank"><div class="account_name">Direct Bank Transfer</div>
										<h2>Cheque Payment</h2>
										<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
										<input type="radio" name="payment" value="cheque"><div class="account_name">Cheque Payment</div>
										<h2>Cash on Delivery</h2>
										<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
										<input type="radio" name="payment" value="cash"><div class="account_name">Cash on Delivery</div>
										<h2>PayPal</h2>
										<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
										<input type="radio" name="payment" value="paypal"><div class="account_name">PayPal</div>
										<h2>Moneybookers</h2>
										<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
										<input type="radio" name="payment" value="moneybookers"><div class="account_name">Moneybookers</div>		
									</form>
									<button class="confirm_btn">Confirm</button>
								</div>	
							</div>
							<h3>Step 5: <span>Confirm Orders</span></h3>
							<div>
								<div class="delivery_details confirm_details">
									<input type="checkbox" name="payment" value="moneybookers"><div class="account_name"><p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p></div>
									<button class="confirm_btn">Confirm</button>
								</div>
							</div>
							<h3>Step 6: <span>Account & Billing Details</span></h3>
							<div>
								<div class="delivery_details">
								<h2>Account & Billing Details</h2>
									<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
									<div class="row total_cost">
										<div class="span6 total_cost_section">
											<div class="total_cart_cost">
												<div class="cart_level">
													<p>sub-total:</p>
													<p>Eco-tax(-2.00)</p>
													<p>Vat (10.0%):</p>
													<p><span>total:</span></p>
												</div>
												<div class="cart_amount">
													<p>$1170.00</p>
													<p class="tax">$2.00</p>
													<p class="vat">$117.00</p>
													<p><span>$1053.00</span></p>
												</div>
											</div>
											<div class="total_cart_cost_btn">
												<button class="checkout">checkout</button>
												<button class="continue">continue</button>
											</div>
										</div>
									</div>
							
									</div>
							</div>
						</div>	

				</div>
				<div class="span3 widget-area">
					<div class="right-sidebar">
						<div class="widget-info">
							<div class="widget-title">Categories</div>
							<div class="line"></div>
							<div class="widget-content">
								<ul>
									<li><a href="#">Dresses</a></li>
									<li><a href="#">Bags & Purses</a></li>
									<li><a href="#">Coats & Jackets</a></li>
									<li><a href="#">Accessories</a></li>
									<li><a href="#">Designer</a></li>
									<li><a href="#">Jeans</a></li>
									<li><a href="#">Jewellery & Watches</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-info">
							<div class="widget-title">By Price</div>
							<div class="line"></div>
							<div class="widget-price">
								<ul>
									<li><a href="#">0 - $1,700.00</a></li>
									<li><a href="#">$20 - $2,800.00</a></li>
									<li><a href="#">$50 - $2,900.00</a></li>
									<li><a href="#">$75 - $3,990.00</a></li>
									<li><a href="#">$100 - $4,600.00</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-info">
							<div class="widget-title">Manufacturer</div>
							<div class="line"></div>
							<div class="widget-content">
								<form>
									<div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">Adidas</div></div>
									<div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Nike</div></div>
									<div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">T-Shirt</div></div>
									<div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Puma</div></div> 
									<div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">Denim</div></div>
									<div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Dedeman</div></div> 
									<div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">New wear</div></div>
								</form>
							</div>
						</div>
						<div class="widget-info">
							<div class="widget-title">View History</div>
							<div class="line"></div>
							<div class="widget-content">
								<div class="history-product-image">	
									<a href="#"><img src="images/product-list/htstory.png" alt="" /></a>
								</div>
								<div id="feature-post-content">
									<div>
										<button class="shop-now">Shop Now</button> 
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>				
			</div>	
			</div>
			
		</div>
		
		<div class="contact_info">
			<div class="container main">
				<ul class="row">
					<li class="follow-us span4">
						<div class="follow-social">Follow us on:</div>
						<div class="social-icon">
							<ul>
								<li class="fb">
									<a href="#"><img alt="" src="images/social/facebook.png"></a>
								</li>
								<li class="tw">
									<a href="#"><img alt="" src="images/social/twitter.png"></a>
								</li>
								<li class="rss">
									<a href="#"><img alt="" src="images/social/rss.png"></a>
								</li>
								<li class="yt">
									<a href="#"><img alt="" src="images/social/youtube.png"></a>
								</li>
							</ul>
						</div>
					</li>
					<li class="span4">
					<div class="free-shipping">
						<div class="free-shipping-wrap">
							<div class="free-shipping-image">
								<img alt="" src="images/social/shiping-truck.png">
							</div>
							<div class="free-shipping-info">
								<div id="free-shipping-info-title">
									Free Shipping
								</div>
								<div id="free-shipping-info">
									On Orders  Over $ 499
								</div>
							</div>
						</div>	
					</div>	
					</li>
					<li class="contact-no span4">
						<div class="contact-no-wrap">
							<div class="contact-no-image">
								<img alt="" src="images/social/telephone.png">
							</div>
							<div class="contact-no-info">
								<div id="contact-no-info-title">
									Order Online
								</div>
								<br/>
								<div id="contact-no-info">
									<p>Phone:</p>
									<p id="nb">1 (234) 56 78 901</p>
								</div>
							</div>
						</div>
					</li>
				</ul>	
			</div>

		</div>		
	
		<div class="footer">
			<div class="footer-top">
				<div class="container main" id="footer-top">
					
					<div class="row">
						<div class="span3 footer-col">
							<div class="widget-info">
								<div class="widget-title">Information</div>
								<div class="line"></div>
								<div class="widget-content">
									<ul>
										<li><a href="#">About Us</a></li>
										<li><a href="#">Customer Service</a></li>
										<li><a href="#">Privacy Policy</a></li>
										<li><a href="#">Site Map</a></li>
										<li><a href="#">Contact Us</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="span3 footer-col">
							<div class="widget-info">
								<div class="widget-title">Why Buy From Us</div>
								<div class="line"></div>
								<div class="widget-content">
									<ul>
										<li><a href="#">Shipping & Returns</a></li>
										<li><a href="#">Secure Shopping</a></li>
										<li><a href="#">International Shipping</a></li>
										<li><a href="#">Affiliates</a></li>
										<li><a href="#">Group Sales</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="span3 footer-col">
							<div class="widget-info">
								<div class="widget-title">My Account</div>
								<div class="line"></div>
								<div class="widget-content">
									<ul>
										<li><a href="#">Sign In</a></li>
										<li><a href="#">Customer Service</a></li>
										<li><a href="#">My Wishlist</a></li>
										<li><a href="#">Track My Order</a></li>
										<li><a href="#">Help</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="span3 footer-col">
							<div class="widget-info">
								<div class="widget-title">Newsletter</div>
								<div class="line"></div>
								<div class="widget-content">
									<input type="text" name="mail" placeholder="Your E-mail Address">
									<button class="go_btn">Go</button>
									<br/>
									<p>Store Location: <span>8601 Creat Labaratory, New York, D05 86GR</span></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container main" id="footer-bottom">
					<div class="row">
						<div class="span8 footer-col">
							Copyright &#169; 2013 <a href="#">Fedimo</a>. All rights reserved.
						</div>
						<div class="span4 footer-col">
							<ul>
								<li><a href="#"><img alt="" src="images/payment-getway/1.png"></a></li>
								<li><a href="#"><img alt="" src="images/payment-getway/2.png"></a></li>
								<li><a href="#"><img alt="" src="images/payment-getway/3.png"></a></li>
								<li><a href="#"><img alt="" src="images/payment-getway/4.png"></a></li>
								<li><a href="#"><img alt="" src="images/payment-getway/5.png"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Start JS Link -->
		<script src="js/js-engine.js"></script>
		<script type="text/javascript" src="js/menu/jquery.min.js"></script>
		<script type="text/javascript" src="js/menu/superfish.js"></script>
		<script type="text/javascript" src="js/bounceslider/modernizr.js"></script>
		<script type="text/javascript" src="js/bounceslider/jquery.bounceslider.js"></script>
		<script type="text/javascript" src="js/new-product-js/jquery.jcarousel.min.js"> </script>
		<script type="text/javascript" src="js/new-product-js/responsiveslides.min.js"></script>
		<script type="text/javascript" src="js/bxslider/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="js/bxslider/jquery.bxslider.js"></script>
		<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
		<script type="text/javascript" src="js/mixitup/jquery-ui.sortable.min.js"></script>
		<script type="text/javascript" src="js/mixitup/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="js/mixitup/jquery.mixitup.min.js"></script>
		<script type="text/javascript" src="js/mixitup/mixitop-inline.js"></script>
		<script type="text/javascript" src="js/mixitup/ga.js"></script>
		<script type="text/javascript" src="js/mixitup/cloudflare.min.js"></script>
		<script type="text/javascript" src="js/contact_form/jquery.form.js"></script>
		<script type="text/javascript" src="js/contact_form/init_form.js"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<script type="text/javascript" src="js/zoom/jquery.jqzoom-core.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/custom.js"></script>
	<!-- End JS Link -->		
	</body>	