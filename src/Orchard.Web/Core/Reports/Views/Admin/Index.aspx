﻿<%@ Page Language="C#" Inherits="Orchard.Mvc.ViewPage<ReportsAdminIndexViewModel>" %>
<%@ Import Namespace="Orchard.Core.Reports.ViewModels"%>
<h1><%: Html.TitleForPage(T("Manage Reports").ToString())%></h1>
<% using(Html.BeginFormAntiForgeryPost()) { %>
	<%: Html.ValidationSummary() %>
	<fieldset>
	    <table class="items" summary="<%: T("This is a table of the reports in your application") %>">
		    <colgroup>
			    <col id="Col1" />
			    <col id="Col2" />
			    <col id="Col3" />
			    <col id="Col4" />
		    </colgroup>
		    <thead>
			    <tr>
				    <th scope="col"><%: T("Name")%></th>
				    <th scope="col"><%: T("Title")%></th>
				    <th scope="col"><%: T("Date")%></th>
				    <th scope="col"></th>
			    </tr>
		    </thead>
            <%
                foreach (var report in Model.Reports) {
            %>
            <tr>
                <td>
                    <%: Html.ActionLink(Html.Encode(report.ActivityName), "Display", new {id = report.ReportId}) %>
                </td>
                <td>
                    <%:report.Title%>
                </td>
                <td>
                    <%:report.Utc.ToLocalTime().ToShortDateString()%> <%:report.Utc.ToLocalTime().ToShortTimeString()%>
                </td>
            </tr>
            <%
                }%>
        </table>
    </fieldset>
<% } %>