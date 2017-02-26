<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-us">
	 <jsp:include page="../pages/common/header.jsp"/>  
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
					<div class="row">
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
										<table class="table table-bordered table-striped responsive-utilities" style="margin-left:15px;">
											<thead>
											  <tr>
												<th>
												  Shipping method
												</th>
												<th>
													Asia
												</th>
												<th>
													North America, Central America, 
													<br/>Middle East, Australia, New Zealand
												</th>
												<th>
												  Europe, Russia
												</th>
												<th>
												  South America, Africa
												</th>
											  </tr>
											</thead>
											<tbody>
											  <tr>
												<td class="">0.30</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="900"> Yen
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="1200"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="1500"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="1700"> Yen
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">0.50</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="1100"> Yen
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="1500"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="1800"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="2100"> Yen
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">0.60</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="1240"> Yen
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="1680"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="2000"> Yen
													</section>
												</td>
												<td class="is-hidden">
													<section>
														<input type="text" class="input" placeholder="2440"> Yen
													</section>
												</td>
											  </tr>
											</tbody>
											
										</table>
									</div>
								</fieldset>
								<fieldset>
									<h2 style="font-weight: bold; margin-bottom:10px">Shipping setting</h2>
									<div class="row" style="background-color:white; padding-right: 40px;">
										<table class="table table-bordered table-striped responsive-utilities" style="margin-left:15px;">
											<thead>
											  <tr>
												<th>
												  Shipping method
												</th>
												<th>
													Asia
												</th>
												<th>
													North America, Central America, 
													<br/>Middle East, Australia, New Zealand
												</th>
												<th>
												  Europe, Russia
												</th>
												<th>
												  South America, Africa
												</th>
												<th style="width:20px;">
												  Choice
												</th>
											  </tr>
											</thead>
											<tbody>
											  <tr>
												<td class="">EMS</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="3 - 6 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="4 - 6 days">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="3 - 5 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="4 - 6 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">International parcel SAL</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="2 - 3 weeks">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">Small package with registered mail Air mail</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="3 - 7 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="5 - 12 days">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="4 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="6 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">Small package with registered mail SAL flight</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="2 - 3 weeks">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">Registered without packaging Air Mail</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="3 - 7 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="5 - 12 days">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="4 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="6 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">Registered non small packaging material aviation SAL flight</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="2 - 3 weeks">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="2 - 3 weeks">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">International e packet</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="3 - 7 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="5 - 12 days">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="4 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="6 - 8 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											  <tr>
												<td class="">FedEX</td>
												<td class="">
													<section>
													<input type="text" class="input" placeholder="2 - 3 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="">
													<section>
														<input type="text" class="input" placeholder="3 - 5 days">
														<div class="inline-group" style="margin-top:5px">
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Free</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>No shipping</label>
															<label class="">
															<input type="radio" name="radio-inline" >
															<i></i>Ask</label>
														</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="3 - 4 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td class="is-hidden">
													<section>
													<input type="text" class="input" placeholder="5 - 7 days">
													<div class="inline-group" style="margin-top:5px">
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Free</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>No shipping</label>
														<label class="">
														<input type="radio" name="radio-inline" >
														<i></i>Ask</label>
													</div>
													</section>
												</td>
												<td>
													<section>
														<label class="checkbox ">
															<input type="checkbox" name="checkbox" checked="checked" >
															<i></i></label>
													</section>
												</td>
											  </tr>
											</tbody>
											
										</table>
									</div>
									<div class="row" style="margin-left:10px;margin-top:15px;">
										<div class="col col-5">
											<h3 style="margin-bottom: 10px">EBay Delivery Method</h3>
											<section class="col">
												<label class="col col-3">US:</label>
												<label class="col col-4">
													<select class="" id="select-">
															<option>Standard Shipping</option>
															<option>Economy Shipping</option>
															<option>Expedited Shipping</option>
													</select>
												</label>
											</section>
											<section>
												<label class="col col-2">Other areas:</label>
												<label class="col col-4">
													<select class="" id="select-">
															<option>Expedited Int'l Shipping</option>
															<option>Economy Int'l Shipping</option>
															<option>Standard Int'l Shipping</option>
													</select>
												</label>
											</section>
										</div>
										<div class="col col6">
											<h3>EBay Shipping Fee</h3>
											<div class="row">
												<section class="col">
													<div class="row" style="margin-top:10px; margin-bottom: 20px">
														<label class="col col-6">Asia:</label>
														<label class="col col-6">
															<select class="" id="select-">
																	<option>Standard Shipping</option>
																	<option>Economy Shipping</option>
																	<option>Expedited Shipping</option>
															</select>
														</label>
													</div>
													<div class="row">
														<label class="col col-6">UEurope, Russia:</label>
														<label class="col col-6">
															<select class="" id="select-">
																	<option>Standard Shipping</option>
																	<option>Economy Shipping</option>
																	<option>Expedited Shipping</option>
															</select>
														</label>
													</div>
												</section>
												<section class="col col-7">
													<div class="row" style="margin-top:10px; margin-bottom: 10px">
														<label class="col col-8">North America, Central America, <br/>Middle East, Australia, New Zealand: </label>
														<label class="col col-4">
															<select class="" id="select-">
																	<option>Expedited Int'l Shipping</option>
																	<option>Economy Int'l Shipping</option>
																	<option>Standard Int'l Shipping</option>
															</select>
														</label>
													</div>
													<div class="row">
														<label class="col col-8">South America, Africa: </label>
														<label class="col col-4">
															<select class="" id="select-">
																	<option>Expedited Int'l Shipping</option>
																	<option>Economy Int'l Shipping</option>
																	<option>Standard Int'l Shipping</option>
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
												<textarea rows="3" name="comment" style="width:80%;    margin-left: 25px;" placeholder=""></textarea> 
											
										</section>
										<section class="col col-6" >
											<h3 style="margin-bottom: 10px">Number of days to ship</h3>
											<label class="">
												<input type="text" class="input" placeholder="day"> 
											</label>
										</section>
									</div>
									<div class="row" style="margin-left:10px;margin-top:15px;">
										<section class="col col-5" >
											<h3 style="margin-bottom: 10px">Return warranty period</h3>									
											<select class="" id="select-">
												<option>No returns</option>
												<option>14</option>
												<option>30</option>
												<option>60</option>
											</select>	
											
										</section>
									</div>
								</fieldset>
								<fieldset>
									<h2 style="font-weight: bold; margin-bottom:10px">Not shipping country</h2>
									<label>Please select the setting of the country not shipping</label>
									<div class="row">
										<div class="col-sm-4 region">
											<span class="checkbox" style="display:inline-block">
												<label>
													<input type="checkbox" class="checkbox style-0" data-region="Africa" class="toggleAll" name="checkbox">
													<span>Africa</span>
												</label>
											</span>
											
											[<a href='#africa' data-toggle="collapse">Hide all countries</a>]
											  <ul id="africa" class="collapse" style="padding-left:40px">
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Angerie" name="country">
														<span>Angerie</span>
													</label>
												</div>
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Congo" name="country">
														<span>Congo</span>
													</label>
												</div>

												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Angola" name="country">
														<span>Angola</span>
													</label>
												</div>
											  </ul>
										</div>
										<div class="col-sm-4 region">
											<span class="checkbox" style="display:inline-block">
												<label>
													<input type="checkbox" class="checkbox style-0" data-region="Europe" class="toggleAll" name="checkbox">
													<span>Europe</span>
												</label>
											</span>
											
											[<a href='#Africa' data-toggle="collapse">Hide all countries</a>]
											  <ul id="Africa" class="collapse" style="padding-left:40px">
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="France" name="country">
														<span>France</span>
													</label>
												</div>
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Germany" name="country">
														<span>Germany</span>
													</label>
												</div>
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Spain" name="country">
														<span>Spain</span>
													</label>
												</div>
											  </ul>
										</div>
										<div class="col-sm-4 region">
											<span class="checkbox" style="display:inline-block">
												<label>
													<input type="checkbox" class="checkbox style-0" data-region="Oceania" class="toggleAll" name="checkbox">
													<span>Oceania</span>
												</label>
											</span>
											
											[<a href='#Oceania' data-toggle="collapse">Hide all countries</a>]
											  <ul id="Oceania" class="collapse" style="padding-left:40px">
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="Tonga" name="country">
														<span>Tonga</span>
													</label>
												</div>
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="NiuNiu" name="country">
														<span>NiuNiu</span>
													</label>
												</div>
												<div class="checkbox">
													<label>
														<input type="checkbox" class="checkbox style-0" data-country="FijiFiji" name="country">
														<span>FijiFiji</span>
													</label>
												</div>
											  </ul>
										</div>
									</div>									
								</fieldset>
								
								<footer>
									<button type="submit" class="btn btn-primary">
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