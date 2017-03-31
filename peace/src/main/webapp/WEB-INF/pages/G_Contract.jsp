<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en-us"> 
	<jsp:include page="../pages/common/header.jsp"/>
	<meta name="_csrf" content="${_csrf.token}"/>
 	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<body class="fixed-page-footer">  
		<jsp:include page="../pages/common/menu-top.jsp"/>
		<jsp:include page="../pages/common/menu-left.jsp"/>
	    <style>
			input, textarea, button { margin-top:10px }

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
		<!-- MAIN PANEL -->
		<div id="main" role="main"> 
			<!-- RIBBON -->
			<div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<li>Home</li><li>Dashboard</li>
				</ol>
				<!-- end breadcrumb -->

				<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

			</div>
			<!-- END RIBBON -->

			<!-- MAIN CONTENT -->
			<div id="content">
				<!-- widget grid -->
				
				<section id="widget-grid" class="">

					<!-- widget div-->
					<div class="row">
						<div class="widget-body ">
							<form class="smart-form col-lg-6">
								<fieldset>
									<h3>PEACE問い合わせフォーム</h3>
									<section class="row ">
										<label class="label col col-4">
お名前</label>
										<label class="col col-6">									
											<input type="text" id="contact_name" class="col col-6">
										</label>
									</section>
									<section class="row ">
										<label class="label col col-4">メールアドレス</label>
										<label class="col col-6">									
											<input type="text" id="contact_email" class="col col-6">
										</label>
									</section>
									<section class="row ">
										<label class="label col col-4">Tel</label>
										<label class="col col-6">									
											<input type="text" id="contact_tel" class="col col-6">
										</label>
									</section>
									<section class="row ">
										<label class="label col col-4">出品時のエラーの場合、出品カテゴリー、商品URL、発送方法、送料設定、4点を必ず合わせてご記載ください。
										</label>
										<label class="textarea col col-6"> 									
											<textarea rows="5" name="comment" id="contact_list_url" placeholder=""></textarea> 
										</label>
									</section>
									<section class="row ">
										<label class="label col col-4">お問い合わせ内容をできるだけ、詳しくご記載ください。（48時間以内に上記ご記載頂いているメールアドレスにご返事させて頂きます）
										</label>
										<label class="textarea col col-6"> 									
											<textarea rows="5" name="comment" id="contact_describle" placeholder=""></textarea> 
										</label>
									</section>
								</fieldset>
								
								<footer>
									<button type="submit" id="save_contact" class="btn btn-primary">
										確定
									</button>
								</footer>
							</form>
						</div>
					</div>
					<!-- end widget div --> 

				</section>
				<!-- end widget grid -->
				
			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<jsp:include page="../pages/common/footer.jsp"/>
		<!--================================================== -->	
		<jsp:include page="../pages/common/footer2.jsp"/>
		<script type="text/javascript">

		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			pageSetUp();
		
		})

		</script>
		
		<!-- HANDING BUSSINESS LOGIC FOR CONTACT FORM (napt2017) --> 
		<script type="text/javascript">
			$(function(){
				$("#save_contact").on("click",function(e){
					e.preventDefault();
					
					//Validate user input data
					if($("#contact_name").val()===""){
						alert("Empty");
						return;
					}
					if($("#contact_email").val()===""){
						alert("Empty");
						return;
					}
					if($("#contact_tel").val()===""){
						alert("Empty");
						return;
					}
					if($("#contact_list_url").val()===""){
						alert("Empty");
						return;
					}
					if($("#contact_describle").val()===""){
						alert("Empty");
						return;
					} 
					
					var postData = {
	                    	id:0,
	                    	email:$("#contact_email").val(),
	                    	name:encodeURIComponent($("#contact_name").val()),
	                    	phone:encodeURIComponent($("#contact_tel").val()),
	                    	createdDate:new Date(),
	                    	exhibitionCategory:encodeURIComponent($("#contact_list_url").val()),
	                    	describeContent:encodeURIComponent($("#contact_describle").val()),
	                    };
					
					var token = $("meta[name='_csrf']").attr("content");
				    var header = $("meta[name='_csrf_header']").attr("content"); 					
					
					//Process main bussiness logic
					$.ajax({
	                    type: "POST",
	                    headers: {
	                        'Accept':'application/json',
	                        'Content-Type': 'application/json'
	                    },
	                    beforeSend:function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    url: "Contact",
	                    data:JSON.stringify(postData),
	                    contentType: "application/json",
	                    mimeType: 'application/json',
	                    dataType: "json",
	                    success: function(respData){
	                        alert(respData);
	                    },
	                    error:function(evt){
	                    	console.log(evt);
	                    }
	                });  
	                
				 });
			});
		</script>

		<!-- Your GOOGLE ANALYTICS CODE Below 
		<script type="text/javascript">
			var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
				_gaq.push(['_trackPageview']);
			
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

		</script>-->

	</body>

</html>