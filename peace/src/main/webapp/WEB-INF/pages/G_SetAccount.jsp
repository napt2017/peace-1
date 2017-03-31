<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" ng-app="acount-setting-app">
<jsp:include page="../pages/common/header.jsp" />
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<body class="fixed-page-footer">
	<style>
input, textarea, button {
	margin-top: 10px
}

/* Required field START */
.required-field-block {
	position: relative;
}

.required-field-block .required-icon {
	display: inline-block;
	vertical-align: middle;
	margin: -0.25em 0.25em 0em;
	background-color: #E8E8E8;
	border-color: #E8E8E8;
	padding: 0.5em 0.8em;
	color: rgba(0, 0, 0, 0.65);
	text-transform: uppercase;
	font-weight: normal;
	border-radius: 0.325em;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: background 0.1s linear;
	-moz-transition: background 0.1s linear;
	transition: background 0.1s linear;
	font-size: 75%;
}

.required-field-block .required-icon {
	background-color: transparent;
	position: absolute;
	top: 0em;
	right: 0em;
	z-index: 10;
	margin: 0em;
	width: 30px;
	height: 30px;
	padding: 0em;
	text-align: center;
	-webkit-transition: color 0.2s ease;
	-moz-transition: color 0.2s ease;
	transition: color 0.2s ease;
}

.required-field-block .required-icon:after {
	position: absolute;
	content: "";
	right: 1px;
	top: 1px;
	z-index: -1;
	width: 0em;
	height: 0em;
	border-top: 0em solid transparent;
	border-right: 30px solid transparent;
	border-bottom: 30px solid transparent;
	border-left: 0em solid transparent;
	border-right-color: inherit;
	-webkit-transition: border-color 0.2s ease;
	-moz-transition: border-color 0.2s ease;
	transition: border-color 0.2s ease;
}

.required-field-block .required-icon .text {
	color: #B80000;
	font-size: 26px;
	margin: -3px 0 0 12px;
}
/* Required field END */
</style>
	<jsp:include page="../pages/common/menu-top.jsp" />
	<jsp:include page="../pages/common/menu-left.jsp" />

	<!-- MAIN PANEL -->
	<div id="main" role="main">

		<!-- RIBBON -->
		<div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
				class="btn btn-ribbon" data-action="resetWidgets"
				data-title="refresh" rel="tooltip" data-placement="bottom"
				data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
				data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li>
				<li>My Account</li>
			</ol>

		</div>
		<!-- END RIBBON -->
	
		<!-- MAIN CONTENT -->
		<form class="col-lg-8" ng-controller="accountSettingController">
		<div id="content">
			<div class="row">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3"
					data-widget-editbutton="false">
					<header> 
						<h2><span class="widget-icon"> <i class="fa fa-table"></i></span>  Infomation</h2>
					</header>
					<div>
						<div class="jarviswidget-editbox"></div>
						<div class="widget-body ">
							<div class="row smart-form">
									<fieldset ng-model="accountSettingModel">
										<section class="row "> <label
											class="label col col-6">パスワード変更前</label> <label
											class="col col-6"> 
											<input type="password" style="width: 100%" id="old-pass">
										</label> </section>
										<section class="row "> <label
											class="label col col-6">パスワード変更後（半角英数字6文字以上12文字以下）</label> <label
											class="col col-6"> 
											<input type="password"
											style="width: 100%" id="new-pass">
										</label> </section>
										<section class="row "> <label
											class="label col col-6">パスワード変更後（確認用）</label> <label
											class="col col-6"> <input type="password"
											style="width: 100%" id="re-new-pass">
										</label> </section>
										<section class="row "> <label
											class="label col col-6">Inventory check result mail distribution setting
										</label>
										<div class="col col-6">
											<label class=""> <input type="radio"
												name="radio-inline" ng-value="true"
												ng-model="accountSettingModel.isDeliver"> <i></i>配信する
											</label> <label class=""> <input type="radio"
												name="radio-inline" ng-value="false"
												ng-model="accountSettingModel.isDeliver"> <i></i>配信しない<label>
										</div>
										</section>
										<section class="row "> <label
											class="label col col-6">メールアドレス（255文字以内）</label> <label
											class="col col-6"> <input type="text"
											style="width: 100%" id="email"
											ng-model="accountSettingModel.email"
											value="accountSettingModel.email">
										</label> </section>
									</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3"
					data-widget-editbutton="false">
					<header> 
						<h2><span class="widget-icon"> <i class="fa fa-table"></i></span>   Setting Amazon</h2>
					</header>
					<div>
						<div class="jarviswidget-editbox"></div>
						<div class="widget-body ">
							<div class="row smart-form">
									<fieldset>
										<section class="row "> <label
											class="label col col-6">Access Key</label> <label
											class="col col-6"> <input type="text" style="width: 100%"
											ng-model="accountSettingModel.amazonAccessKey"
											value="accountSettingModel.amazonAccessKey" id="access-key">
										</label> </section>
										<section class="row "> <label
											class="label col col-6">Secret Key</label> <label
											class="col col-6"> <input type="text" style="width: 100%"
											ng-model="accountSettingModel.amazonSecretKey"
											value="accountSettingModel.amazonSecretKey" id="secret-key">
										</label> </section>
										<section class="row "> <label
											class="label col col-6">Id</label> <label class="col col-6">
											<input type="text" style="width: 100%"
											ng-model="accountSettingModel.amazoneId"
											value="accountSettingModel.amazoneId" id="amazon-id">
										</label> </section>
									</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3"
					data-widget-editbutton="false">
					<header> 
						<h2><span class="widget-icon"> <i class="fa fa-table"></i></span>   Paypal Setting</h2>
					</header>
					<div>
						<div class="jarviswidget-editbox"></div>
						<div class="widget-body ">
							<div class="row smart-form">
									<fieldset>
										<section class="row "> <label
											class="label col col-6">PayPal Email</label> 
											<label class="col col-6"> 
												<input type="text" style="width: 100%" ng-model="accountSettingModel.paypalEmail"
												value="accountSettingModel.paypalEmail" id="paypal-email">
											</label> 
										</section>
										<section class="row "> 
											<label class="label col col-6">Immediate settlement</label> 
											<label class="col col-6" style="    display: inline-flex;"> 
												<input type="checkbox" ng-true-value="true" ng-false-value="false"
												ng-model="accountSettingModel.isImmediateStettlement"
												ng-checked="accountSettingModel.isImmediateStettlement"
												name="checkbox" checked="checked" style="margin-right: 10px;"> <i></i>
												<p>   Require immediate payment when buyer uses Buy It Now /
													Buy It Now Buyer needs to pay immediately</p>
											</label> 
										</section>
									</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<button type="submit" ng-click="saveAccountSetting($event)"
			class="btn btn-primary">Save
			</button>
		</footer>
		</form>
		<!-- END MAIN CONTENT -->

	</div>
	<jsp:include page="../pages/common/footer.jsp" />
	<!--================================================== -->
	<jsp:include page="../pages/common/footer2.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			//$('#colorpicker').farbtastic('#color');
			//$('#colorpickerstr').farbtastic('#colorstr');
		});
		$(function() {
			$('.required-icon').tooltip({
				placement : 'left',
				title : 'Required field'
			});
		});
		// DO NOT REMOVE : GLOBAL FUNCTIONS!

		$(document).ready(function() {

			pageSetUp();

		})
	</script>

	<!-- Your GOOGLE ANALYTICS CODE Below -->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-XXXXXXXX-X' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

	<!-- LOAD ANGULAR JS MODULE -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/angularjs/angular.js"/>"></script>

	<!-- HANDING BUSSINESS LOGIC FOR ACCOUNT SETTING -->
	<script type="text/javascript">
		var accountSettingApp = angular.module("acount-setting-app", []);
		accountSettingApp
				.controller(
						"accountSettingController",
						function($scope, $http) {
							var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr(
									"content");
							var config = {
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json',
									'X-CSRF-TOKEN' : token
								}
							};

							$scope.headers = config;
							$scope.saveAccountSetting = function($event) {
								$event.preventDefault();
								if ($("#old-pass").val() === "") {
									alert("Empty old pass");
									return;
								}

								if ($("#new-pass").val() === "") {
									alert("Empty new pass");
									return;
								}

								if ($("#re-new-pass").val() === "") {
									alert("Empty retype new pass");
									return;
								}

								if ($("#re-new-pass").val() !== $("#new-pass")
										.val()) {
									alert("New pass not same with retype new pass");
									return;
								}

								//Validate old password
								$scope
										.checkCorrectOldPassword(
												$("#old-pass").val(),
												function() {
													//Password correct
													$scope
															.validateRestOfForm(function() {
																//Validate all success
																$scope
																		.updateOldUserInfo(function() {
																			//Update user info success
																			var dataPost = $scope.accountSettingModel;
																			$http
																					.post(
																							"SaveAccountSetting",
																							JSON
																									.stringify(dataPost),
																							$scope.headers)
																					.success(
																							function(
																									data,
																									status,
																									headers,
																									config) {
																								console
																										.log(data)
																							})
																					.error(
																							function(
																									data,
																									status,
																									headers,
																									config) {
																								console
																										.log(data);
																							});
																		})
															})

												},
												function() {
													alert("Old password incorrect");
												})
							};

							//Must implement it
							$scope.updateOldUserInfo = function(
									update_sucess_callback) {
								var dataPost = {
									id : 0,
									username : "",
									password : $("#new-pass").val(),
									email : $("#email").val(),
									fullname : "",
									date : new Date()
								};

								$http
										.post("ChangeUserPasswordEmail",
												JSON.stringify(dataPost),
												$scope.headers)
										.success(
												function(data, status, headers,
														config) {
													if (data.status === "OK") {
														update_sucess_callback();
													} else {
														alert("Update password failed!")
													}
												}).error(
												function(data, status, headers,
														config) {
													console.log(data);
												});
							}

							$scope.validateRestOfForm = function(
									success_callback) {
								if ($("#email").val() === "") {
									alert("Empty email");
									return;
								} else {
									if (!$
											.trim($("#email").val())
											.match(
													/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/)) {
										alert("Email not correct!")
										return;
									}
								}

								if ($("#access-key").val() === "") {
									alert("Empty access key");
									return;
								}

								if ($("#secret-key").val() === "") {
									alert("Empty secret key");
									return;
								}

								if ($("#amazon-id").val() === "") {
									alert("Empty amazon id");
									return;
								}

								if ($("#paypal-email").val() === "") {
									alert("Empty paypal email");
									return;
								} else {
									if (!$
											.trim($("#paypal-email").val())
											.match(
													/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/)) {
										alert("Paypal email not correct!")
										return;
									}
								}
								success_callback();
							};

							$scope.loadAccountSettingOfUser = function() {
								$http
										.get("GetAccountSetting")
										.success(
												function(data, status, headers,
														config) {
													if (data.recordId != -1) {
														$scope.accountSettingModel = data.extraData;
													}
												}).error(
												function(data, status, headers,
														config) {
													console.log(data);
												});
							}

							$scope.checkCorrectOldPassword = function(
									oldPassword, success_callback,
									failed_callback) {
								$http.get(
										"CheckPassword/"
												+ encodeURI(oldPassword))
										.success(
												function(data, status, headers,
														config) {
													if (data.extraData) {
														success_callback();
													} else {
														failed_callback();
													}
												}).error(
												function(data, status, headers,
														config) {
													console.log(data);
												});
							}

							//Default load
							$scope.loadAccountSettingOfUser();
						});
	</script>

</body>

</html>