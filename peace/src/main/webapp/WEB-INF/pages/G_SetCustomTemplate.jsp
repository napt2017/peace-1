<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" ng-app="template_upload_app">
	 <jsp:include page="../pages/common/header.jsp"/> 
	 <meta name="_csrf" content="${_csrf.token}"/>
 	 <meta name="_csrf_header" content="${_csrf.headerName}"/>
	<body class="fixed-page-footer">
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
		<jsp:include page="../pages/common/menu-top.jsp"/>
		<jsp:include page="../pages/common/menu-left.jsp"/>

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
					<li>Home</li><li>Dashboard</li><li>Custom Tempalte</li>
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
					<div class="row" ng-controller="templateUploadController">
						<div class="widget-body ">
							<header>
								<h2>Custom Template</h2>
							</header>
							<form class="smart-form">
							<input type="hidden" value="-1" id="user_template_id" />
								<fieldset>
									<section>
										<div class="note">
											<a href="#" ng-click="downloadSampleTemplate($event)">
												<i class="fa fa-hand-o-right" aria-hidden="true"></i>
												<span>Download sample template</span>
											</a>
										</div>
									</section>
									
									<!-- The name of template -->
									<div class="row"> 
										<section class="col col-6">
											<div class="input input-file">
												<input type="text" size="width=100%" placeholder="Enter the name of template" id="template_name"/>
											</div>
										</section>
									</div>
									
									<!-- The ckeditor -->
									<div class="row"> 
										<section class="col col-6">
											<textarea id="userHtmlTemplateCode"></textarea>
										</section>
									</div>
									
									<!-- The input for user upload file -->
									<div class="row">  
										<section class="col col-6">
											<div class="input input-file">
												<span class="button">
													<input id="templateUploadFile" type="file" ng-model="uploadFileModel" name="file2" onchange="angular.element(this).scope().handingEventSelectFileUpload()">Browse
												</span>
												<input type="text" placeholder="Upload image for template">
											</div>
										</section>
									</div>
									
									<!-- Preview image file -->
									<div class="row">  
										<section class="col col-6">
											<img src="" id="preview_image"/>
										</section>
									</div>
									
									<!-- Submit button -->
									<section> 
											  <div class="btn-group">
						                        <button type="button" ng-click="ajaxUploadTemplate()" class="btn btn-primary btn-sm">Save</button> 
						                        <button type="button" class="btn btn-default btn-sm" ng-click="clearUserTemplateForm()">Clear</button>
						                     </div>
									</section>
									
									<!-- <section>
										<label class="checkbox ">
											<input type="checkbox" name="checkbox" checked="checked" >
											<i></i> Enable custom templates </label>
									</section>  -->
									<div class="row" style="background-color:white; padding-right: 40px; display: none">
										<table class="table table-bordered table-striped responsive-utilities" style="margin-left:15px; width:50%;">
											<thead>
											  <tr>
												<th>
												  Name
												</th>
												<th style="width:20px;">
												  Choice
												</th>
												<th>
												  Confirmation
												</th>
												<th>
												  Delete
												</th>
											  </tr>
											</thead>
											<tbody>
											  <tr>
												<td class="">Template</td>
												<td class="is-visible">
													<section>
													<div class="inline-group">
													<label class="">
														<input type="radio" name="radio-inline" >
														<i></i></label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<a href="#">Confirmation</a>
												</td>
												<td class="is-hidden"><a href="#">Delete</a></td>
											  </tr>
											</tbody>
											
										</table>
									</div>
								</fieldset>
								<fieldset>
									<div class="row">
										<section class="col col-12">
											<label class="label">Selection of an exhibition template</label>
											<div class="inline-group" style="padding-top: 30px" ng-repeat="subUserTemplate in listOfUserTemplate"  napt-repeat-directive>
												<section class="col col-2 col-sm-2" style="" ng-repeat="userTempalate in subUserTemplate">
													<label class="radio">
														<input type="radio" class="selected_template" name="radio-inline" value="{{userTempalate.templateId}}">
														<i></i>{{userTempalate.title}} </label>
													<img src="{{userTempalate.base64StringImage}}" height="300" width="200"/>
													<input type="hidden" value="{{userTempalate.htmlCode}} "/>
												</section> 
											</div>
										</section>
									</div>
									<!--  
									<div class="row">
										<div id="colorpickerstr">
											<div class="farbtastic">
												<div class="color" style="background-color: rgb(255, 0, 0);"></div>
												<div class="wheel"></div>
												<div class="overlay"></div>
												<div class="h-marker marker" style="left: 97px; top: 13px;"></div>
												<div class="sl-marker marker" style="left: 74px; top: 126px;"></div>
											</div>
										</div>
										<input type="text" id="colorstr" name="colorstr" value="#FFFFFF" style="">
										<div id="colorpickerstr">
											<div class="farbtastic">
												<div class="color" style="background-color: rgb(255, 0, 0);"></div>
												<div class="wheel"></div>
												<div class="overlay"></div>
												<div class="h-marker marker" style="left: 97px; top: 13px;"></div>
												<div class="sl-marker marker" style="left: 74px; top: 126px;"></div>
											</div>
										</div>
										<input type="text" id="colorstr" name="colorstr" value="#FFFFFF" style="">
									</div>
									-->
								</fieldset> 
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
		/* $(document).ready(function() {
			$('#colorpicker').farbtastic('#color');
			$('#colorpickerstr').farbtastic('#colorstr');
		}); */
		
		$(function() {
			$('.required-icon').tooltip({
				placement: 'left',
				title: 'Required field'
				});
		});
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			pageSetUp();
		
		})

		</script>
		
		<!-- EMBED CKEDITOR(napt2017) -->
		<script src="${pageContext.request.contextPath}/resources/js/plugin/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(function(){  
				CKEDITOR.replace("userHtmlTemplateCode"); 
			});
		</script>
		
		<!-- HANDING BUSSINESS LOGIC FOR UPLOAD FORM VIA ANGULARJS (napt2017) -->
		<script type="text/javascript"src="<c:url value="/resources/js/angularjs/angular.min.js"/>"></script> 
		<script type="text/javascript"> 
			//Get app
			var templateUploadApp = angular.module("template_upload_app", []);
			
			//Custom directive to handing end of event repeat
			templateUploadApp.directive('naptRepeatDirective', function($timeout) {
				 return {
				        restrict: 'A',
				        link: function (scope, element, attr) {
				            if (scope.$last === true) {
				                $timeout(function () {
				                	scope.registerEventForRadioButton();
				                });
				            }
				        }
				    }
			 });
			
			//Config the controller
			templateUploadApp.controller("templateUploadController",function($scope,$http){
				
				$scope.handingEventSelectFileUpload = function($this){
					var selectedFile = templateUploadFile.files[0];
					var fileType = selectedFile.type;
					if(fileType==="image/jpeg"||fileType==="image/png"){
						$("#templateUploadFile").parent().next().val(selectedFile.name);
						
						$scope.readLocalImage(selectedFile,function(imageData){
							$("#preview_image").css({
							    width: "200px",
							    height: "300px",
							    border: "1px solid #827d7d",
							    "border-radius": "3px"
							});
							
							$("#preview_image").attr("src",imageData)
						});
					}else{
						alert("Invailed file type!");
					}
				};
				
				$scope.clearUserTemplateForm = function(){
					$("#template_name").val("");
					$scope.getCkEditor().innerHTML ="";
					$("#preview_image").attr("src",""); 
					$("#preview_image").attr("style",""); 
					$("#user_template_id").val("-1")
					if($("input[name='radio-inline']:checked")){
						$("input[name='radio-inline']:checked").prop("checked",false)
					}
					$("#templateUploadFile").parent().next().val("");
				}
				
				//Get ckEditor content follow dom hierachy
				$scope.getCkEditor = function(){
					return $("#cke_userHtmlTemplateCode ").find(".cke_inner .cke_reset")
														  .find("iframe")
														  .contents()[0]
														  .documentElement
														  .getElementsByTagName("body")[0];
				}
				
				//Send ajax to server to upload template
				$scope.ajaxUploadTemplate = function(evt){
					if($("#template_name").val()===""){
						alert("Empty template name");
						return;						
					}
					
					var ckEditorFrameContent= $scope.getCkEditor();
					if($.trim(ckEditorFrameContent.innerText) ===""){
						alert("Empty html content for template!!!")
						return;
					}					
					
					if($("#preview_image").attr("src")===""){
						alert("Empty image for template");
						return;						
					} 
					
					//Prepare the upload form data
					var uploadData = {
							title:$("#template_name").val(),
							htmlCode:encodeURI(ckEditorFrameContent.innerHTML),
							base64StringImage:$("#preview_image").attr("src"),
							templateId:$("#user_template_id").val()
					}; 
					
					var token = $("meta[name='_csrf']").attr("content");
				    var header = $("meta[name='_csrf_header']").attr("content"); 
					var config = {
							headers:{ 
									'Accept':'application/json',
									'Content-Type': 'application/json' ,
									'X-CSRF-TOKEN':token
							}  
					} 
					
					$http.post("CustomTemplateUpload",JSON.stringify(uploadData),config)
						 .success(function(data, status, headers,config) {
							 if(data.status==="OK"){
								 $scope.reloadUserTemplate();
							 }else{
								alert(data.cause); 
							 }							 
						 })
						 .error(function(data, status, headers,config){
								console.log("Error");
						 }) 
				};
				
				//Reload user template
				$scope.reloadUserTemplate = function(){
					$http.get("LoadUserTemplate")
					 .success(function(data, status, headers,config) {
						 $scope.listOfUserTemplate = data;
					 })
					 .error(function(data, status, headers,config){
							console.log("Error");
					 }) 
				};
				
				//Download sampe template for user
				$scope.downloadSampleTemplate = function($event){
					$event.preventDefault();
					alert("Download sample template")
				} 
				
				//Bind selected template to layout
				$scope.bindTemplateToLayout = function($this,$event){
					var title = $this.next().prop('nextSibling').textContent;
					var imageString = $this.parent().next().attr("src");
					var htmlCode = decodeURI($this.parent().next().next().val());
					var ckEditorFrameContent= $scope.getCkEditor();
					var templateId = $this.val();
					
					$("#user_template_id").val(templateId);
					
					if($("#template_name").val()!=="" ||
					   $.trim(ckEditorFrameContent.innerText) !=="" ||
					   $("#preview_image").attr("src")!==""){  
						var answer = confirm("Seem you are some new template content to add or edit! \n Are you want to edit the exist template ? ");
						if(answer){
							$scope.bindingValue(title,htmlCode,imageString,ckEditorFrameContent);
							$scope.currentSelectedTemplate = $this;
						}else{
							$this.prop('checked', false);
							if(typeof($scope.currentSelectedTemplate)!=="undefined"){
								$scope.currentSelectedTemplate.prop('checked', true)
							} 
						}
					}else{
						$scope.bindingValue(title,htmlCode,imageString,ckEditorFrameContent);
						$scope.currentSelectedTemplate = $this;
					}
				};
				
				//Binding value
				$scope.bindingValue = function(title,htmlCode,imageString,ckEditorFrameContent){
					$("#template_name").val(title);
					ckEditorFrameContent.innerHTML = htmlCode;
					$("#preview_image").css({
					    width: "200px",
					    height: "300px",
					    border: "1px solid #827d7d",
					    "border-radius": "3px"
					});
					$("#preview_image").attr("src",imageString); 
				}
				
				//Read local image file as base64 string
				$scope.readLocalImage = function($imgeFile,callback){
					var reader = new FileReader();
				    reader.onload = function(e) {
				    	callback(e.target.result);
				    }
				    reader.readAsDataURL($imgeFile);
				}
				
				//Register checked event for all radiobutton onlayout
				$scope.registerEventForRadioButton = function(){
					$(".selected_template").on("change",function(evt){
						var currentSelectedTemplate = ($('input[name=radio-inline]:checked'));
						$scope.bindTemplateToLayout($(this),evt);
					});
				};
				
				//Default load template of current user 
				$scope.reloadUserTemplate();
			});
			
		</script>  

		<!-- Your GOOGLE ANALYTICS CODE Below -->
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

		</script>

	</body>

</html>