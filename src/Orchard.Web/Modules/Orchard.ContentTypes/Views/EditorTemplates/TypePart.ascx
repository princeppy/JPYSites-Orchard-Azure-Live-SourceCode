﻿<%@ Control Language="C#" Inherits="Orchard.Mvc.ViewUserControl<Orchard.ContentTypes.ViewModels.EditTypePartViewModel>" %>
    <fieldset class="manage-part" itemscope="itemscope" itemid="<%:Model.PartDefinition.Name %>" itemtype="http://orchardproject.net/data/ContentTypePart">
        <h3 itemprop="Name"><%:Model.PartDefinition.DisplayName %></h3>
        <div class="manage">
            <%:Html.ActionLink(T("Remove").Text, "RemovePartFrom", new { area = "Orchard.ContentTypes", id = Model.Type.Name, Model.PartDefinition.Name }, new { itemprop = "RemoveUrl UnsafeUrl" })%><%--// <- some experimentation--%>
        </div>
        <div class="details"><%:Html.EditorFor(m => m.PartDefinition.Fields, "TypePartFields", "PartDefinition")
        %><%
        if (Model.Templates.Any()) { %>
        <div class="settings">
            <h4><%:T("{0} Settings:", Model.PartDefinition.DisplayName) %></h4><%
        Html.RenderTemplates(Model.Templates); %>
        </div><%
        } %>
        <%-- don't show global part settings for now - <%:Html.DisplayFor(m => m.PartDefinition.Settings, "Settings", "PartDefinition")
        %>--%><%:Html.HiddenFor(m => m.PartDefinition.Name)
        %><%:Html.HiddenFor(m => m.Index) %>
        </div>
    </fieldset>