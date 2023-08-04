<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>

<portlet:defineObjects />

<aui:form action="<%= samplePortletURL %>" method="post" onkeypress="return stopEnterSubmit(event)">
    <aui:input label="Name" name="name" />
    <aui:input label="Email" name="email" type="email" />
    <aui:input label="Age" name="age" type="number" />
    <aui:button-row>
        <aui:button type="submit" value="Submit" />
    </aui:button-row>
</aui:form>

<script>
    function stopEnterSubmit(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            return false;
        }
        return true;
    }
</script>
