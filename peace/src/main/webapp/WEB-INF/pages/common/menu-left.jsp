<aside id="left-panel">

			<!-- User info -->
			<div class="login-info">
				<span class="dropdown"> <!-- User image size is adjusted inside CSS, it should stay as it --> 
					
					<a href="javascript:void(0);" id="show-shortcut" data-toggle="dropdown" aria-expanded="true">
						<img src="${pageContext.request.contextPath}/resources/img/avatars/sunny.png" alt="me" class="online" /> 
						<span>
							HungTQ
						</span>
						<i class="fa fa-angle-down"></i>
					</a> 
					<ul class="dropdown-menu" role="menu">
						<li>
							<a href="G_SetAccount.html" title="Account"><i class="fa fa-fw fa-user"></i> My Account</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="login.html" title="Logout" data-action="userLogout" data-logout-msg="Test"><i class="fa fa-fw fa-sign-out"></i> Logout</a>
						</li>
					</ul>
				</span>
			</div>
			<!-- end user info -->

			<!-- NAVIGATION : This navigation is also responsive-->
			<nav>
				<!-- ssssssss
				NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul>
					<li class="active">
						<a href="#" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Home</span></a>
					</li>
					<li class="top-menu-invisible">
						<a href="#"> <span class="menu-item-parent">EBay Listing</span></a>
						<ul>
							<li class="">
								<a href="G_Sell.html" title=""><i class=""></i> <span class="menu-item-parent">Item Listing</span></a>
							</li>
							<li class="">
								<a href="G_SellDetail.html" title=""><i class=""></i> <span class="menu-item-parent">For Ebay Listing</span></a>
							</li>
							<li >
								<a href="#"><i class=""></i> Category</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"> <span class="menu-item-parent">Ebay Product List</span></a>
						<ul>
							<li class="">
								<a href="G_ListSell.html" title=""> <span class="menu-item-parent">Sending</span></a>
							</li>
							<li class="">
								<a href="G_ListUnsold.html" title=""><span class="menu-item-parent">Listing End</span></a>
							</li>
							<li>
								<a href="G_ListSold.html">Sold</a>
							</li>
							<li>
								<a href="G_ListError.html">Error</a>
							</li>
						</ul>
					</li>
					<li class="" >
						<a href="ListResearchAll"> <span class="menu-item-parent">Research</span></a>
					</li>
					<li>
						<a href="#"> <span class="menu-item-parent">EBay settings</span></a>
						<ul>
							<!--  
								<li >
									<a href="ListTemplate">Listing template</a>
								</li>
							-->
							<li >
								<a href="CustomTemplate">Custom listing template</a>
							</li>
							<li>
								<a href="SetItemInfo">Product explanation information</a>
							</li>
							<li>
								<a href="SetShip">Shipping Setting</a>
							</li>
							<li>
								<a href="SetBuyer">Buyer Requirement</a>
							</li>
							<li>
								<a href="SetEbayLogin">EBay Login</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"> <span class="menu-item-parent">Stock Check</span></a>
						<ul>
							<li>
								<a href="G_StockRegistor.html">Stock Registor</a>
							</li>
							<li>
								<a href="G_StockList.html">Inventory list</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="G_SetAccount.html"> <span class="menu-item-parent">Account</span></a>						
					</li>	
					<li>
						<a href="#"><span class="menu-item-parent">Manual</span></a>
					</li>
					<li>
						<a href="ContactUs"> <span class="menu-item-parent">Contact Us</span></a>
					</li>
				</ul>
			</nav>
			<span class="minifyme" data-action="minifyMenu"> 
				<i class="fa fa-arrow-circle-left hit"></i> 
			</span>

		</aside>