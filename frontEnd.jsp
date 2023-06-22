<%@page import="com.liferay.portal.kernel.dao.orm.RestrictionsFactoryUtil"%>
<%@page import="com.liferay.portal.kernel.dao.orm.DynamicQuery"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>   
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import ="com.liferay.portal.kernel.dao.orm.OrderFactoryUtil"%>;
<%@page import="com.kpmg.citizenTables.model.Ministry"%>
<%@page import="com.kpmg.citizenTables.service.MinistryLocalServiceUtil"%>
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
 <portlet:resourceURL var="getMinistryOption"></portlet:resourceURL>
 <section class="top_innerBanner " style="margin-top: -81px !important;">
<div class="container top_bannerImg d-flex align-items-center flex-wrap">
			<div class="me-auto"><h1>Knowledge Resources</h1></div>
			<nav style="--bs-breadcrumb-divider: '>';">
			  <ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active">Knowledge Resources</li>
			  </ol>
			</nav>
		</div>	
</section>

<main class="main_innerlayout">
    <section>
        <div class="container resources_link">
            <ul class="nav nav-pills d-none d-lg-flex" id="myTab" role="tablist">
                <% 
                int tabIndex = 0;
                List<InfraKnowledgeCategory> ik = null;
                String tab = "";
                String type="";
                long cid = 0L;
                DynamicQuery dyq = null;
                try {
                	dyq = InfraKnowledgeCategoryLocalServiceUtil.dynamicQuery();
                    dyq.addOrder(OrderFactoryUtil.asc("catId"));
                    ik = InfraKnowledgeCategoryLocalServiceUtil.dynamicQuery(dyq, 0,
                            InfraKnowledgeCategoryLocalServiceUtil.getInfraKnowledgeCategoriesCount());
                } catch (Exception e) {
                    e.getMessage();
                }
                if (ik != null) {
                    for (InfraKnowledgeCategory data : ik) {
                        tab = data.getCategoryName();
                        cid = data.getCatId();
                %>
                <li class="nav-item" role="presentation">
                
                    <button class="nav-link <%=tabIndex==0?"active":"" %>" id="tab-<%=cid%>" data-bs-toggle="tab" data-bs-target="#tab-pane-<%=cid %>" type="button" role="tab" aria-controls="tab-pane-<%=cid %>" aria-selected="<%=tabIndex==0?"true":"false" %>"><%=tab %></button>
                </li>
                <% tabIndex++; } } %>
            </ul>
            <div class="tab-content accordion" id="myTabContent">
                <%
                int innerTabIndex = 0;
                for (InfraKnowledgeCategory data : ik) {
                  
                    tab = data.getCategoryName();
                    cid = data.getCatId();
                    System.out.println(tab);
                    System.out.println(cid);
                %>
                <div class="tab-pane fade <%if(innerTabIndex==0){%>show active<%} %> accordion-item" id="tab-pane-<%=cid %>" role="tabpanel" aria-labelledby="tab-<%=cid %>" tabindex="0">
                    
                    <%-- <h2 class="accordion-header d-lg-none" id="heading<%=cid%>">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%=cid %>" aria-expanded="true" aria-controls="collapse<%=cid %>">All</button>
                    </h2> --%>
                    <div id="collapse<%=cid %>" class="accordion-collapse collapse show d-lg-block" aria-labelledby="heading<%=cid %>" data-bs-parent="#myTabContent">
                    <%if(cid==1){ 
                    	System.out.println("Inside All");
                    	 System.out.println("tab:"+tab);
                         System.out.println("cid:"+cid);
                         type="PAG";
                    	%>
                    <div class="accordion-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container d-flex align-items-center flex-wrap">
                                        <div class="me-auto"><h4 class="subheading blue_leftborder">POLICIES AND GUIDELINES</h4></div>
                                        <a href="/knowledgeresourcesdetails?tab=<%=cid%>&type=<%=type%>" target="_blank" class="btnview_sm">View All</a>
                                    </div>

                                    <div class="container">
                                        <div class="resources_scroller">
                                            <div class="owl-carousel owl-theme scroller">
                                                <%
                                                
                                                String title = "";
                                                String fileUrl = "";
                                                String fileUrl1 = "";
                                                DynamicQuery dq1 = InfraKnowledgeLocalServiceUtil.dynamicQuery();
                                                dq1.add(RestrictionsFactoryUtil.eq("type", "CENTRAL POLICIES"));
                                             //   dq1.add(RestrictionsFactoryUtil.eq("cateId", cid));
                                                List<InfraKnowledge> ikd = null;
                                                try {
                                                    ikd = InfraKnowledgeLocalServiceUtil.dynamicQuery(dq1, 0,
                                                            InfraKnowledgeLocalServiceUtil.getInfraKnowledgesCount());
                                                } catch (Exception e) {
                                                    e.getMessage();
                                                }
                                                System.out.println("Size----------"+ikd.size());
                                                for (InfraKnowledge newik : ikd) {
                                                    try {
                                                        title = newik.getHeadingText();
                                                        System.out.println(title);
                                                    } catch (Exception e) {
                                                    }
                                                    long fileEntryId = newik.getThumbnailfileEntryId();
                                                    if (fileEntryId != 0L) {
                                                        try {
                                                            fileUrl = InfraKnowledgePortlet.getFile(fileEntryId, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                    long fileEntryId1 = newik.getFileEntryId();
                                                    if (fileEntryId1 != 0L) {
                                                        try {
                                                            fileUrl1 = InfraKnowledgePortlet.getFile(fileEntryId1, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                %>
                                                <div class="item">
                                                    <div class="card">
                                                        <img src="<%=fileUrl %>" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title"><%=title %></p>
                                                            <p class="card-link"><a href="<%=fileUrl1%>?download=true">Download</a></p>
                                                        </div>
                                                    </div>
                                                </div><!-- item -->
                                                <% } %>
                                            </div><!-- Owl Carousel -->
                                        </div>
                                    </div><!-- Container -->
                                </div><!-- Central Policies -->
                            </div><!-- row -->
                            <hr class="seperator" />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container d-flex align-items-center flex-wrap">
                                    <%type="IFS"; %>
                                        <div class="me-auto"><h4 class="subheading yellow_leftborder">IFS Document Repository</h4></div>
                                        <a href="/knowledgeresourcesdetails?tab=<%=cid%>&type=<%=type%>" target="_blank" class="btnview_sm">View All</a>
                                    </div>

                                    <div class="container">
                                       <!--  <div class="col-lg-3">
                                            <label class="form-label"><span class="text-danger">*</span> Document Type</label>
                                            <select class="form-select form-select-sm">
                                                <option selected>All</option>
                                                <option>Policy</option>
                                                <option>Report</option>
                                                <option>Model Concession Agreement</option>
                                                <option>Model RFP</option>
                                            </select>
                                        </div> -->
                                        <div class="resources_scroller">
                                            <div class="owl-carousel owl-theme scroller">
                                                <%
                                                String title1 = "";
                                                String fileUrl2 = "";
                                                String fileUrl3 = "";
                                                DynamicQuery dqt1 = InfraKnowledgeLocalServiceUtil.dynamicQuery();
                                                dqt1.add(RestrictionsFactoryUtil.eq("type", "PPP DOCUMENT REPOSITORY"));
                                               //dq2.add(RestrictionsFactoryUtil.eq("cateId", cid));
                                                List<InfraKnowledge> ikd1 = null;
                                                try {
                                                    ikd1 = InfraKnowledgeLocalServiceUtil.dynamicQuery(dqt1, 0,
                                                            InfraKnowledgeLocalServiceUtil.getInfraKnowledgesCount());
                                                } catch (Exception e) {
                                                    e.getMessage();
                                                }
                                                System.out.println("size PPP------------"+ikd1.size());
                                                System.out.println("C ID------------"+cid);
                                                for (InfraKnowledge newik1 : ikd1) {
                                                    try {
                                                        title1 = newik1.getHeadingText();
                                                    } catch (Exception e) {
                                                    }
                                                    long fileEntryId2 = newik1.getThumbnailfileEntryId();
                                                    if (fileEntryId2 != 0L) {
                                                        try {
                                                            fileUrl2 = InfraKnowledgePortlet.getFile(fileEntryId2, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                    long fileEntryId3 = newik1.getFileEntryId();
                                                    if (fileEntryId3 != 0L) {
                                                        try {
                                                            fileUrl3 = InfraKnowledgePortlet.getFile(fileEntryId3, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                %>
                                                <div class="item">
                                                    <div class="card">
                                                        <img src="<%=fileUrl2 %>" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title"><%=title1 %></p>
                                                            <p class="card-link"><a href="<%=fileUrl3%>?download=true">Download</a></p>
                                                        </div>
                                                    </div>
                                                </div><!-- item -->
                                                <% } %>
                                            </div><!-- Owl Carousel -->
                                        </div>
                                    </div><!-- Container -->
                                </div><!-- PPP Document Repository -->
                            </div><!-- row -->
                        </div>
                        <%}else{ 
                        System.out.println(cid);
                        System.out.println(tab);
                        long subcatid=0l;
                        long ministry1=0l;
                        type="PAG";
                        %>
                    
                    
                    <div class="accordion-body">
                            <div class="filter_form">
                                <div class="row">
                                    <div class="col-auto">
                                        <label class="form-label"><span class="text-danger">*</span>Select Subsector</label>
                                        <select  name="subCatId" onchange="getMinistry1(this.value);" value="<%=subcatid%> class="form-select form-select-sm">
                                         <option selected="true" value="-1">All</option>
                                            <% String options = "";
                                            DynamicQuery dynamicQuery1 = InfraKnowledgeSubCategoryLocalServiceUtil.dynamicQuery();
                                            dynamicQuery1.add(RestrictionsFactoryUtil.eq("catId", cid));
                                            List<InfraKnowledgeSubCategory> ikc = null;
                                            try {
                                                ikc = InfraKnowledgeSubCategoryLocalServiceUtil.dynamicQuery(dynamicQuery1, 0,
                                                        InfraKnowledgeSubCategoryLocalServiceUtil.getInfraKnowledgeSubCategoriesCount());
                                            } catch (Exception e) {
                                                e.getMessage();
                                            }
                                            for (InfraKnowledgeSubCategory c1 : ikc) {
                                                options = c1.getSubCategoryName();
                                                subcatid=c1.getSubcatId();
                                            %>
                                            <option value="<%=subcatid%>"><%=options %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-auto">
                                        <label class="form-label"><span class="text-danger">*</span>Select Ministry</label>
                                        <aui:select name="ministry1" class="form-select form-select-sm">
                                        <aui:option selected="true" value="-1">All</aui:option>
                                        </aui:select>
                                    </div>
                                </div>
                            </div><!-- filter -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container d-flex align-items-center flex-wrap">
                                        <div class="me-auto"><h4 class="subheading blue_leftborder">POLICIES AND GUIDELINES</h4></div>
                                        <a href="/knowledgeresourcesdetails?tab=<%=cid%>&type=<%=type%>" target="_blank" class="btnview_sm">View All</a>
                                    </div>

                                    <div class="container">
                                        <div class="resources_scroller">
                                            <div class="owl-carousel owl-theme scroller">
                                                <%
                                                String title = "";
                                                String fileUrl = "";
                                                String fileUrl1 = "";
                                                DynamicQuery dq1 = InfraKnowledgeLocalServiceUtil.dynamicQuery();
                                                dq1.add(RestrictionsFactoryUtil.eq("type", "CENTRAL POLICIES"));
                                                dq1.add(RestrictionsFactoryUtil.eq("cateId", cid));
                                                List<InfraKnowledge> ikd = null;
                                                try {
                                                    ikd = InfraKnowledgeLocalServiceUtil.dynamicQuery(dq1, 0,
                                                            InfraKnowledgeLocalServiceUtil.getInfraKnowledgesCount());
                                                } catch (Exception e) {
                                                    e.getMessage();
                                                }
                                                System.out.println(cid+"Size:-----"+ikd.size());
                                                for (InfraKnowledge newik : ikd) {
                                                    try {
                                                        title = newik.getHeadingText();
                                                    } catch (Exception e) {
                                                    }
                                                    long fileEntryId = newik.getThumbnailfileEntryId();
                                                    if (fileEntryId != 0L) {
                                                        try {
                                                            fileUrl = InfraKnowledgePortlet.getFile(fileEntryId, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                    long fileEntryId1 = newik.getFileEntryId();
                                                    if (fileEntryId1 != 0L) {
                                                        try {
                                                            fileUrl1 = InfraKnowledgePortlet.getFile(fileEntryId1, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                %>
                                                <div class="item">
                                                    <div class="card">
                                                        <img src="<%=fileUrl %>" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title"><%=title %></p>
                                                            <p class="card-link"><a href="<%=fileUrl1%>?download=true">Download</a></p>
                                                        </div>
                                                    </div>
                                                </div><!-- item -->
                                                <% } %>
                                            </div><!-- Owl Carousel -->
                                        </div>
                                    </div><!-- Container -->
                                </div><!-- Central Policies -->
                            </div><!-- row -->
                            <hr class="seperator" />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="container d-flex align-items-center flex-wrap">
                                     <%type="IFS"; %>
                                        <div class="me-auto"><h4 class="subheading yellow_leftborder">IFS Document Repository</h4></div>
                                        <a href="/knowledgeresourcesdetails?tab=<%=cid%>&type=<%=type%>" target="_blank" class="btnview_sm">View All</a>
                                    </div>

                                    <div class="container">
                                       <!--  <div class="col-lg-3">
                                            <label class="form-label"><span class="text-danger">*</span> Document Type</label>
                                            <select class="form-select form-select-sm">
                                                <option selected>All</option>
                                                <option>Policy</option>
                                                <option>Report</option>
                                                <option>Model Concession Agreement</option>
                                                <option>Model RFP</option>
                                            </select>
                                        </div> -->
                                        <div class="resources_scroller">
                                            <div class="owl-carousel owl-theme scroller">
                                                <%
                                                String title1 = "";
                                                String fileUrl2 = "";
                                                String fileUrl3 = "";
                                                DynamicQuery dq2 = InfraKnowledgeLocalServiceUtil.dynamicQuery();
                                                dq2.add(RestrictionsFactoryUtil.eq("type", "PPP DOCUMENT REPOSITORY"));
                                                dq2.add(RestrictionsFactoryUtil.eq("cateId", cid));
                                                List<InfraKnowledge> ikd1 = null;
                                                try {
                                                    ikd1 = InfraKnowledgeLocalServiceUtil.dynamicQuery(dq2, 0,
                                                            InfraKnowledgeLocalServiceUtil.getInfraKnowledgesCount());
                                                } catch (Exception e) {
                                                    e.getMessage();
                                                }
                                                System.out.println(cid+"Size:----- PPP"+ikd.size());
                                                for (InfraKnowledge newik1 : ikd1) {
                                                    try {
                                                        title1 = newik1.getHeadingText();
                                                    } catch (Exception e) {
                                                    }
                                                    long fileEntryId2 = newik1.getThumbnailfileEntryId();
                                                    if (fileEntryId2 != 0L) {
                                                        try {
                                                            fileUrl2 = InfraKnowledgePortlet.getFile(fileEntryId2, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                    long fileEntryId3 = newik1.getFileEntryId();
                                                    if (fileEntryId3 != 0L) {
                                                        try {
                                                            fileUrl3 = InfraKnowledgePortlet.getFile(fileEntryId3, themeDisplay.getScopeGroupId());
                                                        } catch (Exception e) {
                                                        }
                                                    }
                                                %>
                                                <div class="item">
                                                    <div class="card">
                                                        <img src="<%=fileUrl2 %>" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title"><%=title1 %></p>
                                                            <p class="card-link"><a href="<%=fileUrl3%>?download=true">Download</a></p>
                                                        </div>
                                                    </div>
                                                </div><!-- item -->
                                                <% } %>
                                            </div><!-- Owl Carousel -->
                                        </div>
                                    </div><!-- Container -->
                                </div><!-- PPP Document Repository -->
                            </div><!-- row -->
                        </div><%}%><!-- Accordion Body -->
                    </div><!-- Accordion Collapse -->
                </div><!-- Accordion Item -->
                <% innerTabIndex++; } %>
            </div><!-- tab-content -->
        </div><!-- container -->
    </section>
</main>
<script>
function getMinistry1(subcategoryId){alert(subcategoryId);
AUI().use('aui-base','aui-io-request-deprecated', 'aui-node', function(A){
 A.io.request('<%=getMinistryOption.toString() %>',{
 dataType : 'json',
 method : 'POST',
 data : {

<portlet:namespace />subcategoryId :subcategoryId,
	<portlet:namespace />cmd:'getministries1'
 },
 on : {
 success : function() {

	                       var data=this.get('responseData');
                            console.log(data);
                            var textElement="";
                            textElement= textElement+"<option value=''>All</option>";
                            $('#<portlet:namespace />ministry1').html("");
                            jQuery.each(data, function(i, val) {
                            textElement=textElement+"<option value='" + val.id + "'>"+ val.name + "</option>";
                           });
                            $('#<portlet:namespace />ministry1').append(textElement);
                            }  
 }
 });
 });
 //$("select").select2();
}
</script>
