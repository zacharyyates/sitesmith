<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="YatesMorrison.SiteSmith.Web.Admin.Products.Default"
	MasterPageFile="~/FCF.master"
	Title="Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContentCenter" runat="server">
	<div>
		Create a New Product
	</div>
	<div>
		<asp:Button ID="bNew" runat="server" Text="New &gt;" onclick="bNew_Click" />
	</div>
	<div>
		Search for Existing Products
	</div>
	<div>
		<asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="bSearch" runat="server" Text="Search" />
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContentRight" runat="server">
</asp:Content>
