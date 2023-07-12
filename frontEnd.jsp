
if(eventId>0)
       {
    	   //YouTubeLinksLocalServiceUtil.deleteByEventId(eventId);
    	   String rowIndexes = request.getParameter("rowIndexes");
           System.out.println("Updated Total String:"+rowIndexes);
           String[] indexOfRows = rowIndexes.split(",");
           System.out.println(" Updated Total Length:"+indexOfRows.length);
           String YoutubeLink="";
           for (int i = 0; i < indexOfRows.length; i++) {
               YoutubeLink = request.getParameter("firstName"+ indexOfRows[i]);
               _log.info("::::::::::::YouTube Links:::::::::::::: "+i +"th Link: "+ YoutubeLink);
                  YouTubeLinks yt=new YouTubeLinksImpl();
    			  long yid= CounterLocalServiceUtil.increment(YouTubeLinks.class.getName());
    			  yt.setLinkId(yid);
    			 yt.setYoutubelink(YoutubeLink);
    			 yt.setEventId(eventId);
    			  yt.setCreatedBy(userId); 
    			  yt.setCreatedDate(new Date());
    			 yt.setModifiedDate(new Date()); 
                  yt=YouTubeLinksLocalServiceUtil.addYouTubeLinks(yt);
           }
           
       }
       else {
       String rowIndexes = request.getParameter("rowIndexes");
       System.out.println("Total String:"+rowIndexes);
       String[] indexOfRows = rowIndexes.split(",");
       System.out.println("Total Length:"+indexOfRows.length);
       String YoutubeLink="";
       for (int i = 0; i < indexOfRows.length; i++) {
           YoutubeLink = request.getParameter("firstName"+ indexOfRows[i]);
           _log.info("::::::::::::YouTube Links:::::::::::::: "+i +"th Link: "+ YoutubeLink);
              YouTubeLinks yt=new YouTubeLinksImpl();
			  long yid= CounterLocalServiceUtil.increment(YouTubeLinks.class.getName());
			  yt.setLinkId(yid);
			 yt.setYoutubelink(YoutubeLink);
			 yt.setEventId(eventId);
			  yt.setCreatedBy(userId); 
			  yt.setCreatedDate(new Date());
			 yt.setModifiedDate(new Date()); 
              yt=YouTubeLinksLocalServiceUtil.addYouTubeLinks(yt);
       }
       }

<div id="member-fields">
    <% if (eventId == 0) { %>
        <div class="lfr-form-row lfr-form-row-inline">
            <div class="form-group">
                <aui:input fieldParam="firstName0" id="firstName0" name="firstName0" label="YouTube Link" />
            </div>
        </div>
    <% } else { %>
        <% 
            List<YouTubeLinks> yl = YouTubeLinksLocalServiceUtil.findByeventId(eventId);
            int index=0;    
        for (YouTubeLinks youtubeLink : yl) {
        	System.out.println("Update Form Youtube Link:"+youtubeLink.getYoutubelink());
        %>
            <div class="lfr-form-row lfr-form-row-inline">
                <div class="form-group">
                    <aui:input fieldParam="firstName<%= index%>" id="firstName<%= index%>" name="firstName<%= index%>" label="YouTube Link" value="<%= youtubeLink.getYoutubelink() %>" />
                </div>
            </div>
        <% } %>
    <% } %>
</div>
