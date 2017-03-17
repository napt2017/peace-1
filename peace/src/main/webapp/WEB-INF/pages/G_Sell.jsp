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
.ebay-fieldset{
	border: 1px solid #bfbebe !important;
    background: none !important;
}

.detail-action{
	list-style:none;
	display:inline-flex;
}

.detail-action li{
	border: 1px solid #bfbfbf;
    margin-right: 4px;
    margin-top: 3px;
    width: 110px;
    text-align: center;
}

.ebay-fieldset legend{
	color: black;
    font-size: 14px; 
    padding: 0px;
    display: inline;
}
.preview-image-list{
	border: 1px solid #bfbfbf;
    list-style: none;
    margin-top: 3px;
    height: 113px;
    background: none;
}

ul.preview-image-list li {
    display: inline-block;
    border: 1px solid #bfbfbf;
    width: 90px;
    text-align: center;
    margin: 2px;
    height: 100px;
    padding: 3px;
    background: #f5f59c;
}

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
<!--http://cgi5.ebay.com/ws/eBayISAPI.dll-->
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
								<!-- The product title part -->
								<section> 
									<label class="label">Product title</label> 
									<label class="input "> 
										<input type="text" class="input"id="product_title" maxlength="80">
									</label>
									<div class="note">
										<p>0 characters (max. 80 letters)</p>
										<a href="#"> <i class="fa fa-hand-o-right" aria-hidden="true"></i>
											<span>Translate English</span>
										</a>
									</div>
								</section> 
								
								<!-- The category part -->
								<section>
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
								</section> 
								
								<!-- The condition part -->
								<section> 
									<label class="label">Condition</label> 
									<label class="input "> 
										<select id="itemCondition" name="itemCondition">
											<option value="-1">-</option>
											<option value="1000">New</option>
											<option value="1500">New other (see details)</option>
											<option value="2000">Manufacturer refurbished</option>
											<option value="2500">Seller refurbished</option>
											<option value="3000">Used</option>
											<option value="7000">For parts or not working</option>
										</select>
									</label> 
								</section>
								
								<!-- The add photo part -->
								<section> 
									<label class="label">Add photos</label> 
									<label class="label">Upload up to 12 photos that show your item in multiple views (such as front, back, side, and close-up).  You are required to have a minimum of 1 photo in your listing.</label> 
									<label class="input "> 
										<button id="btnUpload">Choose Images</button>
										<ul class="preview-image-list">
											<li>
												<a href="#">Click to add photos(first photo is required)</a> 
											</li>
										</ul>
									</label> 
								</section>  
						
						<!-- The detail part -->
						<section> 
								<label class="label">Description</label>   
								<textarea id="ckEditorForDescription"></textarea>
								<!--  
								<ul class="detail-action">
									<li> <a href="#">Preview</a></li>
									<li> <a href="#">Save Draft</a></li>
								</ul>
								 -->
						</section>
						<!-- The quantity part -->
						<section> 
								<label class="label">Quantity</label> 
								<input type="number" id="quantity" value="1" />  
						</section>
						
						<!-- The format part -->
						<section> 
							<div class="panel panel-default">
				                <div class="panel-heading">
				                    <b>Choose a format and price</b>
				                </div>
				                <div class="panel-body">
				                 	<table>
				                 		<thead>
				                 			<th> 
				                 				<td> </td>
				                 				<td> </td>
				                 			</th>
				                 		</thead>
				                 		<tbody>
				                 			<tr>
				                 				<td>Pay no insertion fees for auction-style or fixed price listings. Buy It Now is free too. <a href="#">Learn More</a></td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>Required Starting price (<a href="http://pages.ebay.com/help/sell/fees.html">see listing fees</a> - opens in a new window or tab) </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>$ <input type="number" id="startingPrice" /> </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>Reserve price (<a href="http://pages.ebay.com/help/sell/fees.html">see listing fees</a> - opens in a new window or tab) </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>$ <input type="number" id="reservePrice" /> </td>
				                 				<td></td>
				                 			</tr>
				         
				                 			<tr>
				                 				<td>Buy It Now price (<a href="http://pages.ebay.com/help/sell/fees.html">see listing fees</a> - opens in a new window or tab) </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>$ <input type="number" id="buyNowPrice" /> </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>Duration</td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>
				                 					<select id="duration" name="duration" title="Duration"> 
													   <option value="Days_3">3 days</option>
													   <option value="Days_5" selected>5 days</option>
													   <option value="Days_7" >7 days</option>
													   <option value="Days_10">10 days</option>
													</select>
				                 				</td>
				                 				<td></td>
				                 			</tr>
				                 			<!-- 
				                 			<tr>
				                 				<td>
				                 					eBay for Charity <br>
														Donate a percentage of your sale to a charity of your choice and improve the chances you'll sell. eBay will also give you a <a href="http://pages.ebay.com/help/sell/GivingWorks-fee-policy.html">credit on basic selling fees </a>- opens in a new window or tab for sold items
				                 				</td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>
				                 					<input type="radio" name="a"> <span>I do not wish to donate at this time</span> <br>
				                 					<input type="radio" name="a"> <span>American Red Cross</span> <br>
				                 					<a href="#">Or, select another nonprofit you love</a>
				                 				</td>
				                 				<td> </td>
				                 			</tr>
				                 			<tr>
				                 				<td>Donation percentage</td>
				                 				<td> </td>
				                 			</tr>
				                 			<tr>
				                 				<td>
				                 				<select id="charityDonationPercent" name="charityDonationPercent" title="Donation Percentage" onchange="ebay.run(this.name,'onchange');">
														   <option value="-1">
														      Select %
														   </option>
														   <option value="100">100%</option>
														   <option value="95">95%</option>
														   <option value="90">90%</option>
														   <option value="85">85%</option>
														   <option value="80">80%</option>
														   <option value="75">75%</option>
														   <option value="70">70%</option>
														   <option value="65">65%</option>
														   <option value="60">60%</option>
														   <option value="55">55%</option>
														   <option value="50">50%</option>
														   <option value="45">45%</option>
														   <option value="40">40%</option>
														   <option value="35">35%</option>
														   <option value="30">30%</option>
														   <option value="25">25%</option>
														   <option value="20">20%</option>
														   <option value="15">15%</option>
														   <option value="10">10%</option>
														</select>
				                 				</td>
				                 				<td> </td>
				                 			</tr>
				                 			<tr>
				                 				<td>	
				                 					<b>eBay Giving Works Terms and Conditions</b>
				                 					<ul>
				                 						<li>A donation of at least $1.00 is required if your listing sells.</li>
				                 						<li>PayPal Giving Fund, a registered nonprofit, will collect your donation from the payment method you select to pay your eBay fees. To make your donation with a different payment method, please visit your donation account inside My eBay.</li>
				                 						<li>PayPal Giving Fund will deliver 100% of your donation to your chosen nonprofit</li>
				                 					</ul>
				                 					<input type="checkbox" /> <span> I accept the eBay Giving Works Terms and Conditions.</span><br>
				                 					<input type="checkbox" /> <span> I would like eBay to pass my contact details on to my chosen nonprofits (Optional - I can change this selection at any time in My eBay)</span>
				                 				</td>
				                 				<td></td>
				                 			</tr>
				                 			 -->
				                 		</tbody>
				                 	</table>
				                </div> 
					        </div>
						</section>
						
						<!-- The paid part -->
						<section> 
							<div class="panel panel-default">
				                <div class="panel-heading">
				                    <b>Select how you'll be paid</b>
				                </div>
				                <div class="panel-body">
				                  <table>
				                  	<thead>
				                  		<th>
				                  			<td> </td> 
				                  			<td> </td> 
				                  		</th> 
				                  	</thead>
				                  	<tbody>
				                  		<tr>
				                  			<td>
				                  				<span>Electronic payment methods</span><br>
				                  				<input type="checkbox" id="use-paypal-email"/> 
				                  				<!--  <span>PayPal <a href="http://pages.ebay.com/help/sell/paypalfees.html">(fees vary)</a></span> <br> -->
				                  				<span>Accept credit or debit card and bank payments safely and easily with PayPal</span> <br>
				                  				<span>Your PayPal account email address (to receive payments)</span> <br>
				                  				<input type="text" id="paypal-email" readonly="readonly" /> <br>
				                  				<!-- <input type ="checkbox" > <span> Require immediate payment when buyer uses Buy It Now</span> <br> -->
				                  				
				                  			</td>
				                  			<td> </td>
				                  		 </tr>
				                  	</tbody>
				                  </table>
				                </div> 
					        </div>
						</section>
						
						<!-- The add shipping detail part -->
						<section> 
							<div class="panel panel-default">
				                <div class="panel-heading">
				                    <b>Add shipping details</b>
				                </div>
				                <div class="panel-body">
				                   <button id="add-shipping-service-option">Add Shipping Service Option</button>
				                   <div class="shipping-detail-common-info">
				                   		<span>Amount</span> <input type="number" value="1" id="shipping-servce-common-amount"/> <br>
				                   		<span>Insurance Option </span> <br>
				                   		<select id="select-isurance-option">
				                   			<option value="Optional" selected>Optional</option>
											<option value="Required">Required</option>
											<option value="NotOffered">NotOffered</option>
											<option value="IncludedInShippingHandling">IncludedInShippingHandling</option>
											<option value="NotOfferedOnSite">NotOfferedOnSite</option>
											<option value="CustomCode">CustomCode</option>
				                   		</select> <br>
				                   		<span>Shipping Type </span> <br>
				                   		<select id="select-shipping-type">
				                   			<option value="Flat" selected>Flat</option>
											<option value="Calculated">Calculated</option>
											<option value="Freight">Freight</option>
											<option value="Free">Free</option>
											<option value="NotSpecified">NotSpecified</option>
											<option value="FlatDomesticCalculatedInternational">FlatDomesticCalculatedInternational</option>
											<option value="CalculatedDomesticFlatInternational">CalculatedDomesticFlatInternational</option>
											<option value="FreightFlat">FreightFlat</option>
											<option value="CustomCode">CustomCode</option>
				                   		</select> <br>
				                   		
				                   		<span>Payment Instructions</span><br>
				                   		<textarea id="payment-instructions" col="30" row="20" style="margin: 0px; width: 711px; height: 58px;"></textarea> 
				                   </div>
				                   <hr>
				                   <fieldset class="panel-shipping-service-option ebay-fieldset" data-index="1">
				                   		<legend>Shipping Service Option 1</legend>
				                    	<span>Shipping Method Type</span> <br>
				                   		<select class="select-shipping-method-code-type">
				                   			<option value="UPSGround">UPSGround</option>
											<option value="UPS3rdDay">UPS3rdDay</option>
											<option value="UPS2ndDay">UPS2ndDay</option>
											<option value="UPSNextDay">UPSNextDay</option>
											<option value="USPSPriority">USPSPriority</option>
											<option value="USPSParcel">USPSParcel</option>
											<option value="USPSStandardPost">USPSStandardPost</option>
											<option value="USPSMedia">USPSMedia</option>
											<option value="USPSFirstClass">USPSFirstClass</option>
											<option value="ShippingMethodStandard" selected>ShippingMethodStandard</option>
											<option value="ShippingMethodExpress">ShippingMethodExpress</option>
											<option value="USPSExpressMail">USPSExpressMail</option>
											<option value="UPSNextDayAir">UPSNextDayAir</option>
											<option value="UPS2DayAirAM">UPS2DayAirAM</option>
											<option value="USPSExpressMailFlatRateEnvelope">USPSExpressMailFlatRateEnvelope</option>
											<option value="USPSExpressMailPaddedFlatRateEnvelope">USPSExpressMailPaddedFlatRateEnvelope</option>
											<option value="USPSPriorityMailFlatRateEnvelope">USPSPriorityMailFlatRateEnvelope</option>
											<option value="USPSPriorityMailSmallFlatRateBox">USPSPriorityMailSmallFlatRateBox</option>
											<option value="USPSPriorityMailFlatRateBox">USPSPriorityMailFlatRateBox</option>
											<option value="USPSPriorityMailLargeFlatRateBox">USPSPriorityMailLargeFlatRateBox</option>
											<option value="USPSPriorityMailPaddedFlatRateEnvelope">USPSPriorityMailPaddedFlatRateEnvelope</option>
											<option value="USPSPriorityMailLegalFlatRateEnvelope">USPSPriorityMailLegalFlatRateEnvelope</option>
											<option value="USPSExpressMailLegalFlatRateEnvelope">USPSExpressMailLegalFlatRateEnvelope</option>
											<option value="USPSPriorityMailRegionalBoxA">USPSPriorityMailRegionalBoxA</option>
											<option value="USPSPriorityMailRegionalBoxB">USPSPriorityMailRegionalBoxB</option>
											<option value="USPSPriorityMailRegionalBoxC">USPSPriorityMailRegionalBoxC</option>
											<option value="USPSExpressMailFlatRateBox">USPSExpressMailFlatRateBox</option>
											<option value="Other">Other</option>
											<option value="LocalDelivery">LocalDelivery</option>
											<option value="NotSelected">NotSelected</option>
											<option value="InternationalNotSelected">InternationalNotSelected</option>
											<option value="StandardInternational">StandardInternational</option>
											<option value="ExpeditedInternational">ExpeditedInternational</option>
											<option value="USPSGlobalExpress">USPSGlobalExpress</option>
											<option value="USPSGlobalPriority">USPSGlobalPriority</option>
											<option value="USPSEconomyParcel">USPSEconomyParcel</option>
											<option value="USPSEconomyLetter">USPSEconomyLetter</option>
											<option value="USPSAirmailLetter">USPSAirmailLetter</option>
											<option value="USPSAirmailParcel">USPSAirmailParcel</option>
											<option value="UPSWorldWideExpressPlus">UPSWorldWideExpressPlus</option>
											<option value="UPSWorldWideExpress">UPSWorldWideExpress</option>
											<option value="UPSWorldWideExpedited">UPSWorldWideExpedited</option>
											<option value="UPSWorldwideSaver">UPSWorldwideSaver</option>
											<option value="UPSStandardToCanada">UPSStandardToCanada</option>
											<option value="USPSExpressMailInternationalFlatRateEnvelope">USPSExpressMailInternationalFlatRateEnvelope</option>
											<option value="USPSExpressMailInternationalPaddedFlatRateEnvelope">USPSExpressMailInternationalPaddedFlatRateEnvelope</option>
											<option value="USPSPriorityMailInternationalFlatRateEnvelope">USPSPriorityMailInternationalFlatRateEnvelope</option>
											<option value="USPSPriorityMailInternationalSmallFlatRateBox">USPSPriorityMailInternationalSmallFlatRateBox</option>
											<option value="USPSPriorityMailInternationalFlatRateBox">USPSPriorityMailInternationalFlatRateBox</option>
											<option value="USPSPriorityMailInternationalLargeFlatRateBox">USPSPriorityMailInternationalLargeFlatRateBox</option>
											<option value="USPSPriorityMailInternationalPaddedFlatRateEnvelope">USPSPriorityMailInternationalPaddedFlatRateEnvelope</option>
											<option value="USPSPriorityMailInternationalLegalFlatRateEnvelope">USPSPriorityMailInternationalLegalFlatRateEnvelope</option>
											<option value="USPSExpressMailInternationalLegalFlatRateEnvelope">USPSExpressMailInternationalLegalFlatRateEnvelope</option>
											<option value="USPSExpressMailInternationalFlatRateBox">USPSExpressMailInternationalFlatRateBox</option>
											<option value="OtherInternational">OtherInternational</option>
											<option value="AT_StandardDispatch">AT_StandardDispatch</option>
											<option value="AT_InsuredDispatch">AT_InsuredDispatch</option>
											<option value="AT_Writing">AT_Writing</option>
											<option value="AT_COD">AT_COD</option>
											<option value="AT_ExpressOrCourier">AT_ExpressOrCourier</option>
											<option value="AT_InsuredExpressOrCourier">AT_InsuredExpressOrCourier</option>
											<option value="AT_SpecialDispatch">AT_SpecialDispatch</option>
											<option value="AT_InsuredSpecialDispatch">AT_InsuredSpecialDispatch</option>
											<option value="AT_Sonstige">AT_Sonstige</option>
											<option value="AT_UnversicherterVersandInternational">AT_UnversicherterVersandInternational</option>
											<option value="AT_VersicherterVersandInternational">AT_VersicherterVersandInternational</option>
											<option value="AT_SonstigerVersandInternational">AT_SonstigerVersandInternational</option>
											<option value="AT_UnversicherterExpressVersandInternational">AT_UnversicherterExpressVersandInternational</option>
											<option value="AT_VersicherterExpressVersandInternational">AT_VersicherterExpressVersandInternational</option>
											<option value="AT_EconomyDeliveryFromAbroad">AT_EconomyDeliveryFromAbroad</option>
											<option value="AT_StandardDeliveryFromAbroad">AT_StandardDeliveryFromAbroad</option>
											<option value="AT_ExpressDeliveryFromAbroad">AT_ExpressDeliveryFromAbroad</option>
											<option value="AT_TrackedDeliveryFromAbroad">AT_TrackedDeliveryFromAbroad</option>
											<option value="AU_Regular">AU_Regular</option>
											<option value="AU_Express">AU_Express</option>
											<option value="AU_Registered">AU_Registered</option>
											<option value="AU_Courier">AU_Courier</option>
											<option value="AU_Other">AU_Other</option>
											<option value="AU_EMSInternationalCourierParcels">AU_EMSInternationalCourierParcels</option>
											<option value="AU_EMSInternationalCourierDocuments">AU_EMSInternationalCourierDocuments</option>
											<option value="AU_ExpressPostInternationalDocuments">AU_ExpressPostInternationalDocuments</option>
											<option value="AU_AirMailInternational">AU_AirMailInternational</option>
											<option value="AU_EconomyAirInternational">AU_EconomyAirInternational</option>
											<option value="AU_SeaMailInternational">AU_SeaMailInternational</option>
											<option value="AU_StandardInternational">AU_StandardInternational</option>
											<option value="AU_ExpeditedInternational">AU_ExpeditedInternational</option>
											<option value="AU_OtherInternational">AU_OtherInternational</option>
											<option value="AU_AusPostRegisteredPostInternationalPaddedBag1kg">AU_AusPostRegisteredPostInternationalPaddedBag1kg</option>
											<option value="AU_AusPostRegisteredPostInternationalPaddedBag500g">AU_AusPostRegisteredPostInternationalPaddedBag500g</option>
											<option value="AU_AusPostRegisteredPostInternationalParcel">AU_AusPostRegisteredPostInternationalParcel</option>
											<option value="AU_ExpeditedDeliveryFromOutsideAU">AU_ExpeditedDeliveryFromOutsideAU</option>
											<option value="AU_EconomyDeliveryFromOutsideAU">AU_EconomyDeliveryFromOutsideAU</option>
											<option value="AU_StandardDeliveryFromOutsideAU">AU_StandardDeliveryFromOutsideAU</option>
											<option value="AU_AustralianAirExpressMetro15kg">AU_AustralianAirExpressMetro15kg</option>
											<option value="AU_AustralianAirExpressFlatRate5kg">AU_AustralianAirExpressFlatRate5kg</option>
											<option value="AU_AustralianAirExpressFlatRate3kg">AU_AustralianAirExpressFlatRate3kg</option>
											<option value="AU_AustralianAirExpressFlatRate1kg">AU_AustralianAirExpressFlatRate1kg</option>
											<option value="AU_ExpressDelivery">AU_ExpressDelivery</option>
											<option value="AU_StandardDelivery">AU_StandardDelivery</option>
											<option value="AU_eBayAusPost3kgFlatRateSatchel">AU_eBayAusPost3kgFlatRateSatchel</option>
											<option value="AU_eBayAusPost500gFlatRateSatchel">AU_eBayAusPost500gFlatRateSatchel</option>
											<option value="AU_Freight">AU_Freight</option>
											<option value="BEFR_StandardDelivery">BEFR_StandardDelivery</option>
											<option value="BEFR_PriorityDelivery">BEFR_PriorityDelivery</option>
											<option value="BEFR_ParcelPost">BEFR_ParcelPost</option>
											<option value="BEFR_RegisteredMail">BEFR_RegisteredMail</option>
											<option value="BEFR_Other">BEFR_Other</option>
											<option value="BEFR_DePostInternational">BEFR_DePostInternational</option>
											<option value="BEFR_UPSInternational">BEFR_UPSInternational</option>
											<option value="BEFR_FedExInternational">BEFR_FedExInternational</option>
											<option value="BEFR_DHLInternational">BEFR_DHLInternational</option>
											<option value="BEFR_TPGPostTNTInternational">BEFR_TPGPostTNTInternational</option>
											<option value="BEFR_StandardInternational">BEFR_StandardInternational</option>
											<option value="BEFR_ExpeditedInternational">BEFR_ExpeditedInternational</option>
											<option value="BEFR_OtherInternational">BEFR_OtherInternational</option>
											<option value="BEFR_LaPosteInternational">BEFR_LaPosteInternational</option>
											<option value="BEFR_LaPosteStandardShipping">BEFR_LaPosteStandardShipping</option>
											<option value="BEFR_LaPosteCertifiedShipping">BEFR_LaPosteCertifiedShipping</option>
											<option value="BEFR_LaPosteTaxipostLLS">BEFR_LaPosteTaxipostLLS</option>
											<option value="BEFR_LaPosteTaxipost24h">BEFR_LaPosteTaxipost24h</option>
											<option value="BEFR_LaPosteTaxipostSecur">BEFR_LaPosteTaxipostSecur</option>
											<option value="BEFR_PostInternationalStandard">BEFR_PostInternationalStandard</option>
											<option value="BEFR_PostInternationalRegistered">BEFR_PostInternationalRegistered</option>
											<option value="BEFR_TNTInternational">BEFR_TNTInternational</option>
											<option value="BEFR_EconomyDeliveryFromAbroad">BEFR_EconomyDeliveryFromAbroad</option>
											<option value="BEFR_StandardDeliveryFromAbroad">BEFR_StandardDeliveryFromAbroad</option>
											<option value="BEFR_ExpressDeliveryFromAbroad">BEFR_ExpressDeliveryFromAbroad</option>
											<option value="BEFR_TrackedDeliveryFromAbroad">BEFR_TrackedDeliveryFromAbroad</option>
											<option value="BENL_StandardDelivery">BENL_StandardDelivery</option>
											<option value="BENL_PriorityDelivery">BENL_PriorityDelivery</option>
											<option value="BENL_ParcelPost">BENL_ParcelPost</option>
											<option value="BENL_RegisteredMail">BENL_RegisteredMail</option>
											<option value="BENL_Other">BENL_Other</option>
											<option value="BENL_DePostInternational">BENL_DePostInternational</option>
											<option value="BENL_UPSInternational">BENL_UPSInternational</option>
											<option value="BENL_FedExInternational">BENL_FedExInternational</option>
											<option value="BENL_DHLInternational">BENL_DHLInternational</option>
											<option value="BENL_TPGPostTNTInternational">BENL_TPGPostTNTInternational</option>
											<option value="BENL_StandardInternational">BENL_StandardInternational</option>
											<option value="BENL_ExpeditedInternational">BENL_ExpeditedInternational</option>
											<option value="BENL_OtherInternational">BENL_OtherInternational</option>
											<option value="BENL_LaPosteInternational">BENL_LaPosteInternational</option>
											<option value="BENL_DePostStandardShipping">BENL_DePostStandardShipping</option>
											<option value="BENL_DePostCertifiedShipping">BENL_DePostCertifiedShipping</option>
											<option value="BENL_DePostTaxipostLLS">BENL_DePostTaxipostLLS</option>
											<option value="BENL_DePostTaxipost24h">BENL_DePostTaxipost24h</option>
											<option value="BENL_DePostTaxipostSecur">BENL_DePostTaxipostSecur</option>
											<option value="BENL_OtherShippingMethods">BENL_OtherShippingMethods</option>
											<option value="BENL_PostInternationalStandard">BENL_PostInternationalStandard</option>
											<option value="BENL_PostInternationalRegistered">BENL_PostInternationalRegistered</option>
											<option value="BENL_TNTInternational">BENL_TNTInternational</option>
											<option value="BENL_EconomyDeliveryFromAbroad">BENL_EconomyDeliveryFromAbroad</option>
											<option value="BENL_StandardDeliveryFromAbroad">BENL_StandardDeliveryFromAbroad</option>
											<option value="BENL_ExpressDeliveryFromAbroad">BENL_ExpressDeliveryFromAbroad</option>
											<option value="BENL_TrackedDeliveryFromAbroad">BENL_TrackedDeliveryFromAbroad</option>
											<option value="CA_StandardDelivery">CA_StandardDelivery</option>
											<option value="CA_ExpeditedDelivery">CA_ExpeditedDelivery</option>
											<option value="CA_PostLettermail">CA_PostLettermail</option>
											<option value="CA_PostRegularParcel">CA_PostRegularParcel</option>
											<option value="CA_PostExpeditedParcel">CA_PostExpeditedParcel</option>
											<option value="CA_PostXpresspost">CA_PostXpresspost</option>
											<option value="CA_PostPriorityCourier">CA_PostPriorityCourier</option>
											<option value="CanadaPostExpeditedFlatRateBox">CanadaPostExpeditedFlatRateBox</option>
											<option value="CA_PostExpeditedFlatRateBox">CA_PostExpeditedFlatRateBox</option>
											<option value="CA_StandardInternational">CA_StandardInternational</option>
											<option value="CA_ExpeditedInternational">CA_ExpeditedInternational</option>
											<option value="CA_OtherInternational">CA_OtherInternational</option>
											<option value="CA_PostExpeditedParcelUSA">CA_PostExpeditedParcelUSA</option>
											<option value="CA_PostSmallPacketsUSA">CA_PostSmallPacketsUSA</option>
											<option value="CA_PostXpresspostUSA">CA_PostXpresspostUSA</option>
											<option value="CA_PostXpresspostInternational">CA_PostXpresspostInternational</option>
											<option value="CA_PostInternationalParcelSurface">CA_PostInternationalParcelSurface</option>
											<option value="CA_PostInternationalParcelAir">CA_PostInternationalParcelAir</option>
											<option value="CA_SmallPacketsInternational">CA_SmallPacketsInternational</option>
											<option value="CA_PurolatorInternational">CA_PurolatorInternational</option>
											<option value="CA_PostSmallPacketsUSAGround">CA_PostSmallPacketsUSAGround</option>
											<option value="CA_PostSmallPacketsUSAAir">CA_PostSmallPacketsUSAAir</option>
											<option value="CA_SmallPacketsInternationalGround">CA_SmallPacketsInternationalGround</option>
											<option value="CA_SmallPacketsInternationalAir">CA_SmallPacketsInternationalAir</option>
											<option value="CA_PostUSALetterPost">CA_PostUSALetterPost</option>
											<option value="CA_PostInternationalLetterPost">CA_PostInternationalLetterPost</option>
											<option value="CA_PostExpeditedFlatRateBoxUSA">CA_PostExpeditedFlatRateBoxUSA</option>
											<option value="CA_UPSExpressCanada">CA_UPSExpressCanada</option>
											<option value="CA_UPSExpressSaverCanada">CA_UPSExpressSaverCanada</option>
											<option value="CA_UPSExpeditedCanada">CA_UPSExpeditedCanada</option>
											<option value="CA_UPSStandardCanada">CA_UPSStandardCanada</option>
											<option value="CA_UPSExpressUnitedStates">CA_UPSExpressUnitedStates</option>
											<option value="CA_UPSExpeditedUnitedStates">CA_UPSExpeditedUnitedStates</option>
											<option value="CA_UPS3DaySelectUnitedStates">CA_UPS3DaySelectUnitedStates</option>
											<option value="CA_UPSStandardUnitedStates">CA_UPSStandardUnitedStates</option>
											<option value="CA_UPSWorldWideExpress">CA_UPSWorldWideExpress</option>
											<option value="CA_UPSWorldWideExpedited">CA_UPSWorldWideExpedited</option>
											<option value="CA_PriorityWorldwide">CA_PriorityWorldwide</option>
											<option value="CanadaPostExpeditedFlatRateBoxUSA">CanadaPostExpeditedFlatRateBoxUSA</option>
											<option value="CA_PostTrackedPacketsUSA">CA_PostTrackedPacketsUSA</option>
											<option value="CA_PostTrackedPacketsInternational">CA_PostTrackedPacketsInternational</option>
											<option value="CA_Freight">CA_Freight</option>
											<option value="CH_StandardDispatchAPost">CH_StandardDispatchAPost</option>
											<option value="CH_StandardDispatchBPost">CH_StandardDispatchBPost</option>
											<option value="CH_InsuredDispatch">CH_InsuredDispatch</option>
											<option value="CH_Writing">CH_Writing</option>
											<option value="CH_COD">CH_COD</option>
											<option value="CH_ExpressOrCourier">CH_ExpressOrCourier</option>
											<option value="CH_InsuredExpressOrCourier">CH_InsuredExpressOrCourier</option>
											<option value="CH_SpecialDispatch">CH_SpecialDispatch</option>
											<option value="CH_InsuredSpecialDispatch">CH_InsuredSpecialDispatch</option>
											<option value="CH_Sonstige">CH_Sonstige</option>
											<option value="CH_SonstigerVersandInternational">CH_SonstigerVersandInternational</option>
											<option value="CH_EconomySendungenInternational">CH_EconomySendungenInternational</option>
											<option value="CH_PrioritySendungenInternational">CH_PrioritySendungenInternational</option>
											<option value="CH_UrgentSendungenInternational">CH_UrgentSendungenInternational</option>
											<option value="CH_EconomyDeliveryFromAbroad">CH_EconomyDeliveryFromAbroad</option>
											<option value="CH_StandardDeliveryFromAbroad">CH_StandardDeliveryFromAbroad</option>
											<option value="CH_ExpressDeliveryFromAbroad">CH_ExpressDeliveryFromAbroad</option>
											<option value="CH_TrackedDeliveryFromAbroad">CH_TrackedDeliveryFromAbroad</option>
											<option value="CN_PersonalDelivery">CN_PersonalDelivery</option>
											<option value="CN_RegularPackage">CN_RegularPackage</option>
											<option value="CN_DeliveryCompanyExpress">CN_DeliveryCompanyExpress</option>
											<option value="CN_PostOfficeExpress">CN_PostOfficeExpress</option>
											<option value="CN_Others">CN_Others</option>
											<option value="CN_FastPostOffice">CN_FastPostOffice</option>
											<option value="CN_ExpressDeliverySameCity">CN_ExpressDeliverySameCity</option>
											<option value="CN_ExpressDeliveryOtherCities">CN_ExpressDeliveryOtherCities</option>
											<option value="CN_StandardInternational">CN_StandardInternational</option>
											<option value="CN_ExpeditedInternational">CN_ExpeditedInternational</option>
											<option value="CN_OtherInternational">CN_OtherInternational</option>
											<option value="CN_CODInternational">CN_CODInternational</option>
											<option value="CN_StandardMailingInternational">CN_StandardMailingInternational</option>
											<option value="CN_RegularLogisticsInternational">CN_RegularLogisticsInternational</option>
											<option value="CN_EMSInternational">CN_EMSInternational</option>
											<option value="CN_OthersInternational">CN_OthersInternational</option>
											<option value="DE_StandardDispatch">DE_StandardDispatch</option>
											<option value="DE_InsuredDispatch">DE_InsuredDispatch</option>
											<option value="DE_Writing">DE_Writing</option>
											<option value="DE_COD">DE_COD</option>
											<option value="DE_ExpressOrCourier">DE_ExpressOrCourier</option>
											<option value="DE_InsuredExpressOrCourier">DE_InsuredExpressOrCourier</option>
											<option value="DE_SpecialDispatch">DE_SpecialDispatch</option>
											<option value="DE_InsuredSpecialDispatch">DE_InsuredSpecialDispatch</option>
											<option value="DE_UnversicherterVersand">DE_UnversicherterVersand</option>
											<option value="DE_DeutschePostBrief">DE_DeutschePostBrief</option>
											<option value="DE_eBayDHLPaket24x7">DE_eBayDHLPaket24x7</option>
											<option value="DE_DHLPostpaket">DE_DHLPostpaket</option>
											<option value="DE_DHLPackchen">DE_DHLPackchen</option>
											<option value="DE_DeutschePostWarensendung">DE_DeutschePostWarensendung</option>
											<option value="DE_DeutschePostBuchersendung">DE_DeutschePostBuchersendung</option>
											<option value="DE_HermesPaketUnversichert">DE_HermesPaketUnversichert</option>
											<option value="DE_HermesPaketVersichert">DE_HermesPaketVersichert</option>
											<option value="DE_IloxxTransportXXL">DE_IloxxTransportXXL</option>
											<option value="DE_IloxxUbernachtExpress">DE_IloxxUbernachtExpress</option>
											<option value="DE_IloxxStandard">DE_IloxxStandard</option>
											<option value="DE_Sonstige">DE_Sonstige</option>
											<option value="DE_UnversicherterVersandInternational">DE_UnversicherterVersandInternational</option>
											<option value="DE_VersicherterVersandInternational">DE_VersicherterVersandInternational</option>
											<option value="DE_DHLPostpaketInternational">DE_DHLPostpaketInternational</option>
											<option value="DE_DHLPackchenInternational">DE_DHLPackchenInternational</option>
											<option value="DE_SonstigerVersandInternational">DE_SonstigerVersandInternational</option>
											<option value="DE_UnversicherterExpressVersandInternational">DE_UnversicherterExpressVersandInternational</option>
											<option value="DE_VersicherterExpressVersandInternational">DE_VersicherterExpressVersandInternational</option>
											<option value="DE_DeutschePostBriefLandInternational">DE_DeutschePostBriefLandInternational</option>
											<option value="DE_DeutschePostBriefLuftInternational">DE_DeutschePostBriefLuftInternational</option>
											<option value="DE_IloxxEuropaInternational">DE_IloxxEuropaInternational</option>
											<option value="DE_IloxxWorldWideInternational">DE_IloxxWorldWideInternational</option>
											<option value="DE_Paket">DE_Paket</option>
											<option value="DE_Express">DE_Express</option>
											<option value="DE_DHLPaket">DE_DHLPaket</option>
											<option value="DE_DPBuecherWarensendung">DE_DPBuecherWarensendung</option>
											<option value="DE_HermesPaket">DE_HermesPaket</option>
											<option value="DE_IloxxTransport">DE_IloxxTransport</option>
											<option value="DE_SonstigeDomestic">DE_SonstigeDomestic</option>
											<option value="DE_Einschreiben">DE_Einschreiben</option>
											<option value="DE_Nachname">DE_Nachname</option>
											<option value="DE_SpecialDelivery">DE_SpecialDelivery</option>
											<option value="DE_UPS">DE_UPS</option>
											<option value="DE_DPD">DE_DPD</option>
											<option value="DE_GLS">DE_GLS</option>
											<option value="DE_PaketInternational">DE_PaketInternational</option>
											<option value="DE_DHLPaketInternational">DE_DHLPaketInternational</option>
											<option value="DE_DHLPaketIntlExpress">DE_DHLPaketIntlExpress</option>
											<option value="DE_SonstigeInternational">DE_SonstigeInternational</option>
											<option value="DE_ExpressInternational">DE_ExpressInternational</option>
											<option value="DE_DPBriefInternational">DE_DPBriefInternational</option>
											<option value="DE_IloxxTransportInternational">DE_IloxxTransportInternational</option>
											<option value="DE_HermesPaketInternational">DE_HermesPaketInternational</option>
											<option value="DE_UPSInternational">DE_UPSInternational</option>
											<option value="DE_DPDInternational">DE_DPDInternational</option>
											<option value="DE_GLSInternational">DE_GLSInternational</option>
											<option value="DE_eBayHermesPaketShop2ShopKaeufer">DE_eBayHermesPaketShop2ShopKaeufer</option>
											<option value="DE_HermesPaketShop2ShopKaeufer">DE_HermesPaketShop2ShopKaeufer</option>
											<option value="DE_eBayHermesPaketShop2Shop">DE_eBayHermesPaketShop2Shop</option>
											<option value="DE_HermesPaketShop2Shop">DE_HermesPaketShop2Shop</option>
											<option value="DE_HermesPaketSperrgut">DE_HermesPaketSperrgut</option>
											<option value="DE_eBayHermesPaketSperrgutShop2Shop">DE_eBayHermesPaketSperrgutShop2Shop</option>
											<option value="DE_DHLPaeckchenPackstation">DE_DHLPaeckchenPackstation</option>
											<option value="DE_DHLPaketPackstation">DE_DHLPaketPackstation</option>
											<option value="DE_eBayDHLPaeckchen">DE_eBayDHLPaeckchen</option>
											<option value="DE_DHLStarPaeckchen">DE_DHLStarPaeckchen</option>
											<option value="DE_TrackedDeliveryFromAbroad">DE_TrackedDeliveryFromAbroad</option>
											<option value="ES_CartasNacionalesHasta20">ES_CartasNacionalesHasta20</option>
											<option value="ES_CartasNacionalesDeMas20">ES_CartasNacionalesDeMas20</option>
											<option value="ES_CartasInternacionalesHasta20">ES_CartasInternacionalesHasta20</option>
											<option value="ES_CartasInternacionalesDeMas20">ES_CartasInternacionalesDeMas20</option>
											<option value="ES_PaqueteAzulHasta2kg">ES_PaqueteAzulHasta2kg</option>
											<option value="ES_PaqueteAzulDeMas2kg">ES_PaqueteAzulDeMas2kg</option>
											<option value="ES_PaqueteInternacionalEconomico">ES_PaqueteInternacionalEconomico</option>
											<option value="ES_Urgente">ES_Urgente</option>
											<option value="ES_Otros">ES_Otros</option>
											<option value="ES_StandardInternational">ES_StandardInternational</option>
											<option value="ES_ExpeditedInternational">ES_ExpeditedInternational</option>
											<option value="ES_OtherInternational">ES_OtherInternational</option>
											<option value="ES_CartasPostalInternational">ES_CartasPostalInternational</option>
											<option value="ES_EmsPostalExpressInternational">ES_EmsPostalExpressInternational</option>
											<option value="ES_EconomyPacketInternational">ES_EconomyPacketInternational</option>
											<option value="ES_EconomyDeliveryFromAbroad">ES_EconomyDeliveryFromAbroad</option>
											<option value="ES_StandardDeliveryFromAbroad">ES_StandardDeliveryFromAbroad</option>
											<option value="ES_ExpressDeliveryFromAbroad">ES_ExpressDeliveryFromAbroad</option>
											<option value="ES_TrackedDeliveryFromAbroad">ES_TrackedDeliveryFromAbroad</option>
											<option value="ES_ENTREGA_KIALA_8KG">ES_ENTREGA_KIALA_8KG</option>
											<option value="FR_ChronoposteInternationalClassic">FR_ChronoposteInternationalClassic</option>
											<option value="FR_ColiposteColissimoDirect">FR_ColiposteColissimoDirect</option>
											<option value="FR_DHLExpressEuropack">FR_DHLExpressEuropack</option>
											<option value="FR_UPSStandard">FR_UPSStandard</option>
											<option value="FR_PostOfficeLetter">FR_PostOfficeLetter</option>
											<option value="FR_PostOfficeLetterFollowed">FR_PostOfficeLetterFollowed</option>
											<option value="FR_PostOfficeLetterRecommended">FR_PostOfficeLetterRecommended</option>
											<option value="FR_ColiposteColissimo">FR_ColiposteColissimo</option>
											<option value="FR_ColiposteColissimoRecommended">FR_ColiposteColissimoRecommended</option>
											<option value="FR_UPSStandardAgainstRefund">FR_UPSStandardAgainstRefund</option>
											<option value="FR_Autre">FR_Autre</option>
											<option value="FR_Ecopli">FR_Ecopli</option>
											<option value="FR_Colieco">FR_Colieco</option>
											<option value="FR_AuteModeDenvoiDeColis">FR_AuteModeDenvoiDeColis</option>
											<option value="FR_RemiseEnMainPropre">FR_RemiseEnMainPropre</option>
											<option value="FR_StandardInternational">FR_StandardInternational</option>
											<option value="FR_ExpeditedInternational">FR_ExpeditedInternational</option>
											<option value="FR_OtherInternational">FR_OtherInternational</option>
											<option value="FR_LaPosteInternationalPriorityCourier">FR_LaPosteInternationalPriorityCourier</option>
											<option value="FR_LaPosteInternationalEconomyCourier">FR_LaPosteInternationalEconomyCourier</option>
											<option value="FR_LaPosteColissimoInternational">FR_LaPosteColissimoInternational</option>
											<option value="FR_LaPosteColisEconomiqueInternational">FR_LaPosteColisEconomiqueInternational</option>
											<option value="FR_LaPosteColissimoEmballageInternational">FR_LaPosteColissimoEmballageInternational</option>
											<option value="FR_ChronopostClassicInternational">FR_ChronopostClassicInternational</option>
											<option value="FR_ChronopostPremiumInternational">FR_ChronopostPremiumInternational</option>
											<option value="FR_UPSStandardInternational">FR_UPSStandardInternational</option>
											<option value="FR_UPSExpressInternational">FR_UPSExpressInternational</option>
											<option value="FR_DHLInternational">FR_DHLInternational</option>
											<option value="FR_LaPosteLetterMax">FR_LaPosteLetterMax</option>
											<option value="FR_KIALA_DELIVERY">FR_KIALA_DELIVERY</option>
											<option value="FR_TrackedDeliveryFromAbroad">FR_TrackedDeliveryFromAbroad</option>
											<option value="IN_Regular">IN_Regular</option>
											<option value="IN_Express">IN_Express</option>
											<option value="IN_NationalCOD">IN_NationalCOD</option>
											<option value="IN_Courier">IN_Courier</option>
											<option value="IN_LocalCOD">IN_LocalCOD</option>
											<option value="IN_StandardInternational">IN_StandardInternational</option>
											<option value="IN_ExpeditedInternational">IN_ExpeditedInternational</option>
											<option value="IN_OtherInternational">IN_OtherInternational</option>
											<option value="IN_FlatRateCOD">IN_FlatRateCOD</option>
											<option value="IN_BuyerPicksUpAndPays">IN_BuyerPicksUpAndPays</option>
											<option value="IT_RegularMail">IT_RegularMail</option>
											<option value="IT_PriorityMail">IT_PriorityMail</option>
											<option value="IT_MailRegisteredLetter">IT_MailRegisteredLetter</option>
											<option value="IT_MailRegisteredLetterWithMark">IT_MailRegisteredLetterWithMark</option>
											<option value="IT_InsuredMail">IT_InsuredMail</option>
											<option value="IT_QuickMail">IT_QuickMail</option>
											<option value="IT_RegularPackage">IT_RegularPackage</option>
											<option value="IT_QuickPackage1">IT_QuickPackage1</option>
											<option value="IT_QuickPackage3">IT_QuickPackage3</option>
											<option value="IT_ExpressCourier">IT_ExpressCourier</option>
											<option value="IT_ExpressPackageMaxi">IT_ExpressPackageMaxi</option>
											<option value="IT_StandardInternational">IT_StandardInternational</option>
											<option value="IT_ExpeditedInternational">IT_ExpeditedInternational</option>
											<option value="IT_OtherInternational">IT_OtherInternational</option>
											<option value="IT_TrackedDeliveryFromAbroad">IT_TrackedDeliveryFromAbroad</option>
											<option value="NL_StandardDelivery">NL_StandardDelivery</option>
											<option value="NL_ParcelPost">NL_ParcelPost</option>
											<option value="NL_RegisteredMail">NL_RegisteredMail</option>
											<option value="NL_Other">NL_Other</option>
											<option value="NL_TPGPostTNTInternational">NL_TPGPostTNTInternational</option>
											<option value="NL_UPSInternational">NL_UPSInternational</option>
											<option value="NL_FedExInternational">NL_FedExInternational</option>
											<option value="NL_DHLInternational">NL_DHLInternational</option>
											<option value="NL_DPDGBRInternational">NL_DPDGBRInternational</option>
											<option value="NL_GLSBusinessInternational">NL_GLSBusinessInternational</option>
											<option value="NL_StandardInternational">NL_StandardInternational</option>
											<option value="NL_ExpeditedInternational">NL_ExpeditedInternational</option>
											<option value="NL_OtherInternational">NL_OtherInternational</option>
											<option value="NL_EconomyDeliveryFromAbroad">NL_EconomyDeliveryFromAbroad</option>
											<option value="NL_StandardDeliveryFromAbroad">NL_StandardDeliveryFromAbroad</option>
											<option value="NL_ExpressDeliveryFromAbroad">NL_ExpressDeliveryFromAbroad</option>
											<option value="NL_TrackedDeliveryFromAbroad">NL_TrackedDeliveryFromAbroad</option>
											<option value="TW_RegisteredMail">TW_RegisteredMail</option>
											<option value="TW_UnregisteredMail">TW_UnregisteredMail</option>
											<option value="TW_COD">TW_COD</option>
											<option value="TW_DwellingMatchPost">TW_DwellingMatchPost</option>
											<option value="TW_DwellingMatchCOD">TW_DwellingMatchCOD</option>
											<option value="TW_SelfPickup">TW_SelfPickup</option>
											<option value="TW_ParcelPost">TW_ParcelPost</option>
											<option value="TW_ExpressMail">TW_ExpressMail</option>
											<option value="TW_Other">TW_Other</option>
											<option value="TW_CPInternationalLetterPost">TW_CPInternationalLetterPost</option>
											<option value="TW_CPInternationalParcelPost">TW_CPInternationalParcelPost</option>
											<option value="TW_CPInternationalRegisteredLetterPost">TW_CPInternationalRegisteredLetterPost</option>
											<option value="TW_CPInternationalRegisteredParcelPost">TW_CPInternationalRegisteredParcelPost</option>
											<option value="TW_CPInternationalEMS">TW_CPInternationalEMS</option>
											<option value="TW_CPInternationalOceanShippingParcel">TW_CPInternationalOceanShippingParcel</option>
											<option value="TW_FedExInternationalPriority">TW_FedExInternationalPriority</option>
											<option value="TW_FedExInternationalEconomy">TW_FedExInternationalEconomy</option>
											<option value="TW_UPSWorldwideExpedited">TW_UPSWorldwideExpedited</option>
											<option value="TW_UPSWorldwideExpress">TW_UPSWorldwideExpress</option>
											<option value="TW_UPSWorldwideExpressPlus">TW_UPSWorldwideExpressPlus</option>
											<option value="TW_OtherInternational">TW_OtherInternational</option>
											<option value="UK_RoyalMailFirstClassStandard">UK_RoyalMailFirstClassStandard</option>
											<option value="UK_RoyalMailSecondClassStandard">UK_RoyalMailSecondClassStandard</option>
											<option value="UK_RoyalMailFirstClassRecorded">UK_RoyalMailFirstClassRecorded</option>
											<option value="UK_RoyalMailSecondClassRecorded">UK_RoyalMailSecondClassRecorded</option>
											<option value="UK_RoyalMailSpecialDelivery">UK_RoyalMailSpecialDelivery</option>
											<option value="UK_RoyalMailStandardParcel">UK_RoyalMailStandardParcel</option>
											<option value="UK_Parcelforce24">UK_Parcelforce24</option>
											<option value="UK_Parcelforce48">UK_Parcelforce48</option>
											<option value="UK_OtherCourier">UK_OtherCourier</option>
											<option value="UK_myHermesDoorToDoorService">UK_myHermesDoorToDoorService</option>
											<option value="UK_CollectDropAtStoreDeliveryToDoor">UK_CollectDropAtStoreDeliveryToDoor</option>
											<option value="UK_SellersStandardRate">UK_SellersStandardRate</option>
											<option value="UK_CollectInPerson">UK_CollectInPerson</option>
											<option value="UK_SellersStandardInternationalRate">UK_SellersStandardInternationalRate</option>
											<option value="UK_RoyalMailAirmailInternational">UK_RoyalMailAirmailInternational</option>
											<option value="UK_RoyalMailAirsureInternational">UK_RoyalMailAirsureInternational</option>
											<option value="UK_RoyalMailSurfaceMailInternational">UK_RoyalMailSurfaceMailInternational</option>
											<option value="UK_RoyalMailInternationalSignedFor">UK_RoyalMailInternationalSignedFor</option>
											<option value="UK_RoyalMailHMForcesMailInternational">UK_RoyalMailHMForcesMailInternational</option>
											<option value="UK_ParcelForceInternationalDatapost">UK_ParcelForceInternationalDatapost</option>
											<option value="UK_ParcelForceIreland24International">UK_ParcelForceIreland24International</option>
											<option value="UK_ParcelForceEuro48International">UK_ParcelForceEuro48International</option>
											<option value="UK_ParcelForceInternationalScheduled">UK_ParcelForceInternationalScheduled</option>
											<option value="UK_OtherCourierOrDeliveryInternational">UK_OtherCourierOrDeliveryInternational</option>
											<option value="UK_CollectInPersonInternational">UK_CollectInPersonInternational</option>
											<option value="UK_ParcelForceIntlExpress">UK_ParcelForceIntlExpress</option>
											<option value="UK_ParcelForceIntlValue">UK_ParcelForceIntlValue</option>
											<option value="UK_ParcelForceIntlEconomy">UK_ParcelForceIntlEconomy</option>
											<option value="UK_TrackedDeliveryFromAbroad">UK_TrackedDeliveryFromAbroad</option>
											<option value="UK_IntlTrackedPostage">UK_IntlTrackedPostage</option>
											<option value="IE_SellersStandardRate">IE_SellersStandardRate</option>
											<option value="IE_FirstClassLetterService">IE_FirstClassLetterService</option>
											<option value="IE_SwiftPostNational">IE_SwiftPostNational</option>
											<option value="IE_RegisteredPost">IE_RegisteredPost</option>
											<option value="IE_EMSSDSCourier">IE_EMSSDSCourier</option>
											<option value="IE_EconomySDSCourier">IE_EconomySDSCourier</option>
											<option value="IE_OtherCourier">IE_OtherCourier</option>
											<option value="IE_CollectionInPerson">IE_CollectionInPerson</option>
											<option value="IE_SellersStandardRateInternational">IE_SellersStandardRateInternational</option>
											<option value="IE_InternationalEconomyService">IE_InternationalEconomyService</option>
											<option value="IE_InternationalPriorityService">IE_InternationalPriorityService</option>
											<option value="IE_SwiftPostExpressInternational">IE_SwiftPostExpressInternational</option>
											<option value="IE_SwiftPostInternational">IE_SwiftPostInternational</option>
											<option value="IE_EMSSDSCourierInternational">IE_EMSSDSCourierInternational</option>
											<option value="IE_EconomySDSCourierInternational">IE_EconomySDSCourierInternational</option>
											<option value="IE_OtherCourierInternational">IE_OtherCourierInternational</option>
											<option value="IE_CollectionInPersonInternational">IE_CollectionInPersonInternational</option>
											<option value="IE_EconomyDeliveryFromAbroad">IE_EconomyDeliveryFromAbroad</option>
											<option value="IE_StandardDeliveryFromAbroad">IE_StandardDeliveryFromAbroad</option>
											<option value="IE_ExpressDeliveryFromAbroad">IE_ExpressDeliveryFromAbroad</option>
											<option value="IE_TrackedDeliveryFromAbroad">IE_TrackedDeliveryFromAbroad</option>
											<option value="PL_DomesticRegular">PL_DomesticRegular</option>
											<option value="PL_DomesticSpecial">PL_DomesticSpecial</option>
											<option value="PL_EconomyDeliveryFromAbroad">PL_EconomyDeliveryFromAbroad</option>
											<option value="PL_StandardDeliveryFromAbroad">PL_StandardDeliveryFromAbroad</option>
											<option value="PL_ExpressDeliveryFromAbroad">PL_ExpressDeliveryFromAbroad</option>
											<option value="PL_TrackedDeliveryFromAbroad">PL_TrackedDeliveryFromAbroad</option>
											<option value="FreightShipping">FreightShipping</option>
											<option value="FreightOtherShipping">FreightOtherShipping</option>
											<option value="Freight">Freight</option>
											<option value="FreightShippingInternational">FreightShippingInternational</option>
											<option value="USPSGround">USPSGround</option>
											<option value="ShippingMethodOvernight">ShippingMethodOvernight</option>
											<option value="CustomCode">CustomCode</option>
											<option value="USPSPriorityFlatRateEnvelope">USPSPriorityFlatRateEnvelope</option>
											<option value="USPSPriorityFlatRateBox">USPSPriorityFlatRateBox</option>
											<option value="USPSGlobalPrioritySmallEnvelope">USPSGlobalPrioritySmallEnvelope</option>
											<option value="USPSGlobalPriorityLargeEnvelope">USPSGlobalPriorityLargeEnvelope</option>
											<option value="USPSExpressFlatRateEnvelope">USPSExpressFlatRateEnvelope</option>
											<option value="UPSWorldWideExpressBox10kg">UPSWorldWideExpressBox10kg</option>
											<option value="UPSWorldWideExpressBox25kg">UPSWorldWideExpressBox25kg</option>
											<option value="UPSWorldWideExpressPlusBox10kg">UPSWorldWideExpressPlusBox10kg</option>
											<option value="UPSWorldWideExpressPlusBox25kg">UPSWorldWideExpressPlusBox25kg</option>
											<option value="HK_LocalPickUpOnly">HK_LocalPickUpOnly</option>
											<option value="HK_LocalCourier">HK_LocalCourier</option>
											<option value="HK_DomesticRegularShipping">HK_DomesticRegularShipping</option>
											<option value="HK_DomesticSpecialShipping">HK_DomesticSpecialShipping</option>
											<option value="HK_InternationalRegularShipping">HK_InternationalRegularShipping</option>
											<option value="HK_InternationalSpecialShipping">HK_InternationalSpecialShipping</option>
											<option value="SG_LocalPickUpOnly">SG_LocalPickUpOnly</option>
											<option value="SG_LocalCourier">SG_LocalCourier</option>
											<option value="SG_DomesticStandardMail">SG_DomesticStandardMail</option>
											<option value="SG_DomesticNonStandardMail">SG_DomesticNonStandardMail</option>
											<option value="SG_DomesticSpeedpostIslandwide">SG_DomesticSpeedpostIslandwide</option>
											<option value="SG_InternationalStandardMail">SG_InternationalStandardMail</option>
											<option value="SG_InternationalExpressMailService">SG_InternationalExpressMailService</option>
											<option value="SG_InternationalCourier">SG_InternationalCourier</option>
											<option value="BENL_DePostZendingNONPRIOR">BENL_DePostZendingNONPRIOR</option>
											<option value="BENL_DePostZendingPRIOR">BENL_DePostZendingPRIOR</option>
											<option value="BENL_DePostZendingAangetekend">BENL_DePostZendingAangetekend</option>
											<option value="BENL_KilopostPakje">BENL_KilopostPakje</option>
											<option value="BENL_Taxipost">BENL_Taxipost</option>
											<option value="BENL_KialaAfhaalpunt">BENL_KialaAfhaalpunt</option>
											<option value="BENL_VasteKostenStandaardVerzending">BENL_VasteKostenStandaardVerzending</option>
											<option value="BENL_VasteKostenVersneldeVerzending">BENL_VasteKostenVersneldeVerzending</option>
											<option value="BENL_VerzekerdeVerzending">BENL_VerzekerdeVerzending</option>
											<option value="BEFR_LaPosteEnvoiNONPRIOR">BEFR_LaPosteEnvoiNONPRIOR</option>
											<option value="BEFR_LaPosteEnvoiPRIOR">BEFR_LaPosteEnvoiPRIOR</option>
											<option value="BEFR_LaPosteEnvoiRecommande">BEFR_LaPosteEnvoiRecommande</option>
											<option value="BEFR_PaquetKilopost">BEFR_PaquetKilopost</option>
											<option value="BEFR_Taxipost">BEFR_Taxipost</option>
											<option value="BEFR_PointRetraitKiala">BEFR_PointRetraitKiala</option>
											<option value="BEFR_LivraisonStandardPrixforFaitaire">BEFR_LivraisonStandardPrixforFaitaire</option>
											<option value="BEFR_LivraisonExpressPrixforFaitaire">BEFR_LivraisonExpressPrixforFaitaire</option>
											<option value="BEFR_LivraisonSecurise">BEFR_LivraisonSecurise</option>
											<option value="BENL_DePostZendingPRIORInternational">BENL_DePostZendingPRIORInternational</option>
											<option value="BENL_DePostZendingNONPRIORInternational">BENL_DePostZendingNONPRIORInternational</option>
											<option value="BENL_DePostZendingAangetekendInternational">BENL_DePostZendingAangetekendInternational</option>
											<option value="BENL_KilopostPakjeInternational">BENL_KilopostPakjeInternational</option>
											<option value="BENL_TaxipostExpressverzending">BENL_TaxipostExpressverzending</option>
											<option value="BENL_VerzekerdeVerzendingInternational">BENL_VerzekerdeVerzendingInternational</option>
											<option value="BEFR_LaPosteenvoiePRIOR">BEFR_LaPosteenvoiePRIOR</option>
											<option value="BEFR_LaPosteenvoieNONPRIOR">BEFR_LaPosteenvoieNONPRIOR</option>
											<option value="BEFR_LaPosteenvoieRecommande">BEFR_LaPosteenvoieRecommande</option>
											<option value="BEFR_PaquetKilopostInternationale">BEFR_PaquetKilopostInternationale</option>
											<option value="BEFR_ExpressTaxipost">BEFR_ExpressTaxipost</option>
											<option value="BEFR_LivraisonStandardInternationalePrixforFaitaire">BEFR_LivraisonStandardInternationalePrixforFaitaire</option>
											<option value="BEFR_LivraisonExpressInternationalePrixforFaitaire">BEFR_LivraisonExpressInternationalePrixforFaitaire</option>
											<option value="BEFR_LivraisonSecuriseInternational">BEFR_LivraisonSecuriseInternational</option>
											<option value="FR_Chronopost">FR_Chronopost</option>
											<option value="UK_RoyalMailSpecialDeliveryNextDay">UK_RoyalMailSpecialDeliveryNextDay</option>
											<option value="CA_PostLightPacketInternational">CA_PostLightPacketInternational</option>
											<option value="CA_PostLightPacketUSA">CA_PostLightPacketUSA</option>
											<option value="PL_DHLInternational">PL_DHLInternational</option>
											<option value="PL_InternationalRegular">PL_InternationalRegular</option>
											<option value="PL_InternationalSpecial">PL_InternationalSpecial</option>
											<option value="PL_UPSInternational">PL_UPSInternational</option>
											<option value="CAFR_StandardDelivery">CAFR_StandardDelivery</option>
											<option value="CAFR_ExpeditedDelivery">CAFR_ExpeditedDelivery</option>
											<option value="CAFR_PostLettermail">CAFR_PostLettermail</option>
											<option value="CAFR_PostRegularParcel">CAFR_PostRegularParcel</option>
											<option value="CAFR_PostExpeditedParcel">CAFR_PostExpeditedParcel</option>
											<option value="CAFR_PostXpresspost">CAFR_PostXpresspost</option>
											<option value="CAFR_PostPriorityCourier">CAFR_PostPriorityCourier</option>
											<option value="CAFR_StandardInternational">CAFR_StandardInternational</option>
											<option value="CAFR_ExpeditedInternational">CAFR_ExpeditedInternational</option>
											<option value="CAFR_OtherInternational">CAFR_OtherInternational</option>
											<option value="CAFR_PostExpeditedParcelUSA">CAFR_PostExpeditedParcelUSA</option>
											<option value="CAFR_PostSmallPacketsUSA">CAFR_PostSmallPacketsUSA</option>
											<option value="CAFR_PostXpresspostUSA">CAFR_PostXpresspostUSA</option>
											<option value="CAFR_PostXpresspostInternational">CAFR_PostXpresspostInternational</option>
											<option value="CAFR_PostInternationalParcelSurface">CAFR_PostInternationalParcelSurface</option>
											<option value="CAFR_PostInternationalParcelAir">CAFR_PostInternationalParcelAir</option>
											<option value="CAFR_SmallPacketsInternational">CAFR_SmallPacketsInternational</option>
											<option value="CAFR_PurolatorInternational">CAFR_PurolatorInternational</option>
											<option value="CAFR_PostSmallPacketsUSAGround">CAFR_PostSmallPacketsUSAGround</option>
											<option value="CAFR_PostSmallPacketsUSAAir">CAFR_PostSmallPacketsUSAAir</option>
											<option value="CAFR_SmallPacketsInternationalGround">CAFR_SmallPacketsInternationalGround</option>
											<option value="CAFR_SmallPacketsInternationalAir">CAFR_SmallPacketsInternationalAir</option>
											<option value="CAFR_PostUSALetterPost">CAFR_PostUSALetterPost</option>
											<option value="CAFR_PostInternationalLetterPost">CAFR_PostInternationalLetterPost</option>
											<option value="CAFR_UPSExpressCanada">CAFR_UPSExpressCanada</option>
											<option value="CAFR_UPSExpressSaverCanada">CAFR_UPSExpressSaverCanada</option>
											<option value="CAFR_UPSExpeditedCanada">CAFR_UPSExpeditedCanada</option>
											<option value="CAFR_UPSStandardCanada">CAFR_UPSStandardCanada</option>
											<option value="CAFR_UPSExpressUnitedStates">CAFR_UPSExpressUnitedStates</option>
											<option value="CAFR_UPSExpeditedUnitedStates">CAFR_UPSExpeditedUnitedStates</option>
											<option value="CAFR_UPS3DaySelectUnitedStates">CAFR_UPS3DaySelectUnitedStates</option>
											<option value="CAFR_UPSStandardUnitedStates">CAFR_UPSStandardUnitedStates</option>
											<option value="CAFR_UPSWorldWideExpress">CAFR_UPSWorldWideExpress</option>
											<option value="CAFR_UPSWorldWideExpedited">CAFR_UPSWorldWideExpedited</option>
											<option value="UK_RoyalMailSpecialDelivery9am">UK_RoyalMailSpecialDelivery9am</option>
											<option value="USPSFirstClassMailInternational">USPSFirstClassMailInternational</option>
											<option value="USPSPriorityMailInternational">USPSPriorityMailInternational</option>
											<option value="USPSExpressMailInternational">USPSExpressMailInternational</option>
											<option value="CH_StandardInternational">CH_StandardInternational</option>
											<option value="CH_ExpeditedInternational">CH_ExpeditedInternational</option>
											<option value="CH_SonstigerVersandSieheArtikelbeschreibung">CH_SonstigerVersandSieheArtikelbeschreibung</option>
											<option value="TW_StandardInternationalFixedRate">TW_StandardInternationalFixedRate</option>
											<option value="TW_ExpeditedInternationalFixedRate">TW_ExpeditedInternationalFixedRate</option>
											<option value="USPSGlobalExpressGuaranteed">USPSGlobalExpressGuaranteed</option>
											<option value="AU_RegularWithInsurance">AU_RegularWithInsurance</option>
											<option value="AU_ExpressWithInsurance">AU_ExpressWithInsurance</option>
											<option value="DE_DeutschePostWarensendungInternational">DE_DeutschePostWarensendungInternational</option>
											<option value="DE_DeutschePostByendung">DE_DeutschePostByendung</option>
											<option value="DE_HermesPaketUnversichertInternational">DE_HermesPaketUnversichertInternational</option>
											<option value="DE_HermesPaketVersichertInternational">DE_HermesPaketVersichertInternational</option>
											<option value="DE_iLoxxTransportXXLInternational">DE_iLoxxTransportXXLInternational</option>
											<option value="DE_iLoxxUbernachtExpressInternational">DE_iLoxxUbernachtExpressInternational</option>
											<option value="DE_iLoxxStandardInternational">DE_iLoxxStandardInternational</option>
											<option value="DE_StandardInternational">DE_StandardInternational</option>
											<option value="DE_ExpeditedInternational">DE_ExpeditedInternational</option>
											<option value="DE_DeutschePostBriefIntlEcon">DE_DeutschePostBriefIntlEcon</option>
											<option value="DE_DeutschePostBriefIntlPri">DE_DeutschePostBriefIntlPri</option>
											<option value="AT_BitteTreffenSieEineAuswahl">AT_BitteTreffenSieEineAuswahl</option>
											<option value="AT_EinschreibenVersandInklEinschreibengebuhr">AT_EinschreibenVersandInklEinschreibengebuhr</option>
											<option value="AT_NachnahmeVersandInklNachnahmegebuhr">AT_NachnahmeVersandInklNachnahmegebuhr</option>
											<option value="AT_ExpressOrCourierInternational">AT_ExpressOrCourierInternational</option>
											<option value="AT_InsuredExpressOrCourierInternational">AT_InsuredExpressOrCourierInternational</option>
											<option value="AT_SpecialDispatchInternational">AT_SpecialDispatchInternational</option>
											<option value="AT_InsuredSpecialDispatchInternational">AT_InsuredSpecialDispatchInternational</option>
											<option value="AT_StandardInternational">AT_StandardInternational</option>
											<option value="AT_ExpeditedInternational">AT_ExpeditedInternational</option>
											<option value="AT_OtherInternationalShipping">AT_OtherInternationalShipping</option>
											<option value="CH_BitteTreffenSieEineAuswahl">CH_BitteTreffenSieEineAuswahl</option>
											<option value="CH_UnversicherterVersand">CH_UnversicherterVersand</option>
											<option value="CH_VersicherterVersand">CH_VersicherterVersand</option>
											<option value="CH_EinschreibenVersandInklEinschreibengebuhr">CH_EinschreibenVersandInklEinschreibengebuhr</option>
											<option value="CH_NachnahmeVersandInklNachnahmegebuhr">CH_NachnahmeVersandInklNachnahmegebuhr</option>
											<option value="CH_ExpressOrCourierInternational">CH_ExpressOrCourierInternational</option>
											<option value="CH_InsuredExpressOrCourierInternational">CH_InsuredExpressOrCourierInternational</option>
											<option value="CH_SonderversandZBSperrgutKFZ">CH_SonderversandZBSperrgutKFZ</option>
											<option value="CH_VersicherterSonderversandZBSperrgutKFZ">CH_VersicherterSonderversandZBSperrgutKFZ</option>
											<option value="CH_StandardversandAPostPriority">CH_StandardversandAPostPriority</option>
											<option value="CH_StandardversandBPostEconomy">CH_StandardversandBPostEconomy</option>
											<option value="DE_BitteTreffenSieEineAuswahl">DE_BitteTreffenSieEineAuswahl</option>
											<option value="DE_EinschreibenVersandInklEinschreibengebuhr">DE_EinschreibenVersandInklEinschreibengebuhr</option>
											<option value="DE_NachnahmeVersandInklNachnahmegebuhr">DE_NachnahmeVersandInklNachnahmegebuhr</option>
											<option value="DE_ExpressOrCourierInternational">DE_ExpressOrCourierInternational</option>
											<option value="DE_InsuredExpressOrCourierInternational">DE_InsuredExpressOrCourierInternational</option>
											<option value="DE_SonderversandZBMobelKFZ">DE_SonderversandZBMobelKFZ</option>
											<option value="DE_VersicherterSonderversandZBMobelKFZ">DE_VersicherterSonderversandZBMobelKFZ</option>
											<option value="DE_DeutschePostBriefInternational">DE_DeutschePostBriefInternational</option>
											<option value="IE_StandardInternationalFlatRatePostage">IE_StandardInternationalFlatRatePostage</option>
											<option value="IE_ExpeditedInternationalFlatRatePostage">IE_ExpeditedInternationalFlatRatePostage</option>
											<option value="IE_OtherInternationalPostage">IE_OtherInternationalPostage</option>
											<option value="UK_StandardInternationalFlatRatePostage">UK_StandardInternationalFlatRatePostage</option>
											<option value="UK_ExpeditedInternationalFlatRatePostage">UK_ExpeditedInternationalFlatRatePostage</option>
											<option value="UK_OtherInternationalPostage">UK_OtherInternationalPostage</option>
											<option value="FR_ChronopostChronoRelais">FR_ChronopostChronoRelais</option>
											<option value="FR_Chrono10">FR_Chrono10</option>
											<option value="FR_Chrono13">FR_Chrono13</option>
											<option value="FR_Chrono18">FR_Chrono18</option>
											<option value="FR_ChronopostExpressInternational">FR_ChronopostExpressInternational</option>
											<option value="Pickup">Pickup</option>
											<option value="Delivery">Delivery</option>
											<option value="CA_Pickup">CA_Pickup</option>
											<option value="DE_Pickup">DE_Pickup</option>
											<option value="AU_Pickup">AU_Pickup</option>
											<option value="AU_SmallParcels">AU_SmallParcels</option>
											<option value="AU_SmallParcelWithTracking">AU_SmallParcelWithTracking</option>
											<option value="AU_SmallParcelWithTrackingAndSignature">AU_SmallParcelWithTrackingAndSignature</option>
											<option value="AU_RegularParcelWithTracking">AU_RegularParcelWithTracking</option>
											<option value="AU_RegularParcelWithTrackingAndSignature">AU_RegularParcelWithTrackingAndSignature</option>
											<option value="AU_PrePaidExpressPostSatchel5kg">AU_PrePaidExpressPostSatchel5kg</option>
											<option value="AU_PrePaidParcelPostSatchels500g">AU_PrePaidParcelPostSatchels500g</option>
											<option value="AU_PrePaidParcelPostSatchels3kg">AU_PrePaidParcelPostSatchels3kg</option>
											<option value="AU_PrePaidParcelPostSatchels5kg">AU_PrePaidParcelPostSatchels5kg</option>
											<option value="AU_PrePaidExpressPostSatchel500g">AU_PrePaidExpressPostSatchel500g</option>
											<option value="AU_PrePaidExpressPostSatchel3kg">AU_PrePaidExpressPostSatchel3kg</option>
											<option value="AU_PrePaidExpressPostPlatinum500g">AU_PrePaidExpressPostPlatinum500g</option>
											<option value="AU_PrePaidExpressPostPlatinum3kg">AU_PrePaidExpressPostPlatinum3kg</option>
											<option value="AU_ExpressCourierInternational">AU_ExpressCourierInternational</option>
											<option value="AU_ExpressPostInternational">AU_ExpressPostInternational</option>
											<option value="AU_PrePaidExpressPostInternationalEnvelopeC5">AU_PrePaidExpressPostInternationalEnvelopeC5</option>
											<option value="AU_PrePaidExpressPostInternationalEnvelopeB4">AU_PrePaidExpressPostInternationalEnvelopeB4</option>
											<option value="AU_PrePaidExpressPostInternationalSatchels2kg">AU_PrePaidExpressPostInternationalSatchels2kg</option>
											<option value="AU_PrePaidExpressPostInternationalSatchels3kg">AU_PrePaidExpressPostInternationalSatchels3kg</option>
											<option value="AU_PrePaidExpressPostInternationalBox5kg">AU_PrePaidExpressPostInternationalBox5kg</option>
											<option value="AU_PrePaidExpressPostInternationalBox10kg">AU_PrePaidExpressPostInternationalBox10kg</option>
											<option value="AU_PrePaidExpressPostInternationalBox20kg">AU_PrePaidExpressPostInternationalBox20kg</option>
											<option value="AU_RegisteredParcelPost">AU_RegisteredParcelPost</option>
											<option value="AU_RegisteredSmallParcel">AU_RegisteredSmallParcel</option>
											<option value="AU_RegisteredParcelPostPrepaidSatchel500g">AU_RegisteredParcelPostPrepaidSatchel500g</option>
											<option value="AU_RegisteredParcelPostPrepaidSatchel3kg">AU_RegisteredParcelPostPrepaidSatchel3kg</option>
											<option value="AU_RegisteredParcelPostPrepaidSatchel5kg">AU_RegisteredParcelPostPrepaidSatchel5kg</option>
											<option value="AU_ExpressPostSatchel500g">AU_ExpressPostSatchel500g</option>
											<option value="AU_ExpressPostSatchel3kg">AU_ExpressPostSatchel3kg</option>
											<option value="FR_Pickup">FR_Pickup</option>
											<option value="AT_Pickup">AT_Pickup</option>
											<option value="BENL_Pickup">BENL_Pickup</option>
											<option value="BEFR_Pickup">BEFR_Pickup</option>
											<option value="CH_Pickup">CH_Pickup</option>
											<option value="IT_Pickup">IT_Pickup</option>
											<option value="NL_Pickup">NL_Pickup</option>
											<option value="PL_Pickup">PL_Pickup</option>
											<option value="ES_Pickup">ES_Pickup</option>
											<option value="SG_Delivery">SG_Delivery</option>
											<option value="UK_OtherCourier24">UK_OtherCourier24</option>
											<option value="UK_OtherCourier48">UK_OtherCourier48</option>
											<option value="UK_OtherCourier3Days">UK_OtherCourier3Days</option>
											<option value="UK_OtherCourier5Days">UK_OtherCourier5Days</option>
											<option value="Courier">Courier</option>
											<option value="FedExPriorityOvernight">FedExPriorityOvernight</option>
											<option value="FedExStandardOvernight">FedExStandardOvernight</option>
											<option value="FedEx2Day">FedEx2Day</option>
											<option value="FedExGround">FedExGround</option>
											<option value="FedExHomeDelivery">FedExHomeDelivery</option>
											<option value="FedExExpressSaver">FedExExpressSaver</option>
											<option value="FedExGroundDisabled">FedExGroundDisabled</option>
											<option value="FedExHomeDeliveryDisabled">FedExHomeDeliveryDisabled</option>
											<option value="FedExInternationalFirst">FedExInternationalFirst</option>
											<option value="FedExInternationalPriority">FedExInternationalPriority</option>
											<option value="FedExInternationalEconomy">FedExInternationalEconomy</option>
											<option value="FedExInternationalGround">FedExInternationalGround</option>
											<option value="EconomyShippingFromOutsideUS">EconomyShippingFromOutsideUS</option>
											<option value="ExpeditedShippingFromOutsideUS">ExpeditedShippingFromOutsideUS</option>
											<option value="StandardShippingFromOutsideUS">StandardShippingFromOutsideUS</option>
											<option value="UK_EconomyShippingFromOutside">UK_EconomyShippingFromOutside</option>
											<option value="UK_ExpeditedShippingFromOutside">UK_ExpeditedShippingFromOutside</option>
											<option value="UK_StandardShippingFromOutside">UK_StandardShippingFromOutside</option>
											<option value="DE_SparversandAusDemAusland">DE_SparversandAusDemAusland</option>
											<option value="DE_StandardversandAusDemAusland">DE_StandardversandAusDemAusland</option>
											<option value="DE_ExpressversandAusDemAusland">DE_ExpressversandAusDemAusland</option>
											<option value="DE_DHL2KGPaket">DE_DHL2KGPaket</option>
											<option value="InternationalPriorityShipping">InternationalPriorityShipping</option>
											<option value="SameDayShipping">SameDayShipping</option>
											<option value="UK_RoyalMailNextDay">UK_RoyalMailNextDay</option>
											<option value="UK_RoyalMailTracked">UK_RoyalMailTracked</option>
											<option value="eBayNowImmediateDelivery">eBayNowImmediateDelivery</option>
				                   		</select> <br>
				                   		<span>Shipping Service Cost</span> <br>
				                   		<input type="number" value="1" class="shipping-service-cost"> <br>
				                   		<span>Shipping Service Addition Cost</span> <br>
				                   		<input type="number" value="1" class="shipping-addition-cost"> <br>
				                   		<span>Shipping Insurance Cost</span> <br>
				                   		<input type="number" value="1" class="shipping-isurance-cost"> <br>
				                   </fieldset>
				                   <hr>
				                </div> 
					        </div>
						</section>
						
						<!-- The add other detail part -->
						<section> 
							<div class="panel panel-default">
				                <div class="panel-heading">
				                    <b>Return policy details</b>
				                </div>
				                <div class="panel-body">
				                  <table>
				                   	<thead>
				                   		<th> </th>
				                   		<th> </th>
				                   	</thead>
				                   	<tbody>
				                   		<!-- 
				                   		<tr> 
				                   			<td>
				                   				Sales tax <br>
				                   				<input type="checkbox" /> <span>Also apply to shipping and handling costs</span> <br>
				                   				Return policy <br>
				                   				We now require that all sellers specify whether they accept returns or not. <br> 
				                   				
				                   			 </td>
				                   			<td> </td>
				                   		</tr>
				                   		 -->
				                   		<tr>
				                   			<td>
				                   				<fieldset class="ebay-fieldset">
				                   					<legend>
				                   						<select id="select-return-accept-option">
				                   							<option value="ReturnsAccepted" selected="">Returns Accepted</option>
				                   							<option value="ReturnsAccepted" selected="">Returns Accepted</option>
				                   							<option value="ReturnsNotAccepted">No returns accepted</option>
				                   							<option value="ReturnsNotAccepted">No returns accepted</option>
				                   						</select>
				                   					</legend>
				                   					<table>
				                   						<thead>
				                   							<th> </th>
				                   							<th> </th>
				                   						</thead>
				                   						<tbody>
				                   							<tr>
				                   								<td>After receiving the item, your buyer should start a return within <br>
				                   									<select id="select-return-within-option" name="itemReturnedWithin" title="After receiving the item, your buyer should start a return within:">
																	   <option value="Days_14" selected="">14 Days</option>
																	   <option value="Days_30">30 Days</option>
																	   <option value="Days_60">60 Days</option>
																	</select>
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
				                   							<tr>
				                   								<td>Refund will be given as <br>
				                   									<select id="select-refund" name="refundGivenAs" title="Refund will be given as">
																	   <option value="MoneyBack" selected="">Money Back</option>
																	   <option value="MoneyBackOrReplacement">Money back or replacement (buyer's choice)</option>
																	   <option value="MoneyBackOrExchange">Money back or exchange (buyer's choice)</option>
																	</select>
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
				                   							<tr>
				                   								<td>Return shipping will be paid by<br>
				                   									<select id="select-return-by-paid" name="returnsPaidBy" title="Return shipping will be paid by">
																	   <option value="Buyer" selected="">Buyer</option>
																	   <option value="Seller">Seller</option>
																	</select> <br>
																	<!-- 
																	If your buyer returns this item because the item is not as described in the listing, you'll be charged return shipping on your seller invoice as a fee, which may be charged to your automatic payment method on file, if any.<br>
																	 -->
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
				                   							<!-- 
				                   							<tr>
				                   								<td>
				                   									Do you want to charge a restocking fee? <br>
				                   									<select id="restockingFeeValue" name="restockingFeeValue" title="Do you want to charge a restocking fee?">
																	   <option value="NoRestockingFee" selected="">No</option>
																	   <option value="Percent_10">10%</option>
																	   <option value="Percent_15">15%</option>
																	   <option value="Percent_20">20%</option>
																	</select> <br>
																	Additional return policy details <br>
				                   								 </td>
				                   								<td> </td>
				                   							</tr>
				                   							<tr>
				                   								<td>
				                   									Make sure these additional details and your listing description match what you picked above <br>
				                   									<textarea col="40" row="20">
				                   									</textarea>
				                   								</td>
				                   								<td></td>
				                   							</tr>
				                   							 -->
				                   						</tbody>
				                   					</table>			                   									                   					 
				                   				</fieldset>
				                   		    </td>
				                   			<td> </td>
				                   		</tr> 
				                   	</tbody>
				                   </table>
				                </div> 
					        </div>
						</section>
						</div>
								
						<!-- The footer part -->
						<footer>
							<button type="submit" class="btn btn-primary" id="btnAddEbayItem">Submit</button>
							<button type="button" class="btn btn-default" id="btnBackHistory">Back</button>
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
					validate(function(){
						addItem();
					});
				});
				
				$("#btnBackHistory").on("click",function(evt){
					if(confirm("Are you sure to go back?")){
						window.history.back();
					}
				});
				
				$("#use-paypal-email").on("change",function(evt){
					if($("#use-paypal-email").is(":checked")){
						$("#paypal-email").attr('readonly', false);
					}else{
						$("#paypal-email").val("");
						$("#paypal-email").attr('readonly', true);
					}
				});
				
				function addItem(){
					var token = $("meta[name='_csrf']").attr("content");
				    var header = $("meta[name='_csrf_header']").attr("content");
				    
				    var title = $("#product_title").val();
				    var categoryId = $("#categories").find("select").last().find("option[isleafcategory=true]:selected").attr("id");
				    var conditionID =$("#itemCondition").val();
				    var description =$("#cke_ckEditorForDescription").find(".cke_inner .cke_reset")
					  .find("iframe")
					  .contents()[0]
					  .documentElement
					  .getElementsByTagName("body")[0].innerHTML;  
				    
				   //Paypal email
				   var paypalEmail = "";
				   if($("#use-paypal-email").is(":checked")){
					   paypalEmail = $("#paypal-email").val();
				   }
				    
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
	                    data:JSON.stringify({
	                    	title:title,
	                    	description:description,
	                    	categoryId:categoryId,
	                    	conditionId:conditionID,
	                    	startPrice:$("#startingPrice").val(),
	                    	reservePrice:$("#reservePrice").val(),
	                    	buyNowPrice:$("#buyNowPrice").val(),
	                    	paypalEmail:paypalEmail,
	                    	quantity:$("#quantity").val(),
	                    	listingDuration:$("#duration").val(),
	                    	returnPolicyDto:{
	                    		refund:$("#select-refund").val(),
	                    		returnsWithinOption:$("#select-return-within-option").val(),
	                    		returnsAcceptedOption:$("#select-return-accept-option").val(),
	                    		shippingCostPaidByOption:$("#select-return-by-paid").val(),
	                    	},
	                    	shippingDetailDto:{
	                    		isuranceOption:$("#select-isurance-option").val(),
	                    		paymentInstruction:$("#payment-instructions").val(),
	                    		shippingType:$("#select-shipping-type").val(),
	                    		listOfShippingServiceOption:getListShippingOptionDto()
	                    	}
	                    }),
	                    contentType: "application/json",
	                    mimeType: 'application/json',
	                    dataType: "json",
	                    success: function(respData){
	                        if(respData.status==="OK"){
	                        	alert(respData.msg)
	                        }else{
	                        	alert(respData.cause);
	                        }
	                    },
	                    error:function(evt){
	                    	console.log(evt);
	                    }
	                });  
				}
				
				$("#add-shipping-service-option").on("click",function(evt){
					evt.preventDefault();
					var prev = $(".panel-shipping-service-option").last();
					var nextIndex= parseInt(prev.attr("data-index")) +1;
					var addition = prev.clone()
					addition.find("legend").text("Shipping Service Option "+nextIndex);
					addition.attr("data-index",nextIndex);
					addition.appendTo(prev.parent());
					$(this).remove();
				});
				
				function getListShippingOptionDto(){ 
					return $.map($(".panel-shipping-service-option"),function(val,index){
						var shippingMethod = $(val).find(".select-shipping-method-code-type").val();
						var shippingServiceCost = $(val).find(".shipping-service-cost").val();
						var shippingAddtionCost = $(val).find(".shipping-addition-cost").val();
						var shippingIsuranceCost = $(val).find(".shipping-isurance-cost").val(); 
						return {
							shippingMethodType:shippingMethod,
							shippingServiceCost:shippingServiceCost,
							shippingServiceAddtionalCost:shippingAddtionCost,
							shippingInsuranceCost:shippingIsuranceCost
						};						
					})
					
				}
				
				function validate(onValidateSuccessCallBack){
					if($("#product_title").val()===""){
				        alert("Empty title");
				        return;
					}
					
					var selectedCategory =$("#categories").find("select").last().find("option[isleafcategory=true]:selected").attr("id");
					if(!selectedCategory){
						alert("You must select left category")
						return;
					} 
	
					if($("#itemCondition").val()==="-1"){
					        alert("You must select condition!");
					        return;
					} 
					
					if($("#quantity").val()===""){
					        alert("You must enter quantity!");
					        return;
					}else{
						if(parseInt($("#quantity").val())<=0){
							alert("The quantity must be greater than zero ");
							return;
						}
					} 
					
					if($("#startingPrice").val()===""){
						alert("You must enter the starting price")
						return;
					}else{
						if(parseInt($("#startingPrice").val())<0){
							alert("Starting price must greater than zero")
							return;
						} 
					}
					
					if($("#reservePrice").val()!==""){
						if(parseInt($("#reservePrice").val())<0){
							alert("Reserve price must greater than zero")
							return;
						}else{
							if(parseInt($("#startingPrice").val())>=parseInt($("#reservePrice").val())){
								alert("The starting price must less than reserve price");
								return;
							}
						}
					}
					
					if($("#buyNowPrice").val()===""){
						alert("You must enter the buy it now price")
						return;
					}else{
						if(parseInt($("#buyNowPrice").val())<0){
							alert("Buy It Now price must greater than zero")
							return;
						} 
					}
					
					if(parseInt($("#buyNowPrice").val() <parseInt($("#startingPrice").val()))){
						alert("Buy it now price must greater than starting price!")
						return;
					}
					
					if($("#use-paypal-email").is(":checked")){
						if($("#paypal-email").val()===""){
							alert("You must enter the paypal email");
							return;
						}else{
							if(!$.trim($("#paypal-email").val()).match(/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/)){
								alert("Paypal Email not correct form!")
								return;
							}
						}
					}
					
					if($("#payment-instructions").val()===""){
						alert("You must enter the payment instruction!")
						return;
					}
					
					//Validate the shipping service option
					var listOfShippingMethodType = $(".select-shipping-method-code-type");
					var originLength = listOfShippingMethodType.size();
					var mapToValue = $.map(listOfShippingMethodType,function(val,i){return $(val).val()});
					var uniqueValue = $.unique(mapToValue);
					var validateLength = uniqueValue.length;
					if(originLength!==validateLength){
						alert("The shipping method type must be different from each other");
						return;
					}
					
					onValidateSuccessCallBack();
				}
			});
		</script>
		
		<!-- EMBED CKEDITOR(napt2017) -->
		<script src="${pageContext.request.contextPath}/resources/js/plugin/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(function(){  
				CKEDITOR.replace("ckEditorForDescription"); 
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