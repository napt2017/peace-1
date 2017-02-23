<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" id="extr-page">

	<jsp:include page="../pages/common/header.jsp"/>
	
	<body class="animated fadeInDown">

		<header id="header">

			<div id="logo-group">
				<span id="logo"> <!--<img src="img/logo.png" alt="Peace">--> <h1 style="font-weight: bold;color: blue;">PEACE-EX</h1></span>
			</div>

			<!--<span id="extr-page-header-space"> <span class="hidden-mobile hiddex-xs">Need an account?</span> <a href="register.html" class="btn btn-danger">Create account</a> </span>-->

		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<!--<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">SmartAdmin</h1>
						<div class="hero">

							<div class="pull-left login-desc-box-l">
								<h4 class="paragraph-header">It's Okay to be Smart. Experience the simplicity of SmartAdmin, everywhere you go!</h4>
								<div class="login-app-icons">
									<a href="javascript:void(0);" class="btn btn-danger btn-sm">Frontend Template</a>
									<a href="javascript:void(0);" class="btn btn-danger btn-sm">Find out more</a>
								</div>
							</div>
							
							<img src="img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">

						</div>

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">About SmartAdmin - Are you up to date?</h5>
								<p>
									Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
								</p>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">Not just your average template!</h5>
								<p>
									Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
								</p>
							</div>
						</div>

					</div>!-->
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 hidden-xs hidden-sm"></div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="well no-padding">
							<spring:url value="/login" var="loginActionUrl" />
							<form:form action="${loginActionUrl} " modelAttribute="formLogin" class="smart-form client-form" method="post">
								<header>
									Sign In
								</header>

								<fieldset>
										<section>
											<label class="label">Username</label>
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<form:input type="text" path="username" value="${username}"></form:input>
												<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter email address/username</b>
											</label>
										</section>
										<section>
											<label class="label">Password</label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<form:input  type="password" path="password"></form:input>
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Enter your password</b> </label>
										</section>
										
									<c:if test="${not empty msg}">
									    <div class="alert alert-dismissible" role="alert">
										<button type="button" class="close" data-dismiss="alert"
							                                aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<strong>${msg}</strong>
									    </div>
									</c:if>
<!-- 									<section> -->
<!-- 										<label class="checkbox"> -->
<!-- 											<input type="checkbox" name="remember" checked=""> -->
<!-- 											<i></i>Stay signed in</label> -->
<!-- 									</section> -->
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">
										Sign in
									</button>
								</footer>
							</form:form>

						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 hidden-xs hidden-sm" ></div>
				</div>
			</div>

		</div>

		<!--================================================== -->	
		<jsp:include page="../pages/common/footer.jsp"/>
		<script type="text/javascript">
			runAllForms();

			$(function() {
				// Validation
				$("#login-form").validate({
					// Rules for form validation
					rules : {
						email : {
							required : true,
							email : true
						},
						password : {
							required : true,
							minlength : 3,
							maxlength : 20
						}
					},

					// Messages for form validation
					messages : {
						email : {
							required : 'Please enter your email address',
							email : 'Please enter a VALID email address'
						},
						password : {
							required : 'Please enter your password'
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});
			});
		</script>

	</body>
</html>