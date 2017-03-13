<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us">
	<jsp:include page="../pages/common/header.jsp"/>  
	<meta name="_csrf" content="${_csrf.token}"/>
 	<meta name="_csrf_header" content="${_csrf.headerName}"/> 
	<body class="fixed-page-footer">
		<style>



.pickListSelect {
	height: 220px !important;
	
}

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
					<li>Home</li><li>Sell</li>
				</ol>
				<!-- end breadcrumb -->
			</div>
			<!-- END RIBBON -->

			<!-- MAIN CONTENT -->
			<div id="content">
				<!-- widget grid -->
				<section id="widget-grid" class="row" style="margin-left:15px">
					
					<!-- widget content -->
					<!-- end widget content -->
					<!-- row -->
					<form class="smart-form" style="">
						<div class="row">
							<fieldset>
		
								<section> <label class="label">Product title</label> <label
									class="input "> <input type="text" class="input"
									id="product_title" maxlength="80">
								</label>
								<div class="note">
									<p>0 characters (max. 80 letters)</p>
									<a href="#"> <i class="fa fa-hand-o-right" aria-hidden="true"></i>
										<span>Translate English</span>
									</a>
								</div>
								</section>
		
								<div class="col-sm-12 col-md-12 col-lg-12">
									<label class="label">Pick Category</label>
									<div id="category" class="tab-content padding-10">
										<div class="container">
											<div class="panel panel-default">
												<div class="panel-body">
		
													<div id="pickList"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
		
						</div>
						<footer>
						<button type="submit" class="btn btn-primary" id="btnAddEbayItem">
							Submit</button>
						<button type="button" class="btn btn-default" id="btnBackHistory">
							Back</button>
						</footer>
					</form>
			<!-- end row -->

					<!-- row -->


					<!-- end row -->

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
		var pickListId = 2;
		$(document).ready(function() {
			
			pageSetUp();
			
			// Get ebay Category
			
			// Init all category level 1
			var pick = $("#pickList").pickList({
				  data: []
			});
			
			getCategoryEbay(1, 0, pick);
			
			$( "#pickData").on('change', function() {
	      		// Set default level limit
	      		var levelLimit = 2;
	      		
	      		for (var int = 2; int <= pickListId; int++) {
    				//$( "#pickListResult" + pickListId).css("display","none");
    				$("#col" + int).remove();
				}
	      		
	      		pickListId = pickListId+1;
	      		// Initial template select
	      		var temp =  " <div class='col-sm-3' id='col"+levelLimit+"'>" +
    			"    <select class='form-control pickListSelect' count='" +pickListId+ "' style='display:none' levelLimit='"+ levelLimit +"' id='pickListResult"+pickListId+"' multiple></select>" +
    			" </div>";
    			
    			// If have not pickListResult, add template
    			// Else Remove other pickListResut have limitLevel > 2
				$("#categories").append(temp);
        			
	    	  	
	    		var p = pick.find("#pickData option:selected");
	    	  	getCategoryEbay(levelLimit, p[0].id, pick);
	   	 	});
		})

		</script>
		
		<!-- HANDING BUSSINESS LOGIC FOR ADD EBAY ITEM(napt2017) -->
		<script type="text/javascript">
			$(function(){
				$("#btnAddEbayItem").on("click",function(evt){
					evt.preventDefault();
					addItem();
					/* validate(function(){
						addItem();
					}); */
				});
				
				$("#btnBackHistory").on("click",function(evt){
					if(confirm("Are you sure to go back?")){
						window.history.back();
					}
				});
				
				function addItem(){
					var token = $("meta[name='_csrf']").attr("content");
				    var header = $("meta[name='_csrf_header']").attr("content");
				    
					$.ajax({
	                    type: "POST",
	                    headers: {
	                        'Accept':'application/json',
	                        'Content-Type': 'application/json'
	                    },
	                    beforeSend:function(xhr){
				             xhr.setRequestHeader(header, token);
				        },
	                    url: "AddItem",
	                    data:JSON.stringify({}),
	                    contentType: "application/json",
	                    mimeType: 'application/json',
	                    dataType: "json",
	                    success: function(respData){
	                        alert(respData.extraData);
	                    },
	                    error:function(evt){
	                    	console.log(evt);
	                    }
	                });  
				}
				
				function validate(onValidateSuccessCallBack){
					if($("#product_title").val()===""){
				        alert("Empty title");
				        return;
					}
	
					if($("#item-description").val()===""){
					        alert("Empty item description");
					        return;
					}
	
					/* if($("#select-exhibitor-country").val()===""){
					        alert("Empty");
					        return;
					} */
	
					/* if($("#select-category").val()===""){
					        alert("Empty");
					        return;
					}
	
					if($("#select-air-option").val()===""){
					        alert("Empty");
					        return;
					}
	
					if($("#select-item-state").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#donot-apply").val()===""){
					        alert("Empty do not apply");
					        return;
					}
	
					if($("#type").val()===""){
					        alert("Empty empty type");
					        return;
					}
	
					if($("#size").val()===""){
					        alert("Empty size");
					        return;
					}
	
					/* if($("#select-country-region-of-manufacture").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#branch").val()===""){
					        alert("Empty branch");
					        return;
					}
	
					if($("#fragrance-name").val()===""){
					        alert("Empty fragrance name");
					        return;
					}
	
					if($("#color").val()===""){
					        alert("Empty color");
					        return;
					}
	
					if($("#mpn").val()===""){
					        alert("Empty MPN");
					        return;
					}
	
					/* if($("#select-ebay-store-category").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#title-image-url").val()===""){
					        alert("Empty image url");
					        return;
					}
	
					if($("#product-image-url").val()===""){
					        alert("Empty product image url");
					        return;
					}
	
					if($("#youtube-url").val()===""){
					        alert("Empty youtube url");
					        return;
					}
	
					if($("#buyit-now-price").val()===""){
					        alert("Empty empty buyit now price");
					        return;
					}
	
					/* if($("#is-best-offer-price").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#number-of-item").val()===""){
					        alert("Empty number of item");
					        return;
					}
	
					/* if($("#select-day-of-sale").val()===""){
					        alert("Empty");
					        return;
					} */
	
					/* if($("#is-specific-date-of-sale").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#us-pacific-time").val()===""){
					        alert("Empty us pacific time");
					        return;
					}
	
					if($("#seller-date").val()===""){
					        alert("Empty seller date");
					        return;
					}
	
					/* if($("#is-free-shipping").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#weight").val()===""){
					        alert("Empty weight");
					        return;
					}
	
					if($("#sku").val()===""){
					        alert("Empty sku");
					        return;
					}
	
					/* if($("#is-private-listing").val()===""){
					        alert("Empty");
					        return;
					} */
	
					if($("#inventory-url").val()===""){
					        alert("Empty inventory url");
					        return;
					} 
					onValidateSuccessCallBack();
				}
			});
		</script>
		
		<!-- Thu vien xu ly picklist -->
		<script type="text/javascript">
		(function($) {
	
			  $.fn.pickList = function(options) {
	
			    var opts = $.extend({}, $.fn.pickList.defaults, options);
			    var levelLimit = 2;
			    var isHandle = false;
			
    			
			    // Fill data
			    this.fill = function(data) {
			      var option = '';
					if (data) {
						$.each(data, function(key, val) {
					        option += '<option id=' + val.id + '>' + val.name + ' > </option>';
					      });
					      this.find('#pickData').append(option);
				    };
				};
			      
			    
			    // Controll data
			    this.controll = function(data) {
			      	var pickThis = this;
			      	if (data) {
						  $( "#pickListResult" + pickListId).css("display","block");
							  var option = '';
							  $.each(data, function(key, val) {
								  if (val.leafCategory) {
							  		option += '<option id=' + val.id + ' isLeafCategory=' + val.leafCategory + '>' + val.name + '</option>';
								  } else {
									  option += '<option id=' + val.id + '>' + val.name + ' > </option>';
								  }
							});
							this.find('#pickListResult' + pickListId).append(option);
							return this.controll();
					}
			      	
			      	$("#pickListResult" + pickListId).on('change', function() {
			      		
			    	  	var levelLimitTemp = parseInt($(this).attr("levellimit"),10);
			    	  	var electmentId = $(this).attr("id");
			    	  	var count = parseInt($(this).attr("count"));
			    	  	
			    		var p = pickThis.find("#" + electmentId + " option:selected");
			    		var isLeafCategory = $(p[0]).attr("isLeafCategory");
			    		
			    		for (var int = (count + 1); int <= (pickListId + 5); int++) {
	        				$("#col" + int).remove();
						}
			    		
			    		if (p[0] && !isLeafCategory) {
			    			
			    			// If have not select next
			      			pickListId = pickListId + 1;
				      		var temp =  " <div class='col-sm-3' id='col" + pickListId + "'>" +
			    			"    <select class='form-control pickListSelect' style='display:none' count='" +pickListId+ "' levellimit='" + (levelLimitTemp + 1)+ "' id='pickListResult"+pickListId+"' multiple></select>" +
			    			" </div>";
			    			
				    	  	$("#categories").append(temp);
				    	  	getCategoryEbay((levelLimitTemp + 1), p[0].id, pickThis);
			    		}
			   	 	});
			   		
			    }
			    
			    this.getValues = function() {
			      var objResult = [];
			      this.find("#pickListResult option").each(function() {
			        objResult.push({
			          id: this.id,
			          text: this.text
			        });
			      });
			      return objResult;
			    };
			    this.init = function() {
			      var pickListHtml =
			        "<div class='row' id='categories'>" +
			        "  <div class='col-sm-3'>" +
			        "	 <select class='form-control pickListSelect' multiple id='pickData'></select>" +
			        " </div>" 
			        "</div>";
	
			      this.append(pickListHtml);
	
			      this.fill();
			      this.controll();
			    };
	
			    this.init();
			    return this;
			  };
	
			  $.fn.pickList.defaults = {
			    add: 'Add',
			    addAll: 'Add All',
			    remove: 'Remove',
			    removeAll: 'Remove All'
			  };
	
	
			}(jQuery));
		
		function getCategoryEbay(levelLimit, categoryId, pick) {
			var data = {categoryLevel : levelLimit, id : categoryId}
//				data["query"] = $("#query").val();
			var token = $("meta[name='_csrf']").attr("content");
		    var header = $("meta[name='_csrf_header']").attr("content");
		    
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/peace/GetCategory",
				data: JSON.stringify(data),
		        beforeSend:function(xhr){
		             xhr.setRequestHeader(header, token);
		        },
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					if (categoryId == 0) {
						pick.fill(data.extraData);	
					} else {
						
						pick.controll(data.extraData);
					}
					 
				},
				error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
			});
		}
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