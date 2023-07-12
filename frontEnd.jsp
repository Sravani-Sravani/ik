<div id="member-fields">
    <% if (eventId == 0) { %>
        <div class="lfr-form-row lfr-form-row-inline">
            <div class="form-group">
                <aui:input fieldParam="youtubeLink0" id="youtubeLink0" name="youtubeLink0" label="YouTube Link" />
            </div>
        </div>
    <% } else { %>
        <% 
            List<YouTubeLinks> yl = YouTubeLinksLocalServiceUtil.getByEventId(eventId);
            for (YouTubeLinks youtubeLink : yl) {
        %>
            <div class="lfr-form-row lfr-form-row-inline">
                <div class="form-group">
                    <aui:input fieldParam="youtubeLink<%= youtubeLink.getLinkId() %>" id="youtubeLink<%= youtubeLink.getLinkId() %>" name="youtubeLink<%= youtubeLink.getLinkId() %>" label="YouTube Link" value="<%= youtubeLink.getYoutubelink() %>" />
                </div>
            </div>
        <% } %>
    <% } %>
</div>
