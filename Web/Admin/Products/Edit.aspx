<%@ Page Language="C#" CodeBehind="Edit.aspx.cs" Inherits="YatesMorrison.SiteSmith.Web.Admin.Products.Edit" AutoEventWireup="true" 
	MasterPageFile="~/FCF.master" 	
	Title="Products > Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContentCenter" runat="server">
	<div>Name</div>
	<div>
		<asp:TextBox ID="tbName" runat="server"></asp:TextBox>
	</div>
	<div>Description</div>
	<div>
		<asp:TextBox ID="tbDescription" runat="server"></asp:TextBox>
	</div>
	<div>Manufacturer</div>
	<div>
		<asp:DropDownList ID="ddlManufacturer" runat="server"></asp:DropDownList>
	</div>
	<div>Tags</div>
	<div>
	<div>
		<asp:GridView ID="gvTags" runat="server" AutoGenerateColumns="false" 
			OnRowCommand="gvTags_RowCommand" DataKeyNames="Id" ShowHeader="false">
			<Columns>
				<asp:BoundField DataField="Name" />
				<asp:TemplateField>
					<ItemTemplate>
						<asp:LinkButton ID="lbDelete" Text="Delete" runat="server" CommandName="DeleteTag" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		</div>
		<div>
			<asp:TextBox ID="tbTag" runat="server"></asp:TextBox>&nbsp;<asp:Button 
				ID="bAddTag" Text="Add" runat="server" onclick="bAddTag_Click" />
		</div>
	</div>
	<div>
		<asp:Button ID="bSave" runat="server" Text="Save" onclick="bSave_Click" />
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContentRight" runat="server">
</asp:Content>