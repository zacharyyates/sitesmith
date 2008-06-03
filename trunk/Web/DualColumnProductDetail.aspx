<%@ Page Language="C#" MasterPageFile="~/FCF.master" AutoEventWireup="true" CodeBehind="DualColumnProductDetail.aspx.cs" Inherits="YatesMorrison.SiteSmith.Web.DualColumnProductDetail" Title="Untitled Page" %>
<%@ Register Src="~/Controls/BlockProductDetailControl.ascx" TagPrefix="SiteSmith" TagName="BlockProductDetailControl" %>
<asp:Content ID="cCenter" ContentPlaceHolderID="cphMainContentCenter" runat="server">
	<div class="LeftColumn">
		<SiteSmith:BlockProductDetailControl ID="bpdcMain" runat="server" />
	</div>
	<div class="RightColumn">
		
	</div>
</asp:Content>
<asp:Content ID="cRight" ContentPlaceHolderID="cphMainContentRight" runat="server">
</asp:Content>