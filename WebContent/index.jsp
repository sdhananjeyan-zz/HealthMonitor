<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mold Discover</title>
<link rel="icon" type="image/png" href="assets/img/favicon.png" />

<link rel="stylesheet" href="assets/css/bootstrap.css" media="all">
<link rel="stylesheet" href="assets/css/jqueryui.css" media="all">
<link rel="stylesheet" href="vendor/animate-css/animate.css" media="all">
<link rel="stylesheet" href="assets/font/iconfont/iconstyle.css"
	media="all">
<link rel="stylesheet"
	href="assets/font/font-awesome/css/font-awesome.css" media="all">
<link rel="stylesheet" href="assets/css/main.css" media="all">
</head>

<body ng-app="myApp" ng-controller="myCtrl" class="login"
	style="background-image: url('http://placehold.it/1680x1050');">
	<div class="pre-loader">
		
	</div>

	<div class="main">
		<div class="form-box">
			<div class="form-head">
				<div class="mold-logo">
					
					<div class="logo"></div>
					<div class="logo-txt">Live Health Monitor</div>
				</div>
				<hr>
				<div class="txt">Please Login</div>
			</div>
			<div class="form-body">
				<form>
				<div style="color:red"><b>{{message}}</b></div><br>
				<div ng-hide="loginHide">
					<div class="form-group">
						<label>User Id</label>
						<div class="input-group">
							<div class="input-group-addon icon-mail"></div>
							<input type="text" required ng-model="mobile" class="form-control"
								placeholder="Mobile" />
						</div>
					</div>
					<div class="form-group">
						<label>Password</label>
						<div class="input-group">
							<div class="input-group-addon icon-lock"></div>
							<input type="password" required ng-model="password" class="form-control"
								placeholder="Password" />
						</div>
					</div>
					<div style="width: 100%">
						<button type="button" ng-click="login()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Log In</button>
					</div>
					<!-- <div style="width: 100%">
						<button type="button" ng-click="forgetPassword()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Forgot
							Password</button>
					</div> -->
				</div>
				<div ng-hide="forgetPasswordHide">
					<div class="form-group">
						<label>Mobile</label>
						<div class="input-group">
							<div class="input-group-addon icon-mail"></div>
							<input type="text" ng-model="forgetMobile" maxlength=10 class="form-control"
								placeholder="Mobile" />
						</div>
						<br>
						<div style="width: 100%">
						<button type="button" ng-click="submitMobile()" ng-hide="mobileSubmitHide" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Submit</button>
						</div>
					</div>
					<div ng-hide="otpHide">
					<div class="form-group">
						<label>OTP</label>
						<div class="input-group">
							<div class="input-group-addon icon-lock"></div>
							<input type="text" ng-model="otp" maxlength=10 class="form-control"
								placeholder="OTP" />
						</div>
						<br>
						<div style="width: 100%">
						<button type="button" ng-click="submitOTP()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Submit OTP</button>
						<button type="button" ng-click="resendOTP()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Re-send OTP</button>
						</div>
					</div>
					</div>
					<div style="width: 100%">
						<button type="button" ng-click="cancelForgot()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Cancel</button>
					</div>
					</div>
					<div ng-hide="changePasswordHide">
					<div class="form-group">
						<label>Password</label>
						<div class="input-group">
							<div class="input-group-addon icon-lock"></div>
							<input type="password" ng-model="newPassword" maxlength=10 class="form-control"
								placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<label>Re-enter Password</label>
						<div class="input-group">
							<div class="input-group-addon icon-lock"></div>
							<input type="password" ng-model="rePassword" class="form-control"
								placeholder="Password" />
						</div>
					</div>
					<div style="width: 100%">
						<button type="button" ng-click="changePassword()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Change Password</button>
					</div>
					<div style="width: 100%">
						<button type="button" ng-click="cancelForgot()" style="width: 100%"
							class="btn btn-primary hvr-sweep-to-right">Cancel</button>
					</div>
					</div>
					
				</div>
					
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="vendor/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="vendor/jqueryui/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript"
		src="vendor/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>

	<script type="text/javascript"
		src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="vendor/retina.min.js"></script>
	<script type="text/javascript" src="assets/js/min/main.min.js"></script>

	<!-- Current Page JS -->
	<script type="text/javascript" src="assets/js/min/login.min.js"></script>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script>
						var app = angular.module('myApp', []);
						app.controller('myCtrl', function($scope, $http,$window) {
						$scope.mobile;
						$scope.password;
						$scope.message="";
						$scope.loginHide = false;
						$scope.forgetPasswordHide = true;
						$scope.otpHide = true;
						$scope.mobileSubmitHide = true;
						$scope.changePasswordHide = true;
						$scope.forgetMobile;
						$scope.otp;
						$scope.newPassword;
						$scope.rePassword;
						$scope.login = function() {
							$scope.message="";
							if(!$scope.validatePassword($scope.password)){
								$scope.message="Please enter the Password";
								return;
							}
							$scope.message="";
							$http({
								method : 'POST',
								url : '/HealthMonitor/login/login.action',
								data : {
									'userId' : $scope.mobile,
									'password' : $scope.password
								},
								headers : {
									'Content-Type' : 'application/json'
								}
							})
									.then(
											function(response) {
												if (response.data.result == 'success') {
													$window.location = '/HealthMonitor/initiate.action'
												} else if (response.data.result == 'failure') {
													$scope.message = "Something went wrong, please try again later!";
												} else if (response.data.result == 'invalid password') {
													$scope.message = "Login Failed!";
												}else if(response.data.result == 'no user'){
													$scope.message = "No registration found with the given mobile number"
												}
												else if(response.data.result == 'unverified'){
													$scope.loginHide=true;
													$scope.forgetPasswordHide = false;
													$scope.mobileSubmitHide= true;
													$scope.otpHide = false;
													$scope.forgetMobile = $scope.mobile;
													$scope.message = "Mobile verification is pending for the registration, please enter the OTP sent to your registered mobile";
												}
												else if(response.data.result == 'pending otp for password change'){
													$scope.loginHide=true;
													$scope.forgetPasswordHide = false;
													$scope.mobileSubmitHide= true;
													$scope.otpHide = false;
													$scope.forgetMobile = $scope.mobile;
													$scope.message = "your password change request is pending, please enter the otp sent to your mobile"
												}else if(response.data.result == 'password change pending'){
													$scope.cancelForgot();
													$scope.loginHide = true;
													$scope.changePasswordHide = false;
													$scope.message = "your password change request is pending, please enter new Password"
												}
											});
						}
	
						$scope.back = function() {
							$window.location = '/travels_ui/initiate.action'
						}
						$scope.forgetPassword = function() {
							$scope.message="";
							$scope.loginHide=true;
							$scope.forgetPasswordHide = false;
							$scope.mobileSubmitHide=false;
						}
						$scope.cancelForgot = function(){
							$scope.message="";
							$scope.changePasswordHide=true;
							$scope.forgetPasswordHide = true;
							$scope.mobileSubmitHide=true;
							$scope.forgetPasswordHide = true;
							$scope.mobileSubmitHide= true;
							$scope.otpHide = true;
							$scope.loginHide=false;
						}
						
						$scope.submitMobile = function(){
							$scope.message="";
							if(!$scope.validateMobile($scope.forgetMobile)){
								$scope.message="Invalid Mobile";
								return;
							}
							$scope.message="";
							$http({
								method : 'POST',
								url : '/travels_ui/login/forget_password.action',
								data : {
									'mobile' : $scope.forgetMobile,
								},
								headers : {
									'Content-Type' : 'application/json'
								}
							})
									.then(
											function(response) {
												if (response.data.result == 'success') {
													$scope.mobileSubmitHide= true;
													$scope.otpHide = false;
													$scope.message = "Please enter the OTP sent to your registered mobile";
												} else if (response.data.result == 'failure') {
													$scope.message = "Something went wrong, please try again later!";
												}else if(response.data.result == 'no user'){
													$scope.message = "There is no account registered with the given mobile no.";
												}else if(response.data.result == 'OTP Failed'){
													$scope.message = "Could not send OTP for Authenticating, please try again later";
												}
											});
							
						};
						
						$scope.submitOTP = function(){
							$scope.message="";
							if(!$scope.validateMobile($scope.forgetMobile)){
								$scope.message="Invalid Mobile Number";
								return;
							}
							if($scope.otp==null||$scope.otp==undefined||$scope.otp.length==0){
								$scope.message="Please enter the OTP";
								return;
							}
							$scope.message="";
							$http({
								method : 'POST',
								url : '/travels_ui/login/verify_otp_password_change.action',
								data : {
									'mobile' : $scope.forgetMobile,
									'otp': $scope.otp
								},
								headers : {
									'Content-Type' : 'application/json'
								}
							})
									.then(
											function(response) {
												if (response.data.result == 'success') {
													$scope.cancelForgot();
													$scope.loginHide = true;
													$scope.changePasswordHide = false;
													$scope.message = "Please set your new password";
												}else if (response.data.result == 'failure') {
													$scope.message = "Something went wrong, please try again later!";
												}else if(response.data.result == 'no user'){
													$scope.message = "There is no account registered with the given mobile no.";
												}else if (response.data.result == 'no match') {
													$scope.message = "OTP does not match, please try again";
												}
											});
							
						}
						
						$scope.changePassword = function(){
							$scope.message="";
							if($scope.newPassword==null || $scope.newPassword==undefined || $scope.newPassword.length<6){
								$scope.message="Password must have atleast 6 characters";
								return;
							}
							if($scope.newPassword != $scope.rePassword){
								$scope.message="Password doesn not match, please try again";
								return;
							}
							$scope.message="";
							$http({
								method : 'POST',
								url : '/HealthMonitor/login/change_password.action',
								data : {
									'mobile' : $scope.forgetMobile,
									'password': $scope.newPassword,
									'rePassword': $scope.rePassword
								},
								headers : {
									'Content-Type' : 'application/json'
								}
							})
									.then(
											function(response) {
												if (response.data.result == 'success') {
													$scope.changePasswordHide = true;
													$scope.loginHide = false;
													$scope.password='';
													$scope.message= "Password Changed Successfully, Login with your new Credentials";
												}else if (response.data.result == 'failure') {
													$scope.message = "Something went wrong, please try again later!";
												}else if(response.data.result == 'no user'){
													$scope.message = "There is no account registered with the given mobile no.";
												}else if (response.data.result == 'no match') {
													$scope.message = "Password does not match, please try again";
												}
											});
						}
						$scope.resendOTP= function(){
							$scope.message="";
							if(!$scope.validateMobile($scope.forgetMobile)){
								$scope.message="Invalid Mobile Number";
								return;
							}
							$scope.message="";
							$http({
								method : 'POST',
								url : '/travels_ui/login/resend_otp.action',
								data : {
									'mobile' : $scope.forgetMobile,
								},
								headers : {
									'Content-Type' : 'application/json'
								}
							})
									.then(
											function(response) {
												if (response.data.result == 'success') {
													$scope.otp = "";
													$scope.message= "new OTP sent successfully";
												}else if (response.data.result == 'failure') {
													$scope.message = "Something went wrong, please try again later!";
												}else if(response.data.result == 'no user'){
													$scope.message = "There is no account registered with the given mobile no.";
												}else if(response.data.result == 'OTP Failed'){
													$scope.message = "Could not send OTP, please try again later";
												}
											});
						}
						$scope.validateMobile = function(mobile){
							if(mobile==null || mobile==undefined || mobile.length!=10)
								return false;
							return true;
						}
						$scope.validatePassword = function(password){
							if(password==null || password==undefined || password.length<1)
								return false;
							return true;
						}
					});
						
</script>
</html>