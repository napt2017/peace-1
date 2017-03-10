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
					<li>Home</li><li>Sell</li>
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
				<section id="widget-grid" class="" style="margin: 15px;">

					<!-- row -->
					<form class="smart-form">
						<header>
										<h2>Item Listing </h2>
						</header>
						<div class="row">
							<article class="col-sm-12 col-md-12 col-lg-6">
								<div class="" id="wid-id-2">
										<!-- end widget edit box -->
										<!-- widget content -->
									<div class="widget-body no-padding">
										<fieldset>
											
											<section>
												<label class="label">Product title</label>
												<label class="input ">
													<input type="text" class="input-lg" id="product_title" maxlength="80">
												</label>
												<div class="note">
													<p>0 characters (max. 80 letters)</p>
													<a href="#">
														<i class="fa fa-hand-o-right" aria-hidden="true"></i>
														<span>Translate English</span>
													</a>
												</div>
											</section>
			
											<section>
												<label class="label">Item description</label>
												<label class="input ">
													<input type="text" class="input-lg" id="item-description">
												</label>
												<div class="note">
													<p style="font-weight:bold;color:red">Note: When decorating letters, please use after translating into English.</p>
													<a href="#">
														<i class="fa fa-hand-o-right" aria-hidden="true"></i>
														<span>Translate English</span>
													</a>
												</div>
											</section>
			
											<section>
												<label class="label">Exhibitor country</label>
												<label class="input ">
													<select class="form-control input-lg" id="select-exhibitor-country">
														<option>United States</option>
														<option>Australia</option>
														<option>United Kingdoom</option>
														<option>Canada</option>
														<option>Ebay Motors</option>
													</select>
												</label>
											</section>
																			
											<section>
												<label class="label">Category</label>
												<label class="input ">
													<select class="form-control input-lg" id="select-category">
														<option>Parts & Accessories</option>
														<option>Automotive Tools & Supplies</option>
													</select>
												</label>
											</section>
											<section>
												<label class="label">Air Options</label>
												<label class="input ">
													<select class="form-control input-lg" id="select-air-option">
														<option>Air Compressors</option>
														<option>Air Tools</option>
													</select>
												</label>
											</section>
											<section>
												<label class="label">State  UPC (JAN code etc.) Item Specifics</label>
												<label class="input ">
													<select class="form-control input-lg" id="select-item-state">
														<option>Please select</option>
														<option>New</option>
													</select>
												</label>
											</section>
											<section>
												<label class="label"></label>
												<label class="input ">
													<div class="required-field-block">
														<input type="text" placeholder="Does not apply" class="input-lg required" id="donot-apply" >
														<div class="required-icon">
															<div class="text">*</div>
														</div>
													</div>
												</label>
											</section>
											<section class="row">
												<fieldset style="    padding-top: 0px;">
												<div class="col-sm-12 col-md-12 col-lg-6">
													
													<section>
														<label class="label">Type</label>
														<label class="input " style="padding-right: 5px;">
															<input type="text" class="input-lg" id="type" >
														</label>
													</section>
													<section>
														<label class="label">Size</label>
														<label class="input " style="padding-right: 5px;">
															<input type="text" class="input-lg" id="size" >
														</label>
													</section>
													<section>
														<label class="label">Country / Region of Manufacture</label>
														<label class="input " style="padding-right: 6px;">
															<select class="form-control input-lg" id="select-country-region-of-manufacture" style="height:42px">
																<option>Please select</option>
																<option>Unknow</option>
															</select>
														</label>
													</section>
													<section>
														<label class="label">Brand</label>
														<label class="input " style="padding-right: 5px;">
															<input type="text" class="input-lg" id="branch" >
														</label>
													</section>
												</div>
												<div class="col-sm-12 col-md-12 col-lg-6">
													<section>
														<label class="label">Fragrance Name</label>
														<label class="input ">
															<input type="text" class="input-lg" id="fragrance-name">
														</label>
													</section>
													<section>
														<label class="label">Color</label>
														<label class="input ">
															<input type="text" class="input-lg" id="color">
														</label>
													</section>
													<section>
														<label class="label">MPN</label>
														<label class="input ">
															<input type="text" class="input-lg" id="mpn" >
														</label>
													</section>
													<section>
														<label class="label"></label>
														<label class="input ">
															<input type="text" class="input-lg" style="visibility:hidden">
														</label>
													</section>
												</div>
												</fieldset>
											</section>
											<section class="row">
												<fieldset style="    padding-top: 0px;">
													<label class="label">EBay Store category</label>
													<label class="input ">
														<select class="form-control input-lg" id="select-ebay-store-category" style="height:42px">
																<option>Please select</option>
																<option>Unknow</option>
														</select>
													</label>
												</fieldset>
											</section>
											
										</fieldset>
									</div>
								</div>
							</article>
							<article class="col-sm-12 col-md-12 col-lg-6">
							<div>
								<div class="widget-body no-padding">
									<fieldset>
										
										<section>
											<label class="label">Title image URL</label>
											<div class="input input-file">
												<span class="button input-lg" style="    height: 38px;">
													<input type="file"  id="file" name="file" class="input-lg" onchange="this.parentNode.nextSibling.value = this.value">Browse</span>
													<input type="text" class="input-lg" placeholder="Include some files" readonly="" id="title-image-url">
											</div>
											<div class="note">
													<p>&nbsp;</p>
													<a href="#">
														<i class="fa fa-hand-o-right" aria-hidden="true" style="visibility:hidden"></i>
														<span></span>
													</a>
											</div>
										</section>
										<section>
											<label class="label">Product image URL for product description</label>
											<label class="input ">
												<input type="text" class="input-lg" id="product-image-url" >
											</label>
											<div class="note">
													<p>&nbsp;</p>
													<a href="#">
														<i class="fa fa-hand-o-right" aria-hidden="true" style="visibility:hidden"></i>
														<span></span>
													</a>
											</div>
										</section>
										<section>
											<label class="label">YouTube URL </label>
											<label class="input ">
												<input type="text" class="input-lg" id="youtube-url" >
											</label>
										</section>
										<section style="height:69px">
											<div class="inline-group" style="padding-top: 30px">
												<label class="radio ">
													<input type="radio" name="radio-inline" value="0" checked="checked">
													<i></i>Auction</label>
												<label class="radio ">
													<input type="radio" name="radio-inline" value="1" >
													<i></i> Prompt decision  </label>
											</div>
										</section>
										<section>
											<label class="label">Buy It Now Price </label>
											<label class="input ">
												<input type="text" class="input-lg" id="buyit-now-price" >
											</label>
										</section>
										<section>
											<label class="checkbox ">
												<input type="checkbox" name="checkbox" id="is-best-offer-price" checked="checked" >
												<i></i> Best offer price  </label>
										</section>
										<section>
											<label class="input ">
												<input type="text" class="input-lg" > We accept more than this automatically 
											</label>
										</section>
										<section>
											<label class="input ">
												<input type="text" class="input-lg" > The amount below this is automatically rejected 
											</label>
										</section>
										<section>
											<div class="inline-group">
														<label class="checkbox ">
															<input type="checkbox" name="checkbox-inline" checked="checked" >
															<i></i>Alexandra</label>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox-inline" >
															<i></i>Alice</label>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox-inline" >
															<i></i>Anastasia</label>
				
													</div>
										</section>
										<section>
											<label class="label">Number of items </label>
											<label class="input ">
												<input type="text" class="input-lg" id="number-of-item">
											</label>
										</section>
										<section>
											<label class="label">Days of sale </label>
											<label class="input ">
												<select class="form-control input-lg" id="select-day-of-sale" style="height:42px">
													<option>Please select</option>
													<option>Unknow</option>
												</select>
											</label>
										</section>
										<section>
											<label class="checkbox ">
													<input type="checkbox" name="checkbox" id="is-specific-date-of-sale" checked="checked" >
													<i></i> Specify date of sale </label>
											<div>
												<label class="label"> US Pacific Time (PST)</label>
												<label class="input ">
													<input type="text" class="input-lg" id="us-pacific-time" >
												</label>
												<label class="label"> Seller's date</label>
												<label class="input ">
													<input type="text" class="input-lg" id="seller-date" >
												</label>
												<p>The most successful bidding is around 22 o'clock in the US Pacific time, Sunday in the week 
													PST Current date and time: Saturday, February 11, 2017 21 : 10</p>
											</div>
										</section>
										<section>
											<label class="checkbox ">
													<input type="checkbox" name="checkbox" id="is-free-shipping" checked="checked" >
													<i></i> Free shipping </label>
											<div>
												<label class="label"> Weight (ex: 0.5)</label> 
												<label class="input ">
													<input type="text" class="input-lg" id="weight" >
												</label>
											</div>
											<div class="note">
												<a href="#" style="margin-right:10px">
													<i class="fa fa-hand-o-right" aria-hidden="true" ></i>
													<span>Shipping indicator</span>
												</a>
												<a href="#">
													<i class="fa fa-hand-o-right" aria-hidden="true" ></i>
													<span>Edit shipping fee</span>
												</a>
											</div>
										</section>
										<section>
											<label class="label"> SKU</label> 
											<label class="input ">
												<input type="text" class="input-lg" id="sku">
											</label>
										</section>
										<section>
											<label class="checkbox ">
													<input type="checkbox" name="checkbox" id="is-private-listing" checked="checked" >
													<i></i>  Private Listing </label>
											<div class="note">
												<a href="#">
													<i class="fa fa-hand-o-right" aria-hidden="true" ></i>
													<span>Change of sending details</span>
												</a>
											</div>
										</section>
										<section>
												<label class="label"> Inventory URL</label> 
												<label class="input ">
													<input type="text" class="input-lg" id="inventory-url" >
												</label>
										</section>
									</fieldset>
								</div>
							</div>
							</article>
						</div>
						<footer>
							<button type="submit" class="btn btn-primary" id="btnAddEbayItem">
								Submit
							</button>
							<button type="button" class="btn btn-default" id="btnBackHistory">
								Back
							</button>
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
		
		$(document).ready(function() {
			
			pageSetUp();
		
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