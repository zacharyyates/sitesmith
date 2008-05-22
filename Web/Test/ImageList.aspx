<%@ Page Language="C#" MasterPageFile="~/FCF.master" AutoEventWireup="true" CodeBehind="ImageList.aspx.cs" Inherits="YatesMorrison.SiteSmith.Web.Test.ImageList" Title="Untitled Page" %>
<%@ Register Namespace="YatesMorrison.SiteSmith.Web.Controls" Assembly="SiteSmith.Web" TagPrefix="SiteSmith" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContentCenter" runat="server">
	<SiteSmith:ImageList runat="server" ID="ilTest" ImageSize="Original"></SiteSmith:ImageList>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContentRight" runat="server">
</asp:Content>