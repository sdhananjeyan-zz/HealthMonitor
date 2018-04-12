<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Monitor</title>

<link rel="icon" type="image/png"
	href="/HealthMonitor/assets/img/favicon.png" />
<link rel="stylesheet" href="/HealthMonitor/assets/css/bootstrap.css"
	media="all">
<link rel="stylesheet" href="/HealthMonitor/assets/css/jqueryui.css"
	media="all">
<link rel="stylesheet"
	href="/HealthMonitor/vendor/animate-css/animate.css" media="all">
<link rel="stylesheet"
	href="/HealthMonitor/assets/font/iconfont/iconstyle.css" media="all">
<link rel="stylesheet"
	href="/HealthMonitor/assets/font/font-awesome/css/font-awesome.css"
	media="all">
<link rel="stylesheet" href="/HealthMonitor/assets/css/main.css"
	media="all">
<!-- Load c3.css -->
<link href="/HealthMonitor/assets/css/c3.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="/HealthMonitor/assets/js/d3.v3.min.js" charset="utf-8"></script>
<script src="/HealthMonitor/assets/js/c3.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
</head>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBuSxoAXeIvZ8GUmToOf4sI1TPXkXkAnhU&libraries=places"></script>
<script type="text/javascript" src="/HealthMonitor/assets/js/layout.js"></script>
<script type="text/javascript" src="/HealthMonitor/assets/js/layout.js"></script>

<script>
	var app = angular.module('myApp', []);
	app
			.controller(
					'myCtrl',
					function($scope, $http) {
						$scope.user;
						$scope.user = {
								"userName":'<s:property value="activeUser"/>',
								"userId":'<s:property value="activeUser"/>',
								"userType":'admin'
						}
						
						$scope.calc = function calculate() {
							
						}
						$scope.init = function(){
							$('#header').html(getHeader($scope.user));
							$('#footer').html(getFooter());
							
							//$scope.calc();
						}
						$scope.machines = [
							{
								"ipAddress": "127.0.0.1",
								"hostName":"my-win"
							},
							{
								"ipAddress": "127.0.0.2",
								"hostName":"my-lin"
							},
							{
								"ipAddress": "127.0.0.3",
								"hostName":"my-uni"
							},
						]
						$scope.init();
					});
</script>

<body>
	<div ng-app="myApp" ng-controller="myCtrl">
		<div class="pre-loader">
			<div class="loading-img"></div>
		</div>

		<header id="header" class="nav-menu fixed-top"> </header>
		<div class="container">
			<div>
				<h1>Operations</h1>

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="panel-group" id="accordion1" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group">
										<ul class="checklist">
											<li ng-repeat = "machine in machines">
											<button type="button" ng-click="login()" style="width: 100%"
												class="btn btn-primary hvr-sweep-to-right">{{machine.ipAddress}} - {{machine.hostName}}</button>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
						<div class="panel-group" id="accordion1" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group">
										<button type="button" ng-click="login()" style="width: 100%"
												class="btn btn-primary hvr-sweep-to-right">Manage VM's</button>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				
					<div class="col-sm-8">
						<div id= "cpuChart">
						</div>
						<br>
						<div id= "memoryChart">
						</div>	
					</div>
				</div>
			</div>
		
		<footer id="footer"> </footer>
	</div>

		<script type="text/javascript"
			src="/HealthMonitor/vendor/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/jqueryui/jquery-ui-1.10.3.custom.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

		<script type="text/javascript"
			src="/HealthMonitor/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/owlcarousel/owl.carousel.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/vendor/retina.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/assets/js/min/responsivetable.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/assets/js/min/countnumbers.min.js"></script>
		<script type="text/javascript"
			src="/HealthMonitor/assets/js/min/main.min.js"></script>

		<!-- Current Page JS -->
		<script type="text/javascript"
			src="/HealthMonitor/assets/js/min/priceslider.min.js"></script>

	</div>

</body>
<script type="text/javascript">
try{
var cpuChart = c3.generate({
    bindto: '#cpuChart',
    data: {
      columns: [
        ['data1', 30, 200, 100, 400, 150, 250],
        ['data2', 50, 20, 10, 40, 15, 25]
      ]
    }
});
var memorychart = c3.generate({
    bindto: '#memoryChart',
    data: {
      columns: [
        ['data1', 30, 200, 100, 400, 150, 250],
        ['data2', 50, 20, 10, 40, 15, 25]
      ]
    }
});

}catch(e){
	alert(e);
}
</script>
</html>