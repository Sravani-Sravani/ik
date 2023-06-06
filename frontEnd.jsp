<%@page import="com.liferay.portal.kernel.dao.orm.RestrictionsFactoryUtil"%>
<%@page import="com.liferay.portal.kernel.dao.orm.DynamicQuery"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>   
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.kpmg.citizenTables.service.InfraKnowledgeSubCategoryLocalServiceUtil"%>
<%@page import="com.kpmg.citizenTables.service.InfraKnowledgeCategoryLocalServiceUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.kpmg.infraknowledge.portlet.InfraKnowledgePortlet"%>
<%@page import="com.kpmg.infraknowledge.constants.InfraKnowledgePortletKeys"%>
<%@page import="com.kpmg.citizenTables.service.InfraKnowledgeLocalServiceUtil"%>
<%@page import="com.kpmg.citizenTables.model.InfraKnowledge"%>
<%@page import="com.kpmg.citizenTables.model.InfraKnowledgeCategory"%>
<%@page import="com.kpmg.citizenTables.model.InfraKnowledgeSubCategory"%>
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
 <%@page import="com.kpmg.citizenTables.service.constants.CustomTablePortletKeys"%>
 <section class="top_innerBanner ">
<div class="container top_bannerImg d-flex align-items-center flex-wrap">
			<div class="me-auto"><h1>Infra Knowledge Hub</h1></div>
			<nav style="--bs-breadcrumb-divider: '>';">
			  <ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active">Infra Knowledge Hub</li>
			  </ol>
			</nav>
		</div>	
</section>
<main class="main_innerlayout">

<section>
		<div class="container resources_link">
				<ul class="nav nav-pills d-none d-lg-flex" id="myTab" role="tablist">
				<% 
List<InfraKnowledgeCategory> ik=null;
				String tab="";
				long cid=0L;
  try{
		 ik =InfraKnowledgeCategoryLocalServiceUtil.getInfraKnowledgeCategories(0, InfraKnowledgeCategoryLocalServiceUtil.getInfraKnowledgeCategoriesCount());
  }
  catch(Exception e){
	  e.getMessage();
  }
for(InfraKnowledgeCategory data:ik)
{
	tab=data.getCategoryName();
	cid=data.getCatId();
%>
		  <li class="nav-item" role="presentation">
			<button class="nav-link active" id="one-tab" data-bs-toggle="tab" data-bs-target="#one-tab-pane" type="button" role="tab" aria-controls="one-tab-pane" aria-selected="true"><%=tab %></button>
		  </li>
		
					
		</ul>
				<div class="tab-content accordion" id="myTabContent">
				  <div class="tab-pane fade show active accordion-item" id="one-tab-pane" role="tabpanel" aria-labelledby="one-tab" tabindex="0">

					<h2 class="accordion-header d-lg-none" id="headingOne">
					  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">All</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show  d-lg-block" aria-labelledby="headingOne" data-bs-parent="#myTabContent">
					  <div class="accordion-body">
						 <div class="filter_form">
						  <div class="row">
						<form class="row row-cols-lg-auto align-items-center"> 
						<div class="col-auto">
						  <label  class="form-label"><span class="text-danger">*</span> Select Subsector</label>
							<select class="form-select form-select-sm">
								<option selected>All</option>
								<%
								String options="";
								DynamicQuery dynamicQuery1 = null;
								dynamicQuery1 = InfraKnowledgeSubCategoryLocalServiceUtil.dynamicQuery();
								dynamicQuery1.add(RestrictionsFactoryUtil.eq("catId", cid));
								List<InfraKnowledgeSubCategory> ikc=null;
								try{
									  ikc = InfraKnowledgeSubCategoryLocalServiceUtil.dynamicQuery(dynamicQuery1, 0,
											  InfraKnowledgeSubCategoryLocalServiceUtil.getInfraKnowledgeSubCategoriesCount());
									}
  catch(Exception e){
	  e.getMessage();
  }
for(InfraKnowledgeSubCategory c1:ikc)
{
	options=c1.getSubCategoryName();
%>
								
								<option><%=options %></option>

							</select>	
							  <%} %>
						  </div>
						<div class="col-auto">
						  <label class="form-label"><span class="text-danger">*</span> Select Ministry</label>
							<select class="form-select form-select-sm">
								<option>All</option>
								<option>Ministry </option>
								<option>State</option>
							</select>	
						  </div>
							  </form>		  
						  </div>
					  </div><!--filter-->
	  <div class="row">
	  <div class="col-lg-12"> 
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading blue_leftborder">CENTRAL POLICIES</h4> </div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
  			<div class="container">
  	<div class="resources_scroller">
    <div class="owl-carousel owl-theme scroller">
    <%
								String title="";
								DynamicQuery dq1= null;
								dq1 = InfraKnowledgeLocalServiceUtil.dynamicQuery();
								dq1.add(RestrictionsFactoryUtil.eq("type","CENTRAL POLICIES"));
								List<InfraKnowledge> ikd=null;
								try{
									  ik = InfraKnowledgeLocalServiceUtil.dynamicQuery(dq1, 0,
											  InfraKnowledgeLocalServiceUtil.getInfraKnowledgesCount());
									}
  catch(Exception e){
	  e.getMessage();
  }
for(InfraKnowledge newik:ikd)
{
	try{
	title=newik.getHeadingText();
	}
	catch(Exception e)
	{
		
	}
%>
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		  <p class="card-title"><%=title %></p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
	<%} %>		
	</div><!--Owl Carousel-->
   </div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  <hr class="seperator" />		  
	  <div class="col-lg-12"> 
		  
		  
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading yellow_leftborder">PPP Document Repository</h4></div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
  			<div class="container">
		  <div class="col-lg-3">
		  <label class="form-label"><span class="text-danger">*</span> Document Type</label>
			<select class="form-select form-select-sm">
				<option selected>All</option> 
				<option>Policy</option> 
				<option>Report </option>
				<option>Model Concession Agreement </option>
				<option>Model RFP</option>
			</select>	
		  </div>
			<div class="resources_scroller">	
    <div class="owl-carousel owl-theme scroller">
		<div class="item"><div class="card yellow_gradient">
			<img src="images/news/1.png" class="card-img-top" alt="...">
			<div class="card-body">
			  <p class="card-title">Monetization of Operational National Highways</p>
			<p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/2.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		  <p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Relaxation in technical and financial qualification for bidder...</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
</div><!--Owl Carousel-->
				</div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  </div>
					  </div><!--Accordion Body-->
					</div>

				  </div>
				  <div class="tab-pane fade accordion-item" id="two-tab-pane" role="tabpanel" aria-labelledby="two-tab" tabindex="0">
					<h2 class="accordion-header d-lg-none" id="headingTwo">
					  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						Transport &amp; Logistic
					  </button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse d-lg-block" aria-labelledby="headingTwo" data-bs-parent="#myTabContent">
					   <div class="accordion-body">
						 <div class="filter_form">
		  <div class="row">
		<form class="row row-cols-lg-auto align-items-center"> 
	  	<div class="col-auto">
		  <label  class="form-label"><span class="text-danger">*</span> Select Subsector</label>
			<select class="form-select form-select-sm">
				<option selected>All</option>
				<option>Transport and Logistics</option>
				<option>Energy</option>
				<option>Water and Sanitation</option>
				<option>Communication </option>
				<option>Social Infrastrcuture</option>
				<option>Commercial Infrastructure</option>
				<option>Others</option>
				
			</select>	
		  </div>
		<div class="col-auto">
		  <label class="form-label"><span class="text-danger">*</span> Select Ministry</label>
			<select class="form-select form-select-sm">
				<option>All</option>
				<option>Ministry </option>
				<option>State</option>
			</select>	
		  </div>
			  </form>		  
		  </div>
	  </div><!--filter-->
	  <div class="row">
	 
	  <div class="col-lg-12"> 
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading blue_leftborder">CENTRAL POLICIES</h4> </div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
		  
		  
  			<div class="container">
  	<div class="resources_scroller">
    <div class="owl-carousel owl-theme scroller">
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		  <p class="card-title">Monetization of Operational National Highways</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/2.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Relaxation in technical and financial qualification for bidder...</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->		
	</div><!--Owl Carousel-->
   </div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  <hr class="seperator" />		  
	  <div class="col-lg-12"> 
		  
		  
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading yellow_leftborder">PPP Document Repository</h4></div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
  			<div class="container">
		  <div class="col-lg-3">
		  <label class="form-label"><span class="text-danger">*</span> Document Type</label>
			<select class="form-select form-select-sm">
				<option selected>All</option> 
				<option>Policy</option> 
				<option>Report </option>
				<option>Model Concession Agreement </option>
				<option>Model RFP</option>
			</select>	
		  </div>
			<div class="resources_scroller">	
    <div class="owl-carousel owl-theme scroller">
		<div class="item"><div class="card yellow_gradient">
			<img src="images/news/1.png" class="card-img-top" alt="...">
			<div class="card-body">
			  <p class="card-title">Monetization of Operational National Highways</p>
			<p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/2.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		  <p class="card-link"><a href="#">Download</a></p></div>
		</div>

		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Relaxation in technical and financial qualification for bidder...</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
</div><!--Owl Carousel-->
				</div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  </div>
					  </div><!--Accordion Body-->
					</div>
				  </div>
				  <div class="tab-pane fade accordion-item" id="three-tab-pane" role="tabpanel" aria-labelledby="three-tab" tabindex="0">
					<h2 class="accordion-header d-lg-none" id="headingThree">
					  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						Energy
					  </button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse d-lg-block" aria-labelledby="headingThree" data-bs-parent="#myTabContent">
					   <div class="accordion-body">
						 <div class="filter_form">
		  <div class="row">
		<form class="row row-cols-lg-auto align-items-center"> 
	  	<div class="col-auto">
		  <label  class="form-label"><span class="text-danger">*</span> Select Subsector</label>
			<select class="form-select form-select-sm">
				<option selected>All</option>
				<option>Transport and Logistics</option>
				<option>Energy</option>
				<option>Water and Sanitation</option>
				<option>Communication </option>
				<option>Social Infrastrcuture</option>
				<option>Commercial Infrastructure</option>
				<option>Others</option>
				
			</select>	
		  </div>
		<div class="col-auto">
		  <label class="form-label"><span class="text-danger">*</span> Select Ministry</label>
			<select class="form-select form-select-sm">
				<option>All</option>
				<option>Ministry </option>
				<option>State</option>
			</select>	
		  </div>
			  </form>		  
		  </div>
	  </div><!--filter-->
	  <div class="row">
	 
	  <div class="col-lg-12"> 
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading blue_leftborder">CENTRAL POLICIES</h4> </div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
		  
		  
  			<div class="container">
  	<div class="resources_scroller">
    <div class="owl-carousel owl-theme scroller">
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		  <p class="card-title">Monetization of Operational National Highways</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/2.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Relaxation in technical and financial qualification for bidder...</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->
		<div class="item"><div class="card">
		<img src="images/news/1.png" class="card-img-top" alt="...">
		<div class="card-body">
		<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		<p class="card-link"><a href="#">Download</a></p></div>
		</div>
		</div><!--item-->		
	</div><!--Owl Carousel-->
   </div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  <hr class="seperator" />		  
	  <div class="col-lg-12"> 
		  
		  
		  <div class="container d-flex align-items-center flex-wrap">
			<div class="me-auto"><h4 class="subheading yellow_leftborder">PPP Document Repository</h4></div>
			<a href="#" class="btnview_sm">View All</a>
		</div>
		  
  			<div class="container">
		  <div class="col-lg-3">
		  <label class="form-label"><span class="text-danger">*</span> Document Type</label>
			<select class="form-select form-select-sm">
				<option selected>All</option> 
				<option>Policy</option> 
				<option>Report </option>
				<option>Model Concession Agreement </option>
				<option>Model RFP</option>
			</select>	
		  </div>
			<div class="resources_scroller">	
    <div class="owl-carousel owl-theme scroller">
		<div class="item"><div class="card yellow_gradient">
			<img src="images/news/1.png" class="card-img-top" alt="...">
			<div class="card-body">
			  <p class="card-title">Monetization of Operational National Highways</p>
			<p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/2.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		  <p class="card-link"><a href="#">Download</a></p></div>
		</div>

		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Relaxation in technical and financial qualification for bidder...</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
		<div class="item"><div class="card yellow_gradient">
		  <img src="images/news/1.png" class="card-img-top" alt="...">
		  <div class="card-body">
			<p class="card-title text-truncate">Bharatmala Pariyojana</p>
		 <p class="card-link"><a href="#">Download</a></p></div>
		  </div>
		</div><!--item-->
</div><!--Owl Carousel-->
				</div>
  </div><!--Container-->
		</div><!--Central Policies-->
	  </div>
					  </div><!--Accordion Body-->
					</div>
				  </div>
				</div>
						<%} %>			
				
		</div>
		
	</section>
	</main>