function getFooter(){
	return "<div class=\"container\">\r\n\t\t\t\t<div class=\"row\">\r\n\t\t\t\t\t<div class=\"col-sm-7 col-md-3\">\r\n\t\t\t\t\t\t<h3>Mold Discover</h3>\r\n\t\t\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.\r\n\t\t\t\t\t\t\tConsequuntur, quia, architecto? A, reiciendis eveniet! Esse est\r\n\t\t\t\t\t\t\teaque adipisci natus rerum laudantium accusamus magni.</p>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class=\"col-sm-5 col-md-2\">\r\n\t\t\t\t\t\t<h3>Quick Link</h3>\r\n\t\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t\t<li>Holiday Package</li>\r\n\t\t\t\t\t\t\t<li>Summer Adventure</li>\r\n\t\t\t\t\t\t\t<li>Bus and Trasnportation</li>\r\n\t\t\t\t\t\t\t<li>Ticket and Hotel Booking</li>\r\n\t\t\t\t\t\t\t<li>Trek and Hikings</li>\r\n\t\t\t\t\t\t</ul>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class=\"col-sm-7 col-md-4\">\r\n\t\t\t\t\t\t<h3>Newsletter Signup</h3>\r\n\t\t\t\t\t\t<p>Subscribe to our weekly newsletter to get news and update</p>\r\n\t\t\t\t\t\t<br>\r\n\t\t\t\t\t\t<div class=\"input-group\">\r\n\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" placeholder=\"Your Email\">\r\n\t\t\t\t\t\t\t<div class=\"input-group-btn\">\r\n\t\t\t\t\t\t\t\t<button class=\"btn btn-primary\">Subscribe</button>\r\n\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class=\"col-sm-5 col-md-2\">\r\n\t\t\t\t\t\t<h3>Contact Info</h3>\r\n\t\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t\t<li>Mold Discover</li>\r\n\t\t\t\t\t\t\t<li>info@moldthemes.com</li>\r\n\t\t\t\t\t\t</ul>\r\n\t\t\t\t\t\t<div class=\"clearfix\">\r\n\t\t\t\t\t\t\t<div class=\"social-icon-list\">\r\n\t\t\t\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t\t\t\t<li><a href=\"#\" class=\"icon-facebook\"></a></li>\r\n\t\t\t\t\t\t\t\t\t<li><a href=\"#\" class=\"icon-twitter\"></a></li>\r\n\t\t\t\t\t\t\t\t\t<li><a href=\"#\" class=\"icon-mail\"></a></li>\r\n\t\t\t\t\t\t\t\t</ul>\r\n\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t\t<div class=\"container copy\">\r\n\t\t\t\t<span>&copy;</span> Copyright Mold Discover, 2017\r\n\t\t\t</div>";
}

function getHeaderOffice(user){
	return "<header class=\"nav-menu fixed-top\">" +
				"<nav class=\"navbar normal\">" +
					"<div class=\"container-fluid\">" +
						"<div class=\"navbar-header\">" +
							"<a class=\"navbar-brand\" href=\"/travels_ui/initiate.action\">" +
								"<div class=\"mold-logo\">" +
									"<div class=\"mold\" style=\"font-size: 10px\">Booking</div>" +
									"<div class=\"logo\">" +
									"</div>" +
									"<div class=\"logo-txt\" style=\"font-size: 25px\">" +
										"Health Moniotr" +
									"</div>" +
								"</div>" +
							"</a>" +
							"<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#main-navbar\">" +
								"<span class=\"sr-only\">Toggle navigation</span> " +
								"<span class=\"icon-bar\"></span> " +
								"<span class=\"icon-bar\"></span>" +
								"<span class=\"icon-bar\"></span>" +
							"</button>" +
						"</div>" +
						"<div>" +
							"<div class=\"navbar-collapse collapse\" id=\"main-navbar\">" +
								"<ul class=\"nav navbar-nav\">" +
									"<li>" +
										"<a href=\"#\">"+user.displayName+"</a>" +
									"</li>" +
									"<li>" +
										"<a href=\"/travels_ui/login/logout.action\">" +
											"<span class=\"icon-logout\"></span>LogOut" +
										"</a>" +
									"</li>" +
								"</ul>" +
							"</div>" +
						"</div>" +
					"</div>" +
				"</nav>" +
			"</header>";
}

function getHeader(user){
	var loginText="";
	if (user.userName == '') {
		loginText = "<li>" + "<a href=\"/travels_ui/login_initiate.action\">"
				+ "<span class=\"icon-user\"></span>Log In" + "</a>" + "</li>"
				+ "<li>" + "<a href=\"/travels_ui/signup_initiate.action\"> "
				+ "<span class=\"icon-user\"></span>Sign UP" + "</a>" + "</li>";
	} else {
		var menuText = "";
		if (user.userType == 2) {
			menuText = "<li>"
					+ "<a href=\"/travels_ui/process/list_booking.action\">"
					+ "Bookings" + "</a>" + "</li>";
		}
		loginText = menuText + "<li>" + "<a href=\"#\">" + user.userName
				+ "</a>" + "</li>" + "<li>"
				+ "<a href=\"/travels_ui/login/logout.action\">"
				+ "<span class=\"icon-logout\"></span>LogOut" + "</a>"
				+ "</li>";
	}
	return "<header class=\"nav-menu fixed-top\">" +
				"<nav class=\"navbar normal\">" +
					"<div class=\"container-fluid\">" +
						"<div class=\"navbar-header\">" +
							"<a class=\"navbar-brand\" href=\"/travels_ui/initiate.action\">" +
								"<div class=\"mold-logo\">" +
									"<div class=\"mold\" style=\"font-size: 10px\">Booking</div>" +
									"<div class=\"logo\">" +
									"</div>" +
									"<div class=\"logo-txt\" style=\"font-size: 25px\">" +
										"Health Monitor" +
									"</div>" +
								"</div>" +
							"</a>" +
							"<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#main-navbar\">" +
								"<span class=\"sr-only\">Toggle navigation</span> " +
								"<span class=\"icon-bar\"></span> " +
								"<span class=\"icon-bar\"></span>" +
								"<span class=\"icon-bar\"></span>" +
							"</button>" +
						"</div>" +
						"<div>" +
							"<div class=\"navbar-collapse collapse\" id=\"main-navbar\">" +
								"<ul class=\"nav navbar-nav\">" +
									loginText +
								"</ul>" +
							"</div>" +
						"</div>" +
					"</div>" +
				"</nav>" +
			"</header>";
}


