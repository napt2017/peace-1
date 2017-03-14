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
								
								<!-- The add item specific part -->
								<section> 
									<fieldset class="ebay-fieldset">
										<legend>Add item specifics</legend>
										<p>Buyers often refine their search using these item specifics. If you don't provide these details here, your listing may not appear in their search results.</p>
										<table>
											<thead>
												<th>
													<td> </td>
													<td></td> 
												</th>
											</thead>
											<tbody>
												<!-- UPC -->
												<tr>
													<td> <b>UPC</b> </td> <td> </td> 
												</tr>
												<tr>
													<td> <input type="text" > </td> <td> </td> 
												</tr>
												
												<!-- Brand -->
												<tr>
													<td> <b>Brand</b> </td> <td> </td> 
												</tr>
												<tr>
													<td>
														<select id="select-">
															<option>Unbranded/Generic</option>
															<option>3M</option>
															<option>Aeroquip</option>
															<option>Aftermarket</option>
															<option>Alemite</option>
															<option>Allis-Chalmers</option>
															<option>Amco</option>
															<option>Amoco</option>
															<option>Anchor</option>
															<option>Anderson</option>
														</select> 
													</td> 
												</tr>
												
												<!-- Model -->
												<tr>
													<td> <b>Model</b> </td> <td> </td> 
												</tr>
												<tr>
													<td> <input type="text" > </td> <td> </td> 
												</tr>
												
												<!-- MPN -->
												<tr>
													<td> <b>MPN</b> <br/>Enter the manufacturer's part number to optimize your listing for internet search engines </td> <td> </td> 
												</tr>
												<tr>
													<td>
														<select id="select-">
															<option> Does not apply</option>
															<option> Enter your own</option>
														</select> 
													</td> <td> </td> 
												</tr>
												
												<!-- UPC -->
												<tr>
													<td> <b>Country/Region of Manufacture</b> <br> Specifying the country/region of manufacture can help streamline customs clearance. </td> <td> </td> 
												</tr>
												<tr>
													<td>
														<select name="st_selval_0_3" id="st_selval_0_3" autocomplete="off" aria-required="true">
														   <option value="-" selected="selected">-</option>
														   <option value="Unknown">Unknown</option>
														   <option value="Afghanistan">Afghanistan</option>
														   <option value="Albania">Albania</option>
														   <option value="Algeria">Algeria</option>
														   <option value="American Samoa">American Samoa</option>
														   <option value="Andorra">Andorra</option>
														   <option value="Angola">Angola</option>
														   <option value="Anguilla">Anguilla</option>
														   <option value="Antarctica">Antarctica</option>
														   <option value="Antigua and Barbuda">Antigua and Barbuda</option>
														   <option value="Argentina">Argentina</option>
														   <option value="Armenia">Armenia</option>
														   <option value="Aruba">Aruba</option>
														   <option value="Australia">Australia</option>
														   <option value="Austria">Austria</option>
														   <option value="Azerbaijan">Azerbaijan</option>
														   <option value="Bahamas">Bahamas</option>
														   <option value="Bahrain">Bahrain</option>
														   <option value="Bangladesh">Bangladesh</option>
														   <option value="Barbados">Barbados</option>
														   <option value="Belarus">Belarus</option>
														   <option value="Belgium">Belgium</option>
														   <option value="Belize">Belize</option>
														   <option value="Benin">Benin</option>
														   <option value="Bermuda">Bermuda</option>
														   <option value="Bhutan">Bhutan</option>
														   <option value="Bolivia">Bolivia</option>
														   <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
														   <option value="Botswana">Botswana</option>
														   <option value="Bouvet Island">Bouvet Island</option>
														   <option value="Brazil">Brazil</option>
														   <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
														   <option value="Brunei Darussalam">Brunei Darussalam</option>
														   <option value="Bulgaria">Bulgaria</option>
														   <option value="Burkina Faso">Burkina Faso</option>
														   <option value="Burundi">Burundi</option>
														   <option value="Cambodia">Cambodia</option>
														   <option value="Cameroon">Cameroon</option>
														   <option value="Canada">Canada</option>
														   <option value="Cape Verde">Cape Verde</option>
														   <option value="Cayman Islands">Cayman Islands</option>
														   <option value="Central African Republic">Central African Republic</option>
														   <option value="Chad">Chad</option>
														   <option value="Chile">Chile</option>
														   <option value="China">China</option>
														   <option value="Christmas Island">Christmas Island</option>
														   <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
														   <option value="Colombia">Colombia</option>
														   <option value="Comoros">Comoros</option>
														   <option value="Congo">Congo</option>
														   <option value="Congo, The Democratic Republic of the">Congo, The Democratic Republic of the</option>
														   <option value="Cook Islands">Cook Islands</option>
														   <option value="Costa Rica">Costa Rica</option>
														   <option value="Cote d'Ivoire">Cote d'Ivoire</option>
														   <option value="Croatia">Croatia</option>
														   <option value="Cyprus">Cyprus</option>
														   <option value="Czech Republic">Czech Republic</option>
														   <option value="Denmark">Denmark</option>
														   <option value="Djibouti">Djibouti</option>
														   <option value="Dominica">Dominica</option>
														   <option value="Dominican Republic">Dominican Republic</option>
														   <option value="Ecuador">Ecuador</option>
														   <option value="Egypt">Egypt</option>
														   <option value="El Salvador">El Salvador</option>
														   <option value="Equatorial Guinea">Equatorial Guinea</option>
														   <option value="Eritrea">Eritrea</option>
														   <option value="Estonia">Estonia</option>
														   <option value="Ethiopia">Ethiopia</option>
														   <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
														   <option value="Faroe Islands">Faroe Islands</option>
														   <option value="Fiji">Fiji</option>
														   <option value="Finland">Finland</option>
														   <option value="France">France</option>
														   <option value="French Guiana">French Guiana</option>
														   <option value="French Polynesia Includes Tahiti">French Polynesia Includes Tahiti</option>
														   <option value="French Southern Territories">French Southern Territories</option>
														   <option value="Gabon">Gabon</option>
														   <option value="Gambia">Gambia</option>
														   <option value="Georgia">Georgia</option>
														   <option value="Germany">Germany</option>
														   <option value="Ghana">Ghana</option>
														   <option value="Gibraltar">Gibraltar</option>
														   <option value="Greece">Greece</option>
														   <option value="Greenland">Greenland</option>
														   <option value="Grenada">Grenada</option>
														   <option value="Guadeloupe">Guadeloupe</option>
														   <option value="Guam">Guam</option>
														   <option value="Guatemala">Guatemala</option>
														   <option value="Guernsey">Guernsey</option>
														   <option value="Guinea">Guinea</option>
														   <option value="Guinea-Bissau">Guinea-Bissau</option>
														   <option value="Guyana">Guyana</option>
														   <option value="Haiti">Haiti</option>
														   <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
														   <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
														   <option value="Honduras">Honduras</option>
														   <option value="Hong Kong">Hong Kong</option>
														   <option value="Hungary">Hungary</option>
														   <option value="Iceland">Iceland</option>
														   <option value="India">India</option>
														   <option value="Indonesia">Indonesia</option>
														   <option value="Iraq">Iraq</option>
														   <option value="Ireland">Ireland</option>
														   <option value="Israel">Israel</option>
														   <option value="Italy">Italy</option>
														   <option value="Jamaica">Jamaica</option>
														   <option value="Japan">Japan</option>
														   <option value="Jersey">Jersey</option>
														   <option value="Jordan">Jordan</option>
														   <option value="Kazakhstan">Kazakhstan</option>
														   <option value="Kenya">Kenya</option>
														   <option value="Kiribati">Kiribati</option>
														   <option value="Korea, Republic of">Korea, Republic of</option>
														   <option value="Kuwait">Kuwait</option>
														   <option value="Kyrgyzstan">Kyrgyzstan</option>
														   <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
														   <option value="Latvia">Latvia</option>
														   <option value="Lebanon">Lebanon</option>
														   <option value="Lesotho">Lesotho</option>
														   <option value="Liberia">Liberia</option>
														   <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
														   <option value="Liechtenstein">Liechtenstein</option>
														   <option value="Lithuania">Lithuania</option>
														   <option value="Luxembourg">Luxembourg</option>
														   <option value="Macao">Macao</option>
														   <option value="Macedonia, the Former Yugoslav Republic of">Macedonia, the Former Yugoslav Republic of</option>
														   <option value="Madagascar">Madagascar</option>
														   <option value="Malawi">Malawi</option>
														   <option value="Malaysia">Malaysia</option>
														   <option value="Maldives">Maldives</option>
														   <option value="Mali">Mali</option>
														   <option value="Malta">Malta</option>
														   <option value="Marshall Islands">Marshall Islands</option>
														   <option value="Martinique">Martinique</option>
														   <option value="Mauritania">Mauritania</option>
														   <option value="Mauritius">Mauritius</option>
														   <option value="Mayotte">Mayotte</option>
														   <option value="Mexico">Mexico</option>
														   <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
														   <option value="Moldova, Republic of">Moldova, Republic of</option>
														   <option value="Monaco">Monaco</option>
														   <option value="Mongolia">Mongolia</option>
														   <option value="Montenegro">Montenegro</option>
														   <option value="Montserrat">Montserrat</option>
														   <option value="Morocco">Morocco</option>
														   <option value="Mozambique">Mozambique</option>
														   <option value="Namibia">Namibia</option>
														   <option value="Nauru">Nauru</option>
														   <option value="Nepal">Nepal</option>
														   <option value="Netherlands">Netherlands</option>
														   <option value="Netherlands Antilles">Netherlands Antilles</option>
														   <option value="New Caledonia">New Caledonia</option>
														   <option value="New Zealand">New Zealand</option>
														   <option value="Nicaragua">Nicaragua</option>
														   <option value="Niger">Niger</option>
														   <option value="Nigeria">Nigeria</option>
														   <option value="Niue">Niue</option>
														   <option value="Norfolk Island">Norfolk Island</option>
														   <option value="Northern Mariana Islands">Northern Mariana Islands</option>
														   <option value="Norway">Norway</option>
														   <option value="Oman">Oman</option>
														   <option value="Pakistan">Pakistan</option>
														   <option value="Palau">Palau</option>
														   <option value="Palestinian Territories">Palestinian Territories</option>
														   <option value="Panama">Panama</option>
														   <option value="Papua New Guinea">Papua New Guinea</option>
														   <option value="Paraguay">Paraguay</option>
														   <option value="Peru">Peru</option>
														   <option value="Philippines">Philippines</option>
														   <option value="Pitcairn">Pitcairn</option>
														   <option value="Poland">Poland</option>
														   <option value="Portugal">Portugal</option>
														   <option value="Puerto Rico">Puerto Rico</option>
														   <option value="Qatar">Qatar</option>
														   <option value="Reunion">Reunion</option>
														   <option value="Romania">Romania</option>
														   <option value="Russian Federation">Russian Federation</option>
														   <option value="Rwanda">Rwanda</option>
														   <option value="Saint Helena">Saint Helena</option>
														   <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
														   <option value="Saint Lucia">Saint Lucia</option>
														   <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
														   <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
														   <option value="Samoa">Samoa</option>
														   <option value="San Marino">San Marino</option>
														   <option value="Sao Tome and Principe">Sao Tome and Principe</option>
														   <option value="Saudi Arabia">Saudi Arabia</option>
														   <option value="Senegal">Senegal</option>
														   <option value="Serbia">Serbia</option>
														   <option value="Seychelles">Seychelles</option>
														   <option value="Sierra Leone">Sierra Leone</option>
														   <option value="Singapore">Singapore</option>
														   <option value="Slovakia">Slovakia</option>
														   <option value="Slovenia">Slovenia</option>
														   <option value="Solomon Islands">Solomon Islands</option>
														   <option value="Somalia">Somalia</option>
														   <option value="South Africa">South Africa</option>
														   <option value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option>
														   <option value="Spain">Spain</option>
														   <option value="Sri Lanka">Sri Lanka</option>
														   <option value="Suriname">Suriname</option>
														   <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
														   <option value="Swaziland">Swaziland</option>
														   <option value="Sweden">Sweden</option>
														   <option value="Switzerland">Switzerland</option>
														   <option value="Taiwan">Taiwan</option>
														   <option value="Tajikistan">Tajikistan</option>
														   <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
														   <option value="Thailand">Thailand</option>
														   <option value="Togo">Togo</option>
														   <option value="Tokelau">Tokelau</option>
														   <option value="Tonga">Tonga</option>
														   <option value="Trinidad and Tobago">Trinidad and Tobago</option>
														   <option value="Tunisia">Tunisia</option>
														   <option value="Turkey">Turkey</option>
														   <option value="Turkmenistan">Turkmenistan</option>
														   <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
														   <option value="Tuvalu">Tuvalu</option>
														   <option value="Uganda">Uganda</option>
														   <option value="Ukraine">Ukraine</option>
														   <option value="United Arab Emirates">United Arab Emirates</option>
														   <option value="United Kingdom">United Kingdom</option>
														   <option value="United States">United States</option>
														   <option value="Uruguay">Uruguay</option>
														   <option value="Uzbekistan">Uzbekistan</option>
														   <option value="Vanuatu">Vanuatu</option>
														   <option value="Venezuela">Venezuela</option>
														   <option value="Vietnam">Vietnam</option>
														   <option value="Virgin Islands, British">Virgin Islands, British</option>
														   <option value="Virgin Islands, U S">Virgin Islands, U S</option>
														   <option value="Wallis and Futuna">Wallis and Futuna</option>
														   <option value="Western Sahara">Western Sahara</option>
														   <option value="Yemen">Yemen</option>
														   <option value="Zambia">Zambia</option>
														   <option value="Zimbabwe">Zimbabwe</option>
														</select>
													</td> 
													<td> </td> 
												</tr>
											</tbody>
										</table>
										<a href="#"> Add your own item specific</a>
									</fieldset>
								</section>
						</div>
						
						<!-- The detail part -->
						<section> 
								<label class="label">Details</label>   
								<textarea id="ckEditorForDetails"></textarea> 
								<ul class="detail-action">
									<li> <a href="#">Preview</a></li>
									<li> <a href="#">Save Draft</a></li>
								</ul>
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
				                 				<td>$ <input type="number" /> </td>
				                 				<td></td>
				                 			</tr>
				         
				                 			<tr>
				                 				<td>Buy It Now price (<a href="http://pages.ebay.com/help/sell/fees.html">see listing fees</a> - opens in a new window or tab) </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>$ <input type="number" /> </td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>Duration</td>
				                 				<td></td>
				                 			</tr>
				                 			<tr>
				                 				<td>
				                 					<select id="duration" name="duration" title="Duration">
													   <option value="3">3 days</option>
													   <option value="5">5 days</option>
													   <option value="7" selected="">7 days</option>
													   <option value="10">10 days</option>
													</select>
				                 				</td>
				                 				<td></td>
				                 			</tr>
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
				                  				<input type="checkbox"/> <span>PayPal <a href="http://pages.ebay.com/help/sell/paypalfees.html">(fees vary)</a></span> <br>
				                  				<span>Accept credit or debit card and bank payments safely and easily with PayPal</span> <br>
				                  				<span>Your PayPal account email address (to receive payments)</span> <br>
				                  				<input type="text" /> <br>
				                  				<input type ="checkbox" > <span> Require immediate payment when buyer uses Buy It Now</span> <br>
				                  				
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
				                   <a href="http://cgi5.ebay.com/ws/eBayISAPI.dll#">Show all shipping options</a> <br>
				                   U.S. shipping services <br>
				                   <select id="shipService1" name="shipService1" title="Select domestic shipping service" onchange="ebay.run(this.id,'onchange');">
									   <option value="0" selected="">-</option>
									   <optgroup label="Economy services from outside US"></optgroup>
									   <option value="161">&nbsp;&nbsp;&nbsp;    Economy Shipping from outside US&nbsp;(11 to 23 business days)</option>
									   <option value="50044">&nbsp;&nbsp;&nbsp;    Economy Shipping from China/Hong Kong/Taiwan to worldwide&nbsp;(11 to 35 business days)</option>
									   <optgroup label="Standard services from outside US"></optgroup>
									   <option value="162">&nbsp;&nbsp;&nbsp;    Standard Shipping from outside US&nbsp;(5 to 10 business days)</option>
									   <option value="50045">&nbsp;&nbsp;&nbsp;    Standard Shipping from China/Hong Kong/Taiwan to worldwide&nbsp;(7 to 19 business days)</option>
									   <optgroup label="Expedited services from outside US"></optgroup>
									   <option value="163">&nbsp;&nbsp;&nbsp;    Expedited Shipping from outside US&nbsp;(1 to 4 business days)</option>
									   <option value="167">&nbsp;&nbsp;&nbsp;    FedEx International Economy&nbsp;(2 to 4 business days)</option>
									   <option value="50046">&nbsp;&nbsp;&nbsp;    Expedited Shipping from China/Hong Kong/Taiwan  to worldwide&nbsp;(2 to 7 business days)</option>
									   <optgroup label=" - - - - - - - - - -"></optgroup>
									   <option value="-2">See more services</option>
									</select>
									$ <input type="number" />  <input type="checkbox" /> Free Shipping <br>
									<a href="#">Offer additional service</a> <br>
									Handling time <br>
									<select id="shipsWithinDays" name="shipsWithinDays" style="display:block" title="Handling time" onchange="ebay.run(this.id,'onchange');">
									   <option value="-1" selected="">Select a handling time</option>
									   <option value="0">Same business day</option>
									   <option value="1">1 business day</option>
									   <option value="2">2 business days</option>
									   <option value="3">3 business days</option>
									   <optgroup label="Exception handling times"></optgroup>
									   <option value="4">4 business days</option>
									   <option value="5">5 business days</option>
									   <option value="10">10 business days</option>
									   <option value="15">15 business days</option>
									   <option value="20">20 business days</option>
									   <option value="30">30 business days</option>
									</select> <br>
									Package details <br>
									Package type<br>
									<select id="pkgSize" name="pkgSize" title="Package type" onchange="ebay.run(this.id,'onchange');">
									   <option value="1">Letter</option>
									   <option value="2">Large Envelope</option>
									   <option value="4" selected="">Package (or thick envelope)</option>
									   <option value="5">Large Package</option>
									</select>
									
									<input type="number"> in. X <input type="number"/> in. X <input type="numebr"/> in. <br>
									<input type = "checkbox"/> Irregular package <br> 
									<b>Weight</b> <br>
									<select id="estimatedWeight" name="estimatedWeight" title="Weight" onchange="ebay.run(this.name,'onchange');">
									   <option value="1">1 lb. or less</option>
									   <option value="2">1+ to 2 lbs</option>
									   <option value="3">2+ to 3 lbs</option>
									   <option value="4">3+ to 4 lbs</option>
									   <option value="5">4+ to 5 lbs</option>
									   <option value="6">5+ to 6 lbs</option>
									   <option value="7">6+ to 7 lbs</option>
									   <option value="8">7+ to 8 lbs</option>
									   <option value="9">8+ to 9 lbs</option>
									   <option value="10">9+ to 10 lbs</option>
									   <option value="0" selected="">Custom weight</option>
									</select>
									<input type="number"/> lbs. <input type="number"/> oz <br>
									Item location <br>
									HaNoi,HaNoi ,VietNam <br>
									<a href="#">Change location</a>
									
				                </div> 
					        </div>
						</section>
						
						<!-- The add other detail part -->
						<section> 
							<div class="panel panel-default">
				                <div class="panel-heading">
				                    <b>Add other details</b>
				                </div>
				                <div class="panel-body">
				                  <table>
				                   	<thead>
				                   		<th> </th>
				                   		<th> </th>
				                   	</thead>
				                   	<tbody>
				                   		<tr> 
				                   			<td>
				                   				Sales tax <br>
				                   				<input type="checkbox" /> <span>Also apply to shipping and handling costs</span> <br>
				                   				Return policy <br>
				                   				We now require that all sellers specify whether they accept returns or not. <br> 
				                   				
				                   			 </td>
				                   			<td> </td>
				                   		</tr>
				                   		<tr>
				                   			<td>
				                   				<fieldset class="ebay-fieldset">
				                   					<legend>
				                   						<select id="select-">
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
				                   									<select id="itemReturnedWithin" name="itemReturnedWithin" title="After receiving the item, your buyer should start a return within:">
																	   <option value="Days_14" selected="">14 Days</option>
																	   <option value="Days_30">30 Days</option>
																	   <option value="Days_60">60 Days</option>
																	</select>
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
				                   							<tr>
				                   								<td>Refund will be given as <br>
				                   									<select id="refundGivenAs" name="refundGivenAs" title="Refund will be given as">
																	   <option value="MoneyBack" selected="">Money Back</option>
																	   <option value="MoneyBackOrReplacement">Money back or replacement (buyer's choice)</option>
																	   <option value="MoneyBackOrExchange">Money back or exchange (buyer's choice)</option>
																	</select>
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
				                   							<tr>
				                   								<td>Return shipping will be paid by<br>
				                   									<select id="returnsPaidBy" name="returnsPaidBy" title="Return shipping will be paid by">
																	   <option value="Buyer" selected="">Buyer</option>
																	   <option value="Seller">Seller</option>
																	</select> <br>
																	If your buyer returns this item because the item is not as described in the listing, you'll be charged return shipping on your seller invoice as a fee, which may be charged to your automatic payment method on file, if any.<br>
				                   								 </td> 
				                   								<td> </td> 
				                   							</tr>
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
		
		<!-- EMBED CKEDITOR(napt2017) -->
		<script src="${pageContext.request.contextPath}/resources/js/plugin/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(function(){  
				CKEDITOR.replace("ckEditorForDetails"); 
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