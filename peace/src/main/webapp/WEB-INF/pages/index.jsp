<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<span id="logo"> <!--<img src="img/logo.png" alt="Peace">--> <h1 style="font-weight: bold;color: blue;"><spring:message code="logo.title"></spring:message></h1></span>
			</div>

			<!--<span id="extr-page-header-space"> <span class="hidden-mobile hiddex-xs">Need an account?</span> <a href="register.html" class="btn btn-danger">Create account</a> </span>-->

		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 hidden-xs hidden-sm"></div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="well no-padding">
							<spring:url value="/login" var="loginActionUrl" />
							<form:form action="${loginActionUrl} " modelAttribute="formLogin" class="smart-form client-form" method="post">
								<header>
									現在のサインイン
								</header>

								<fieldset>
										<section>
											<label class="label"><spring:message code="login.username.label"></spring:message> </label>
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<form:input type="text" path="username" value="${username}"></form:input>
												<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter email address/username</b>
											</label>
										</section>
										<section>
											<label class="label">パスワード</label>
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
									<c:if test="${param.error != null}">
		                                <div class="alert alert-danger">
		                                    <p>Invalid username and password.</p>
		                                </div>
		                            </c:if>
		                            <c:if test="${param.logout != null}">
		                                <div class="alert alert-success">
		                                    <p>You have been logged out successfully.</p>
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
										ログイン
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
		<jsp:include page="../pages/common/footer2.jsp"/>
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