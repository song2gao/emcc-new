<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Two Menu Style - Ace Admin</title>

		<meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/emcc-new/asset/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/emcc-new/asset/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="/emcc-new/asset/css/jquery-ui.min.css" />
		<link rel="stylesheet" href="/emcc-new/asset/css/bootstrap-datepicker3.min.css" />
		<link rel="stylesheet" href="/emcc-new/asset/css/ui.jqgrid.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="/emcc-new/asset/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/emcc-new/asset/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/emcc-new/asset/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="/emcc-new/asset/css/ace-skins.min.css" />
		<link rel="stylesheet" href="/emcc-new/asset/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/emcc-new/asset/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="/emcc-new/asset/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/emcc-new/asset/js/html5shiv.min.js"></script>
		<script src="/emcc-new/asset/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="no-skin">
		<div id="sidebar" class="sidebar h-sidebar navbar-collapse collapse ace-save-state" style="border: 1px solid red;">
			<script type="text/javascript">
				try {
					ace.settings.loadState('sidebar')
				} catch(e) {}
			</script>
			<div class="sidebar-shortcuts" id="sidebar-shortcuts" style="border: 1px solid blue;">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

					<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

					<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

					<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span>

					<span class="btn btn-info"></span>

					<span class="btn btn-warning"></span>

					<span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list" style="border: 0px solid red;">

				<li class="active open hover">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-desktop"></i>
						<span class="menu-text">
								实时状态监视
							</span>

						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="active open hover">
							<a href="#" class="dropdown-toggle">
								<i class="menu-icon fa fa-caret-right"></i> Layouts
								<b class="arrow fa fa-angle-down"></b>
							</a>

							<b class="arrow"></b>

							<ul class="submenu">
								<li class="hover">
									<a href="top-menu.html">
										<i class="menu-icon fa fa-caret-right"></i> Top Menu
									</a>

									<b class="arrow"></b>
								</li>

								<li class="hover">
									<a href="two-menu-1.html">
										<i class="menu-icon fa fa-caret-right"></i> Two Menus 1
									</a>

									<b class="arrow"></b>
								</li>
							</ul>
						</li>

						<li class="hover">
							<a href="typography.html">
								<i class="menu-icon fa fa-caret-right"></i> Typography
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="elements.html">
								<i class="menu-icon fa fa-caret-right"></i> Elements
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="hover">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-list"></i>
						<span class="menu-text"> 故障记录报警 </span>

						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="hover">
							<a href="tables.html">
								<i class="menu-icon fa fa-caret-right"></i> Simple &amp; Dynamic
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="jqgrid.html">
								<i class="menu-icon fa fa-caret-right"></i> jqGrid plugin
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="hover">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-pencil-square-o"></i>
						<span class="menu-text"> 实时数据监视 </span>

						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="hover">
							<a href="form-elements.html">
								<i class="menu-icon fa fa-caret-right"></i> Form Elements
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="form-elements-2.html">
								<i class="menu-icon fa fa-caret-right"></i> Form Elements 2
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="form-wizard.html">
								<i class="menu-icon fa fa-caret-right"></i> Wizard &amp; Validation
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="wysiwyg.html">
								<i class="menu-icon fa fa-caret-right"></i> Wysiwyg &amp; Markdown
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="dropzone.html">
								<i class="menu-icon fa fa-caret-right"></i> Dropzone File Upload
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="hover">
					<a href="widgets.html">
						<i class="menu-icon fa fa-list-alt"></i>
						<span class="menu-text"> Widgets </span>
					</a>

					<b class="arrow"></b>
				</li>

				<li class="hover">
					<a href="calendar.html">
						<i class="menu-icon fa fa-calendar"></i>

						<span class="menu-text">
								Calendar

								<span class="badge badge-transparent tooltip-error" title="2 Important Events">
									<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
								</span>
						</span>
					</a>

					<b class="arrow"></b>
				</li>

				<li class="hover">
					<a href="gallery.html">
						<i class="menu-icon fa fa-picture-o"></i>
						<span class="menu-text"> Gallery </span>
					</a>

					<b class="arrow"></b>
				</li>

				<li class="hover">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-tag"></i>
						<span class="menu-text"> More Pages </span>

						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="hover">
							<a href="profile.html">
								<i class="menu-icon fa fa-caret-right"></i> User Profile
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="inbox.html">
								<i class="menu-icon fa fa-caret-right"></i> Inbox
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="pricing.html">
								<i class="menu-icon fa fa-caret-right"></i> Pricing Tables
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="invoice.html">
								<i class="menu-icon fa fa-caret-right"></i> Invoice
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="timeline.html">
								<i class="menu-icon fa fa-caret-right"></i> Timeline
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="search.html">
								<i class="menu-icon fa fa-caret-right"></i> Search Results
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="email.html">
								<i class="menu-icon fa fa-caret-right"></i> Email Templates
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="login.html">
								<i class="menu-icon fa fa-caret-right"></i> Login &amp; Register
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="hover">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-file-o"></i>

						<span class="menu-text">
								Other Pages

								<span class="badge badge-primary">5</span>
						</span>

						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="hover">
							<a href="faq.html">
								<i class="menu-icon fa fa-caret-right"></i> FAQ
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="error-404.html">
								<i class="menu-icon fa fa-caret-right"></i> Error 404
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="error-500.html">
								<i class="menu-icon fa fa-caret-right"></i> Error 500
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="grid.html">
								<i class="menu-icon fa fa-caret-right"></i> Grid
							</a>

							<b class="arrow"></b>
						</li>

						<li class="hover">
							<a href="blank.html">
								<i class="menu-icon fa fa-caret-right"></i> Blank Page
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>
			</ul>
			<!-- /.nav-list -->
		</div>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try {
					ace.settings.loadState('main-container')
				} catch(e) {}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try {
						ace.settings.loadState('sidebar')
					} catch(e) {}
				</script>
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

					<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

					<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

					<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
				</div>
				<div class="widget-box widget-color-blue2">
					<div class="widget-header">
						<h4 class="widget-title lighter smaller">医院建筑</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main padding-8">
							<ul id="tree1" class="tree tree-unselectable" role="tree">
								<li class="tree-branch hide" data-template="treebranch" role="treeitem" aria-expanded="false">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-plus"></i>						<span class="tree-label"></span> </span>
									</div>
									<ul class="tree-branch-children" role="group"></ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-item hide" data-template="treeitem" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label"></span> </span>
								</li>
								<li class="tree-branch" role="treeitem" aria-expanded="false">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-plus"></i>						<span class="tree-label">For Sale</span> </span>
									</div>
									<ul class="tree-branch-children" role="group"></ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-branch tree-open" role="treeitem" aria-expanded="true">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-minus"></i>						<span class="tree-label">Vehicles</span> </span>
									</div>
									<ul class="tree-branch-children" role="group">
										<li class="tree-branch" role="treeitem" aria-expanded="false">
											<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-plus"></i>						<span class="tree-label">Cars</span> </span>
											</div>
											<ul class="tree-branch-children hidden" role="group">
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Classics</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Convertibles</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Coupes</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Hatchbacks</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Hybrids</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">SUVs</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Sedans</span> </span>
												</li>
												<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Trucks</span> </span>
												</li>
											</ul>
											<div class="tree-loader hidden" role="alert">
												<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
											</div>
										</li>
										<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Motorcycles</span> </span>
										</li>
										<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Boats</span> </span>
										</li>
									</ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-branch" role="treeitem" aria-expanded="false">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-plus"></i>						<span class="tree-label">Rentals</span> </span>
									</div>
									<ul class="tree-branch-children" role="group"></ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-branch tree-open" role="treeitem" aria-expanded="true">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-minus"></i>						<span class="tree-label">Real Estate</span> </span>
									</div>
									<ul class="tree-branch-children" role="group">
										<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Apartments</span> </span>
										</li>
										<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Villas</span> </span>
										</li>
										<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Plots</span> </span>
										</li>
									</ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-branch" role="treeitem" aria-expanded="false">
									<div class="tree-branch-header"> <span class="tree-branch-name">						<i class="icon-folder ace-icon tree-plus"></i>						<span class="tree-label">Pets</span> </span>
									</div>
									<ul class="tree-branch-children" role="group"></ul>
									<div class="tree-loader hidden" role="alert">
										<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>
									</div>
								</li>
								<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Tickets</span> </span>
								</li>
								<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Services</span> </span>
								</li>
								<li class="tree-item" role="treeitem"> <span class="tree-item-name">				  <i class="icon-item ace-icon fa fa-times"></i>				  <span class="tree-label">Personals</span> </span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="main-content">
				<div class="main-content-inner" style="border-top: 1px solid;">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">设备维护管理</a>
							</li>

							<li>
								<a href="#">运行监控</a>
							</li>
							<li class="active">医院建筑</li>
						</ul>
						<!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div>
						<!-- /.nav-search -->
					</div>

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div>
								<!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div>
								<!-- /.pull-left -->
							</div>
							<!-- /.ace-settings-box -->
						</div>
						<!-- /.ace-settings-container -->

						<div class="page-header">
							<h1>
								jqGrid
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Dynamic tables and grids using jqGrid plugin
								</small>
							</h1>
						</div>
						<!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<table id="grid-table"></table>

								<div id="grid-pager"></div>

								<!-- PAGE CONTENT ENDS -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.page-content -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div>
		<!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="/emcc-new/asset/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="/emcc-new/asset/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='/emcc-new/asset/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="/emcc-new/asset/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="/emcc-new/asset/js/bootstrap-datepicker.min.js"></script>
		<script src="/emcc-new/asset/js/jquery.jqGrid.min.js"></script>
		<script src="/emcc-new/asset/js/grid.locale-en.js"></script>

		<!-- page specific plugin scripts -->
		<script src="/emcc-new/asset/js/tree.min.js"></script>

		<!-- ace scripts -->
		<script src="/emcc-new/asset/js/ace-elements.min.js"></script>
		<script src="/emcc-new/asset/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			var sampleData = initiateDemoData(); //see below

			$('#tree1').ace_tree({
				dataSource: sampleData['dataSource1'],
				multiSelect: true,
				cacheItems: true,
				'open-icon': 'ace-icon tree-minus',
				'close-icon': 'ace-icon tree-plus',
				'itemSelect': true,
				'folderSelect': false,
				'selected-icon': 'ace-icon fa fa-check',
				'unselected-icon': 'ace-icon fa fa-times',
				loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
			});

			$('#tree2').ace_tree({
				dataSource: sampleData['dataSource2'],
				loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
				'open-icon': 'ace-icon fa fa-folder-open',
				'close-icon': 'ace-icon fa fa-folder',
				'itemSelect': true,
				'folderSelect': true,
				'multiSelect': true,
				'selected-icon': null,
				'unselected-icon': null,
				'folder-open-icon': 'ace-icon tree-plus',
				'folder-close-icon': 'ace-icon tree-minus'
			});

			/**
			//Use something like this to reload data	
			$('#tree1').find("li:not([data-template])").remove();
			$('#tree1').tree('render');
			*/

			/**
			//please refer to docs for more info
			$('#tree1')
			.on('loaded.fu.tree', function(e) {
			})
			.on('updated.fu.tree', function(e, result) {
			})
			.on('selected.fu.tree', function(e) {
			})
			.on('deselected.fu.tree', function(e) {
			})
			.on('opened.fu.tree', function(e) {
			})
			.on('closed.fu.tree', function(e) {
			});
			*/

			function initiateDemoData() {
				var tree_data = {
					'for-sale': {
						text: 'For Sale',
						type: 'folder'
					},
					'vehicles': {
						text: 'Vehicles',
						type: 'folder'
					},
					'rentals': {
						text: 'Rentals',
						type: 'folder'
					},
					'real-estate': {
						text: 'Real Estate',
						type: 'folder'
					},
					'pets': {
						text: 'Pets',
						type: 'folder'
					},
					'tickets': {
						text: 'Tickets',
						type: 'item'
					},
					'services': {
						text: 'Services',
						type: 'item'
					},
					'personals': {
						text: 'Personals',
						type: 'item'
					}
				}
				tree_data['for-sale']['additionalParameters'] = {
					'children': {
						'appliances': {
							text: 'Appliances',
							type: 'item'
						},
						'arts-crafts': {
							text: 'Arts & Crafts',
							type: 'item'
						},
						'clothing': {
							text: 'Clothing',
							type: 'item'
						},
						'computers': {
							text: 'Computers',
							type: 'item'
						},
						'jewelry': {
							text: 'Jewelry',
							type: 'item'
						},
						'office-business': {
							text: 'Office & Business',
							type: 'item'
						},
						'sports-fitness': {
							text: 'Sports & Fitness',
							type: 'item'
						}
					}
				}
				tree_data['vehicles']['additionalParameters'] = {
					'children': {
						'cars': {
							text: 'Cars',
							type: 'folder'
						},
						'motorcycles': {
							text: 'Motorcycles',
							type: 'item'
						},
						'boats': {
							text: 'Boats',
							type: 'item'
						}
					}
				}
				tree_data['vehicles']['additionalParameters']['children']['cars']['additionalParameters'] = {
					'children': {
						'classics': {
							text: 'Classics',
							type: 'item'
						},
						'convertibles': {
							text: 'Convertibles',
							type: 'item'
						},
						'coupes': {
							text: 'Coupes',
							type: 'item'
						},
						'hatchbacks': {
							text: 'Hatchbacks',
							type: 'item'
						},
						'hybrids': {
							text: 'Hybrids',
							type: 'item'
						},
						'suvs': {
							text: 'SUVs',
							type: 'item'
						},
						'sedans': {
							text: 'Sedans',
							type: 'item'
						},
						'trucks': {
							text: 'Trucks',
							type: 'item'
						}
					}
				}

				tree_data['rentals']['additionalParameters'] = {
					'children': {
						'apartments-rentals': {
							text: 'Apartments',
							type: 'item'
						},
						'office-space-rentals': {
							text: 'Office Space',
							type: 'item'
						},
						'vacation-rentals': {
							text: 'Vacation Rentals',
							type: 'item'
						}
					}
				}
				tree_data['real-estate']['additionalParameters'] = {
					'children': {
						'apartments': {
							text: 'Apartments',
							type: 'item'
						},
						'villas': {
							text: 'Villas',
							type: 'item'
						},
						'plots': {
							text: 'Plots',
							type: 'item'
						}
					}
				}
				tree_data['pets']['additionalParameters'] = {
					'children': {
						'cats': {
							text: 'Cats',
							type: 'item'
						},
						'dogs': {
							text: 'Dogs',
							type: 'item'
						},
						'horses': {
							text: 'Horses',
							type: 'item'
						},
						'reptiles': {
							text: 'Reptiles',
							type: 'item'
						}
					}
				}

				var dataSource1 = function(options, callback) {
					var $data = null
					if(!("text" in options) && !("type" in options)) {
						$data = tree_data; //the root tree
						callback({
							data: $data
						});
						return;
					} else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters)
							$data = options.additionalParameters.children || {};
						else $data = {} //no data
					}

					if($data != null) //this setTimeout is only for mimicking some random delay
						setTimeout(function() {
						callback({
							data: $data
						});
					}, parseInt(Math.random() * 500) + 200);

					//we have used static data here
					//but you can retrieve your data dynamically from a server using ajax call
					//checkout examples/treeview.html and examples/treeview.js for more info
				}

				var tree_data_2 = {
					'pictures': {
						text: 'Pictures',
						type: 'folder',
						'icon-class': 'red'
					},
					'music': {
						text: 'Music',
						type: 'folder',
						'icon-class': 'orange'
					},
					'video': {
						text: 'Video',
						type: 'folder',
						'icon-class': 'blue'
					},
					'documents': {
						text: 'Documents',
						type: 'folder',
						'icon-class': 'green'
					},
					'backup': {
						text: 'Backup',
						type: 'folder'
					},
					'readme': {
						text: '<i class="ace-icon fa fa-file-text grey"></i> ReadMe.txt',
						type: 'item'
					},
					'manual': {
						text: '<i class="ace-icon fa fa-book blue"></i> Manual.html',
						type: 'item'
					}
				}
				tree_data_2['music']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-music blue"></i> song1.ogg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-music blue"></i> song2.ogg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-music blue"></i> song3.ogg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-music blue"></i> song4.ogg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-music blue"></i> song5.ogg',
						type: 'item'
					}]
				}
				tree_data_2['video']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-film blue"></i> movie1.avi',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-film blue"></i> movie2.avi',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-film blue"></i> movie3.avi',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-film blue"></i> movie4.avi',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-film blue"></i> movie5.avi',
						type: 'item'
					}]
				}
				tree_data_2['pictures']['additionalParameters'] = {
					'children': {
						'wallpapers': {
							text: 'Wallpapers',
							type: 'folder',
							'icon-class': 'pink'
						},
						'camera': {
							text: 'Camera',
							type: 'folder',
							'icon-class': 'pink'
						}
					}
				}
				tree_data_2['pictures']['additionalParameters']['children']['wallpapers']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper1.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper2.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper3.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper4.jpg',
						type: 'item'
					}]
				}
				tree_data_2['pictures']['additionalParameters']['children']['camera']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo1.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo2.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo3.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo4.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo5.jpg',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-picture-o green"></i> photo6.jpg',
						type: 'item'
					}]
				}

				tree_data_2['documents']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-file-text red"></i> document1.pdf',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-file-text grey"></i> document2.doc',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-file-text grey"></i> document3.doc',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-file-text red"></i> document4.pdf',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-file-text grey"></i> document5.doc',
						type: 'item'
					}]
				}

				tree_data_2['backup']['additionalParameters'] = {
					'children': [{
						text: '<i class="ace-icon fa fa-archive brown"></i> backup1.zip',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-archive brown"></i> backup2.zip',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-archive brown"></i> backup3.zip',
						type: 'item'
					}, {
						text: '<i class="ace-icon fa fa-archive brown"></i> backup4.zip',
						type: 'item'
					}]
				}
				var dataSource2 = function(options, callback) {
					var $data = null
					if(!("text" in options) && !("type" in options)) {
						$data = tree_data_2; //the root tree
						callback({
							data: $data
						});
						return;
					} else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters)
							$data = options.additionalParameters.children || {};
						else $data = {} //no data
					}

					if($data != null) //this setTimeout is only for mimicking some random delay
						setTimeout(function() {
						callback({
							data: $data
						});
					}, parseInt(Math.random() * 500) + 200);

					//we have used static data here
					//but you can retrieve your data dynamically from a server using ajax call
					//checkout examples/treeview.html and examples/treeview.js for more info
				}

				return {
					'dataSource1': dataSource1,
					'dataSource2': dataSource2
				}
			}

			var grid_data = [{
				id: "1",
				name: "Desktop Computer",
				note: "note",
				stock: "Yes",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "2",
				name: "Laptop",
				note: "Long text ",
				stock: "Yes",
				ship: "InTime",
				sdate: "2007-12-03"
			}, {
				id: "3",
				name: "LCD Monitor",
				note: "note3",
				stock: "Yes",
				ship: "TNT",
				sdate: "2007-12-03"
			}, {
				id: "4",
				name: "Speakers",
				note: "note",
				stock: "No",
				ship: "ARAMEX",
				sdate: "2007-12-03"
			}, {
				id: "5",
				name: "Laser Printer",
				note: "note2",
				stock: "Yes",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "6",
				name: "Play Station",
				note: "note3",
				stock: "No",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "7",
				name: "Mobile Telephone",
				note: "note",
				stock: "Yes",
				ship: "ARAMEX",
				sdate: "2007-12-03"
			}, {
				id: "8",
				name: "Server",
				note: "note2",
				stock: "Yes",
				ship: "TNT",
				sdate: "2007-12-03"
			}, {
				id: "9",
				name: "Matrix Printer",
				note: "note3",
				stock: "No",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "10",
				name: "Desktop Computer",
				note: "note",
				stock: "Yes",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "11",
				name: "Laptop",
				note: "Long text ",
				stock: "Yes",
				ship: "InTime",
				sdate: "2007-12-03"
			}, {
				id: "12",
				name: "LCD Monitor",
				note: "note3",
				stock: "Yes",
				ship: "TNT",
				sdate: "2007-12-03"
			}, {
				id: "13",
				name: "Speakers",
				note: "note",
				stock: "No",
				ship: "ARAMEX",
				sdate: "2007-12-03"
			}, {
				id: "14",
				name: "Laser Printer",
				note: "note2",
				stock: "Yes",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "15",
				name: "Play Station",
				note: "note3",
				stock: "No",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "16",
				name: "Mobile Telephone",
				note: "note",
				stock: "Yes",
				ship: "ARAMEX",
				sdate: "2007-12-03"
			}, {
				id: "17",
				name: "Server",
				note: "note2",
				stock: "Yes",
				ship: "TNT",
				sdate: "2007-12-03"
			}, {
				id: "18",
				name: "Matrix Printer",
				note: "note3",
				stock: "No",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "19",
				name: "Matrix Printer",
				note: "note3",
				stock: "No",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "20",
				name: "Desktop Computer",
				note: "note",
				stock: "Yes",
				ship: "FedEx",
				sdate: "2007-12-03"
			}, {
				id: "21",
				name: "Laptop",
				note: "Long text ",
				stock: "Yes",
				ship: "InTime",
				sdate: "2007-12-03"
			}, {
				id: "22",
				name: "LCD Monitor",
				note: "note3",
				stock: "Yes",
				ship: "TNT",
				sdate: "2007-12-03"
			}, {
				id: "23",
				name: "Speakers",
				note: "note",
				stock: "No",
				ship: "ARAMEX",
				sdate: "2007-12-03"
			}];

			var subgrid_data = [{
				id: "1",
				name: "sub grid item 1",
				qty: 11
			}, {
				id: "2",
				name: "sub grid item 2",
				qty: 3
			}, {
				id: "3",
				name: "sub grid item 3",
				qty: 12
			}, {
				id: "4",
				name: "sub grid item 4",
				qty: 5
			}, {
				id: "5",
				name: "sub grid item 5",
				qty: 2
			}, {
				id: "6",
				name: "sub grid item 6",
				qty: 9
			}, {
				id: "7",
				name: "sub grid item 7",
				qty: 3
			}, {
				id: "8",
				name: "sub grid item 8",
				qty: 8
			}];

			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";

				var parent_column = $(grid_selector).closest('[class*="col-"]');
				//resize to fit page size
				$(window).on('resize.jqGrid', function() {
					$(grid_selector).jqGrid('setGridWidth', parent_column.width());
				})

				//resize on sidebar collapse/expand
				$(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed) {
					if(event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid('setGridWidth', parent_column.width());
						}, 20);
					}
				})

				//if your grid is inside another element, for example a tab pane, you should use its parent's width:
				/**
				$(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
				//and also set width when tab pane becomes visible
				$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  if($(e.target).attr('href') == '#mygrid') {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				  }
				})
				*/

				jQuery(grid_selector).jqGrid({
					//direction: "rtl",

					//subgrid options
					subGrid: true,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions: {
						plusicon: "ace-icon fa fa-plus center bigger-110 blue",
						minusicon: "ace-icon fa fa-minus center bigger-110 blue",
						openicon: "ace-icon fa fa-chevron-right center orange"
					},
					//for this example we are using local data
					subGridRowExpanded: function(subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No', 'Item Name', 'Qty'],
							colModel: [{
								name: 'id',
								width: 50
							}, {
								name: 'name',
								width: 150
							}, {
								name: 'qty',
								width: 50
							}]
						});
					},

					data: grid_data,
					datatype: "local",
					height: 250,
					colNames: [' ', 'ID', 'Last Sales', 'Name', 'Stock', 'Ship via', 'Notes'],
					colModel: [{
						name: 'myac',
						index: '',
						width: 80,
						fixed: true,
						sortable: false,
						resize: false,
						formatter: 'actions',
						formatoptions: {
							keys: true,
							//delbutton: false,//disable delete button

							delOptions: {
								recreateForm: true,
								beforeShowForm: beforeDeleteCallback
							},
							//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
						}
					}, {
						name: 'id',
						index: 'id',
						width: 60,
						sorttype: "int",
						editable: true
					}, {
						name: 'sdate',
						index: 'sdate',
						width: 90,
						editable: true,
						sorttype: "date",
						unformat: pickDate
					}, {
						name: 'name',
						index: 'name',
						width: 150,
						editable: true,
						editoptions: {
							size: "20",
							maxlength: "30"
						}
					}, {
						name: 'stock',
						index: 'stock',
						width: 70,
						editable: true,
						edittype: "checkbox",
						editoptions: {
							value: "Yes:No"
						},
						unformat: aceSwitch
					}, {
						name: 'ship',
						index: 'ship',
						width: 90,
						editable: true,
						edittype: "select",
						editoptions: {
							value: "FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"
						}
					}, {
						name: 'note',
						index: 'note',
						width: 150,
						sortable: false,
						editable: true,
						edittype: "textarea",
						editoptions: {
							rows: "2",
							cols: "10"
						}
					}],

					viewrecords: true,
					rowNum: 10,
					rowList: [10, 20, 30],
					pager: pager_selector,
					altRows: true,
					//toppager: true,

					multiselect: true,
					//multikey: "ctrlKey",
					multiboxonly: true,

					loadComplete: function() {
						var table = this;
						setTimeout(function() {
							styleCheckbox(table);

							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},

					editurl: "./dummy.php", //nothing is saved
					caption: "jqGrid with inline editing"

					//,autowidth: true,

					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/

				});
				$(window).triggerHandler('resize.jqGrid'); //trigger window resize to make the grid get the correct size

				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});

				//switch element when editing inline
				function aceSwitch(cellvalue, options, cell) {
					setTimeout(function() {
						$(cell).find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate(cellvalue, options, cell) {
					setTimeout(function() {
						$(cell).find('input[type=text]')
							.datepicker({
								format: 'yyyy-mm-dd',
								autoclose: true
							});
					}, 0);
				}

				//navButtons
				jQuery(grid_selector).jqGrid('navGrid', pager_selector, { //navbar options
					edit: true,
					editicon: 'ace-icon fa fa-pencil blue',
					add: true,
					addicon: 'ace-icon fa fa-plus-circle purple',
					del: true,
					delicon: 'ace-icon fa fa-trash-o red',
					search: true,
					searchicon: 'ace-icon fa fa-search orange',
					refresh: true,
					refreshicon: 'ace-icon fa fa-refresh green',
					view: true,
					viewicon: 'ace-icon fa fa-search-plus grey',
				}, {
					//edit record form
					//closeAfterEdit: true,
					//width: 700,
					recreateForm: true,
					beforeShowForm: function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				}, {
					//new record form
					//width: 700,
					closeAfterAdd: true,
					recreateForm: true,
					viewPagerButtons: false,
					beforeShowForm: function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				}, {
					//delete record form
					recreateForm: true,
					beforeShowForm: function(e) {
						var form = $(e[0]);
						if(form.data('styled')) return false;

						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_delete_form(form);

						form.data('styled', true);
					},
					onClick: function(e) {
						//alert(1);
					}
				}, {
					//search form
					recreateForm: true,
					afterShowSearch: function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						style_search_form(form);
					},
					afterRedraw: function() {
						style_search_filters($(this));
					},
					multipleSearch: true,
					/**
					multipleGroup:true,
					showQuery: true
					*/
				}, {
					//view record form
					recreateForm: true,
					beforeShowForm: function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					}
				})

				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({
						format: 'yyyy-mm-dd',
						autoclose: true
					})

					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
					//don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
					//.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide(); //ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
				}

				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide(); //ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}

				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}

				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}

				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;

					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);

					form.data('styled', true);
				}

				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}

				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
					/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}

				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}

				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = {
						'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function() {
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

						if($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
					})
				}

				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({
						container: 'body'
					});
					$(table).find('.ui-pg-div').tooltip({
						container: 'body'
					});
				}

				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

				$(document).one('ajaxloadstart.page', function(e) {
					$.jgrid.gridDestroy(grid_selector);
					$('.ui-jqdialog').remove();
				});

			});
		</script>
	</body>
</html>
