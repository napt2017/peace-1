<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us" ng-app="shipping_setting_app">
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

				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i> Dashboard <span>> EBay Setting</span> <span>> Shipping</span></h1>
					</div>
					<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
						
					</div>
				</div>
				<!-- widget grid -->
				
				<section id="widget-grid" class="">

					<!-- widget div-->
					<div class="row" ng-controller="shippingSettingController">
						<div class="widget-body ">
							<form class="smart-form col-lg-12">
								<fieldset>
									<h2 style="font-weight: bold; margin-bottom:10px">Shipping Free</h2>
									<div class="inline-group" style="margin-top:5px; margin-bottom:20px">
										<label class="col col-2">
										<input type="radio" name="radio-inline" checked="checked">
										<i></i>EMS </label>
										<label class="col col-2">
										<input type="radio" name="radio-inline" >
										<i></i>International parcel SAL </label>
										<label class="col col-4">
										<input type="radio" name="radio-inline" >
										<i></i>Registered mail with small packages airmail </label>
										<label class="col col-4">
										<input type="radio" name="radio-inline" >
										<i></i>With registered small packages aviation SAL flights  </label>
										
									</div>
									<div class="inline-group" style="margin-top:5px; margin-bottom:20px">
										<label class="col col-2">
										<input type="radio" name="radio-inline" >
										<i></i>FedEX </label>
										<label class="col col-2">
										<input type="radio" name="radio-inline" >
										<i></i>international e packet  </label>
										<label class="col col-4">
										<input type="radio" name="radio-inline" >
										<i></i>Registered non-small packages airmail </label>
										<label class="col col-4">
										<input type="radio" name="radio-inline" >
										<i></i>Registered non-small packages aviation SAL flights  </label>
										
									</div>
									<div class="row" style="background-color:white; padding-right: 40px;">
									<!-- START SHIPPING FREE TABLE  -->
										<table class="table table-bordered table-striped responsive-utilities" style="margin-left:15px;">
											<thead>
											  <tr>
												<th ng-repeat="sfColumnHeader in shippingFreeColumnHeaders">
												  {{sfColumnHeader}}
												</th> 
											</thead>
											<tbody>
											  <tr ng-repeat ="sfModel in shippingFreeTableModelData">
												<td class="">{{sfModel.shippingMethodName}}</td>
												<td class="" ng-repeat ="areaTimeUnitMapping in sfModel.listOfAreaTimeUnitMapping">
													<section>
														<input type="number" class="input" value="areaTimeUnitMapping.timeShipping" ng-model="areaTimeUnitMapping.timeShipping" placeholder="{{areaTimeUnitMapping.placeHolder}}"> {{areaTimeUnitMapping.moneyName}}
													</section>
												</td>
											  </tr> 
											</tbody> 
										</table>
										<!-- END OF SHIPPING FREE TABLE -->
									</div>
								</fieldset>
								<fieldset>
									<h2 style="font-weight: bold; margin-bottom:10px">Shipping setting</h2>
									<div class="row" style="background-color:white; padding-right: 40px;">
										<table class="table table-bordered table-striped responsive-utilities" style="margin-left:15px;"> 
											<thead>
											  <tr >
											    <th ng-repeat="cHeader in columnHeaders">
											    	{{cHeader}}
											    </th> 
											  </tr>
											</thead>
											<!-- START TBODY -->
											<tbody>
											  <tr ng-repeat="userAreaModel in areaTableModelData">
												<td class="">{{userAreaModel.shippingMethodName}}</td>
												<td class="" ng-repeat="areaTimeUnitMapping in userAreaModel.listOfAreaTimeUnitMapping">
													<section id="area-time-unit-mapping-{{areaTimeUnitMapping.recordId}}">
														<input type="number" class="input" value="areaTimeUnitMapping.timeShipping" ng-model="areaTimeUnitMapping.timeShipping" placeholder="{{areaTimeUnitMapping.placeHolder}}">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline-{{areaTimeUnitMapping.recordId}}" ng-model="areaTimeUnitMapping.valueOfAskFreeAndNoShipping" ng-value="0"  >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline-{{areaTimeUnitMapping.recordId}}" ng-model="areaTimeUnitMapping.valueOfAskFreeAndNoShipping" ng-value="2"  >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline-{{areaTimeUnitMapping.recordId}}" ng-model="areaTimeUnitMapping.valueOfAskFreeAndNoShipping" ng-value="1" >
															<i></i>Ask</label>
														</div>
													</section>
												</td> 
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" ng-model="userAreaModel.isChoice" ng-checked="userAreaModel.isChoice" ng-true-value="true" ng-false-value="false" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											</tbody>
											<!-- END TBODY -->
										</table>
									</div>
									<div class="row" style="margin-left:10px;margin-top:15px;">
										<div class="col col-5">
											<h3 style="margin-bottom: 10px">EBay Delivery Method</h3> 
											<section class="col" ng-repeat="areaAndMethod in ebayDeliveryMethod_ShippingAreaWithMethod">
												<label class="col col-3">{{areaAndMethod.areaName}}</label>
												<label class="col col-4">
													<select class="" id="select-{{areaAndMethod.areaId}}">
															<option ng-repeat="shippingMethod in areaAndMethod.lstEbayShippingMethods" value="{{shippingMethod.id}}">{{shippingMethod.name}}</option> 
													</select>
												</label>
											</section> 
										</div>
										<div class="col col6">
											<h3>EBay Shipping Fee</h3>
											<div class="row">
												<section class="col" ng-repeat="ebayShippingFeeArea in ebayShippingFee_ShippingAreaWithMethod |orderBy :'orderBy'" napt-repeat-directive>
													<div class="row" style="margin-top:10px; margin-bottom: 20px" ng-repeat="subArea in ebayShippingFeeArea">
														<label class="col col-6">{{subArea.areaName}}</label>
														<label class="col col-6">
															<select class="" id="select-shipping-fee-area-{{subArea.areaId}}" data-area-id="{{subArea.areaId}}">
																	<option ng-repeat="shippingMethod in subArea.lstEbayShippingMethods" value ="{{shippingMethod.id}}">{{shippingMethod.name}}</option> 
															</select>
														</label>
													</div> 
												</section> 
											</div>
										</div>
									</div>
									<div class="row" style="margin-left:10px;margin-top:15px;">
										<section class="col col-5" >
											<h3 style="margin-bottom: 10px">Shipping Details</h3>									
												<textarea rows="3" id="shipping-details" name="comment" style="width:80%;    margin-left: 25px;" placeholder=""></textarea> 
											
										</section>
										<section class="col col-6" >
											<h3 style="margin-bottom: 10px">Number of days to ship</h3>
											<label class="">
												<input type="number" id="number-day-ofship" class="input only-number" placeholder="day"> 
											</label>
										</section>
									</div>
									<div class="row" style="margin-left:10px;margin-top:15px;">
										<section class="col col-5" >
											<h3 style="margin-bottom: 10px">Return warranty period</h3>									
											<select class="" id="select-ret-warranty-method">
												<option ng-repeat="retWarrantyMethod in lstWarrantyMethod" value="{{retWarrantyMethod.id}}">{{retWarrantyMethod.name}}</option> 
											</select>	
											
										</section>
									</div>
								</fieldset>
								<fieldset>
									<h2 style="font-weight: bold; margin-bottom:10px">Not shipping country</h2>
									<label>Please select the setting of the country not shipping</label>
									<div class="row" ng-model="listOfGroupCountry" >
										<div class="col-sm-4 region" ng-repeat="countryGroup in listOfGroupCountry" > 
											 <span class="checkbox" style="display:inline-block">
												<label>
													<input type="checkbox" class="checkbox style-0" data-region="{{countryGroup.name}}" class="toggleAll" name="checkbox">
													<span>{{countryGroup.name}}</span>
												</label>
											</span>
											[<a href="{{countryGroup.href}}" data-toggle="collapse">Hide all countries</a>]
											  <ul id="{{countryGroup.name}}" class="collapse" style="padding-left:40px" >
												 <div class="checkbox" ng-repeat="country in countryGroup.lstCountries" napt-repeat-directive>
													  <label>
														<input type="checkbox" class="checkbox style-0" ng-model="country.isSelected" ng-checked="country.isSelected" ng-true-value="true" ng-false-value="false" data-country-id="{{country.id}}" name="country">
														<span>{{country.name}}</span>
													</label>
												</div>  
											  </ul>
										</div> 
									</div>									
								</fieldset>
								
								<footer>
									<button type="submit" class="btn btn-primary" ng-click="saveAllShippingSetting($event)">
										Save
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
		
		$(function() {
			$('.required-icon').tooltip({
				placement: 'left',
				title: 'Required field'
				});
		});
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			pageSetUp();
			
			$('input.toggleAll').change(function(){
				var checked = $(this).prop("checked");
				$(this).closest('.region').find('ul input').prop('checked',checked);
				updateListCountriesNotShipping();	
			});
			
			$('input[name=country]').click(function(){
				var region = $(this).closest('.region');
				var count = 0;
				$('input[name=country]',region).each(function(){
					count ++;
					var checked = $(this).prop('checked');
					if(checked){
						count--;
					};
				});
				$('input.toggleAll',region).prop('checked', count == 0);
				updateListCountriesNotShipping();	
			})
			
			function updateListCountriesNotShipping(){
				var container = $('#countriesNotShipping');
				container.html('');
				$('')
				$('input.toggleAll').each(function(){

					var checked = $(this).prop('checked');
					var span = document.createElement('span');
					var region = $(this).attr('data-region');
					if(checked){
						$(span).html(region);
						$(container).append(span);
						$(container).append('<span>,</span>');
					}else{
						var divRegion = $(this).closest('.region');
						$('input[name=country]', divRegion).each(function(){
							var span2 = document.createElement('span');
							var country = $(this).attr('data-country');

							var checked2 = $(this).prop('checked');
							if(checked2){
								$(span2).html(country);
								$(container).append(span2);
								$(container).append('<span>,</span>');
							}
						});	
					}
				});
				$('span:last-child',container).remove();
			}
		})

		</script>
		
		<!-- LOAD ANGULAR JS MODULE -->
		<script type="text/javascript"src="<c:url value="/resources/js/angularjs/angular.min.js"/>"></script>
		
		<!-- HANDING ALL BUSSSINESS LOGIC FOR SHIPPING SETTING APP(napt2017) -->
		<script type="text/javascript">
			var shippingSettingModule = angular.module("shipping_setting_app",[]);
			
			//Custom directive to handing end of event repeat
			shippingSettingModule.directive('naptRepeatDirective', function($timeout) {
				 return {
				        restrict: 'A',
				        link: function (scope, element, attr) {
				            if (scope.$last === true) {
				                $timeout(function () {
				                	//Load ebay shipping fee
				    				scope.loadEbayShippingFee();;
				                });
				            }
				        }
				    }
			 });
			
			shippingSettingModule.controller("shippingSettingController",function($scope,$http){ 
				
				/*#######################[ 				COMMON METHODS   		]###################################*/ 
				
				//Load area shipping method for layout area
				$scope.loadShippingMethod_ForShippingArea = function(layoutAreaId,callBack){
					var requestUrl = "GetLayoutAreaSetting/"+layoutAreaId;
					$http.get(requestUrl).success(function(data, status, headers,config) {  
						  callBack(data);
					 })
					 .error(function(data, status, headers,config) {
						  console.log(data);
					});
				}
				
				var token = $("meta[name='_csrf']").attr("content");
			    var header = $("meta[name='_csrf_header']").attr("content"); 
				var config = {
						headers:{ 
								'Accept':'application/json',
								'Content-Type': 'application/json' ,
								'X-CSRF-TOKEN':token
						}  
				} 
				
				//Global header for ajax http post request
				$scope.headers = config;
				
				//Div an array to array of sub array follow parameter
				$scope.divToSubArray = function(array,size){
					var len = array.length
					if(len<size){
						return array;
					}else{
						var retArray = [];
						var count =0;
						var tempArray =[];
						var processed =0;
						array.forEach(function(item,index){
							tempArray.push(item);
							count++; 
							if(count===size){
								retArray.push(tempArray);
								tempArray =[]
								processed+=count;
								count=0;
							}
						});
						
						if(processed <len){
							var lost = []
							for(var i=processed;i<len;i++){
								lost.push(array[i])
							}
							retArray.push(lost); 
						}
						
						return retArray;
					}
				} 
				
				/*#######################[ 		SHIPPING FREE BUSSINESS LOGIC 	 ]###################################*/
				$scope.loadShippingFree = function(){
					$http.get("LoadLayoutAreaSetting/1")
					 .success(function(data, status, headers,config) {
						 
						 //Extract data from ajax response
						 var shippingSettingModel = data.extraData;
						 var columnHeaders = shippingSettingModel.lstColumnHeader;
						 columnHeaders.pop();
						 var tableModelData = shippingSettingModel.lstAreaSettingDto; 
						 
						 //Assign for $scope model data
						 $scope.shippingFreeColumnHeaders = columnHeaders; 
						 $scope.shippingFreeTableModelData = tableModelData;
					 })
					 .error(function(data, status, headers,config) {
						  console.log(data);
					});
				};
				
				$scope.saveShippingFreeSetting = function(){
					var dataPost = $scope.shippingFreeTableModelData;
					$http.post("SaveUserAreaSetting",JSON.stringify(dataPost),$scope.headers)
						 .success(function(data, status, headers,config) {  
							  console.log(data)
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				/*#######################[ EBAY SHIPPING SETTING BUSSINESS LOGIC ]###################################*/ 
				$scope.loadEbayShippingSettingLayout = function(){
					$http.get("LoadLayoutAreaSetting/2")
						 .success(function(data, status, headers,config) {
							 
							 //Extract data from ajax response
							 var shippingSettingModel = data.extraData;
							 var columnHeaders = shippingSettingModel.lstColumnHeader;
							 var tableModelData = shippingSettingModel.lstAreaSettingDto;
							 
							 //Assign for $scope model data
							 $scope.columnHeaders = columnHeaders;
							 $scope.areaTableModelData = tableModelData;
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				$scope.saveUserShippingSetting =function(){
					var dataPost = $scope.areaTableModelData;
					$http.post("SaveUserAreaSetting",JSON.stringify(dataPost),$scope.headers)
						 .success(function(data, status, headers,config) {  
							  console.log(data);
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				/*#######################[ EBAY DELIVERY METHOD BUSSINESS LOGIC ]###################################*/ 
				
				$scope.loadShippingMethod_ForEbayDelivery = function(callBack){
					//Note in the configuration the ebay delivery area has areaId = 3
					var areaId = 3;
					$scope.loadShippingMethod_ForShippingArea(areaId,callBack);
				}
				
				$scope.saveEbayDeliveryMethod = function(){
					var dataPost = {
						returnWarrantyMethodId:$("#select-ret-warranty-method option:selected").val(),
						shippingDetail:$("#shipping-details").val(), 
						usShippingMethodId:$("#select-1 option:selected").val(), //#Warning
						otherAreaShippingMethodId:$("#select-2 option:selected").val() //#Warning
					};
					
					//#Warning :This value may be change depend on db config
					
					$http.post("SaveEbayDeliveryMethod",JSON.stringify(dataPost),$scope.headers)
						 .success(function(data, status, headers,config) {  
							  console.log(data);
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				$scope.loadEbayDeliveryMethod = function(){ 
					$http.get("GetEbayDeliveryMethod")
						 .success(function(data, status, headers,config) {  
							  if(data.recordId !==-1){
								  $scope.manualBindingEbayDeliveryMethod(data.extraData);
							  } 
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				$scope.loadReturnWarrantyMethod = function(){
					$http.get("GetReturnWarrantyMethods")
						 .success(function(data, status, headers,config) {  
							  $scope.lstWarrantyMethod = data.extraData;
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}; 
				
				$scope.manualBindingEbayDeliveryMethod = function(ebayDeliveryMethod){ 
					$("#shipping-details").val(ebayDeliveryMethod.shippingDetail);
					$("#select-ret-warranty-method").val(ebayDeliveryMethod.returnWarrantyMethodId);
					$("#select-1").val(ebayDeliveryMethod.usShippingMethodId);
					$("#select-2").val(ebayDeliveryMethod.otherAreaShippingMethodId);
				}
				
				/*#######################[ EBAY SHIPPING FEE BUSSINESS LOGIC ]###################################*/ 
				
				$scope.loadShippingMethod_ForEbayShippingFee = function(callBack){
					//Note in the configuration the ebay shipping fee has areaId = 4
					var areaId = 4;
					$scope.loadShippingMethod_ForShippingArea(areaId,callBack);
				}
				
				$scope.modifyShippingFee_ShippingAreaWithMethod = function(data){
					data.sort(function(first,second){
						return first.orderBy -second.orderBy
					});
					return $scope.divToSubArray(data,2);
				} 
				
				$scope.saveEbayShippingFee = function(){ 
					
					var layoutAreaId=4; 
					var numberDayOfShip =$("#number-day-ofship").val();
					if(numberDayOfShip===""){
						numberDayOfShip = 0;
					}
					
					var listAreaWithMethodIds =[];
					
					$("select[id*='select-shipping-fee-area-']").each(function(index,item){
						listAreaWithMethodIds.push({areaId:$(item).attr("data-area-id"),methodId:$(item).val()})
					});
					
					var dataPost= {
							listAreaWithMethod:listAreaWithMethodIds,
							numberOfDayToShip:numberDayOfShip,
							layoutAreaId:layoutAreaId
					};
					
					$http.post("SaveEbayShippingFee",JSON.stringify(dataPost),$scope.headers)
						 .success(function(data, status, headers,config) {  
							 console.log("Save ebay shipping fee ok")
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						}); 
				}
				
				$scope.loadEbayShippingFee = function(){
					$http.get("LoadEbayShippingFee")
						 .success(function(data, status, headers,config) {  
							  if(data.recordId!==-1){
								  $scope.manualBindingEbayShippingFee(data.extraData);
							  } 
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				};
				
				$scope.manualBindingEbayShippingFee = function(ebayShippingFee){ 
					ebayShippingFee.listAreaWithMethod.forEach(function(item,index){
						var selector ="#select-shipping-fee-area-"+item.areaId;
						$(selector).val(item.methodId);  
					}); 
					
					//ebayShippingFee.layoutAreaId 
					$("#number-day-ofship").val(ebayShippingFee.numberOfDayToShip); 
				}
				
				/*#######################[ NOT SHIPPING SETTING BUSSINESS LOGIC ]###################################*/  
				
				//Load not shipping country 
				$scope.loadNotShippingCountry = function(){
					$http.get("GetNotShippingCountry")
						 .success(function(data, status, headers,config) {  
							  $scope.listOfGroupCountry = data.extraData.lstCountryGroup;
						 })
						 .error(function(data, status, headers,config) {
							  console.log(data);
						});
				}
				
				$scope.saveNotShippingCountry = function(){
					//The post data to db
					var dataPost = [];
					
					$scope.listOfGroupCountry.forEach(function(item,index){
						item.lstCountries.forEach(function($item,$index){ 
							dataPost.push({
								countryId:$item.id,
								isSelected:$item.isSelected
							});
						});
					}); 
					
					var finalDataPost = {
							lstCountryConfigurations:dataPost
					} 
					 
					//Send ajax to server to save notshipping country configuration
					$http.post("SaveNotShippingCountry",JSON.stringify(finalDataPost),$scope.headers)
						 .success(function(data, status, headers,config) {
							 console.log(data);
									
						 }).error(function(data, status, headers,config) {
							 console.log(data);
					});  
				};
				
				/*#######################[ SAVE ALL USER CONFIGURATION ]###################################*/ 
				
				$scope.saveAllShippingSetting = function($event){
					$event.preventDefault(); 
					$scope.saveNotShippingCountry();
					$scope.saveEbayDeliveryMethod();
					$scope.saveEbayShippingFee(); 
					$scope.saveUserShippingSetting();
					$scope.saveShippingFreeSetting();
				};
				 
				/*#######################[ ALL DEFAULT ACTION WILL BE CALL HERE ]###################################*/ 
				
				//Load not shipping country area
				$scope.loadNotShippingCountry();
				
				//Load area with shipping method for ebay delivery layout area
				$scope.loadShippingMethod_ForEbayDelivery(function(data){
					$scope.ebayDeliveryMethod_ShippingAreaWithMethod = data.extraData;
				});
				
				//Load area with shipping method for ebay shipping fee
				$scope.loadShippingMethod_ForEbayShippingFee(function(data){
					$scope.ebayShippingFee_ShippingAreaWithMethod =$scope.modifyShippingFee_ShippingAreaWithMethod(data.extraData);  
				});
				
				//Load return warranty method
				$scope.loadReturnWarrantyMethod();
				
				//Load ebay delivery method
				$scope.loadEbayDeliveryMethod(); 
				
				//Load ebay shipping settting layout
				$scope.loadEbayShippingSettingLayout();
				
				//Load shipping free
				$scope.loadShippingFree(); 
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