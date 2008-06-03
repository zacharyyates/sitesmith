<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductDetailControl.ascx.cs" Inherits="YatesMorrison.SiteSmith.Web.Controls.BlockProductControl" %>
<%@ Register Namespace="YatesMorrison.SiteSmith.Web.Controls" Assembly="SiteSmith.Web" TagPrefix="SiteSmith" %>
<div class="ProductBlock">
	<div class="Name">
		<asp:Label ID="lName" runat="server" />
	</div>
	<div class="LeftCol">
		<div class="Image">
			<asp:Image ID="iMain" runat="server" />
		</div>
		<div class="ImageList">
			<SiteSmith:ImageList ID="ilMain" runat="server" PreviewImageControlId="iMain" />
		</div>
		<div class="Selector">
			<SiteSmith:PermutationSelector ID="psMain" runat="server" />
		</div>
	</div>
	<div class="RCol">
		<div class="Price"><asp:Label ID="lPrice" runat="server" /></div>
		<div class="Discounts"><asp:Label ID="lDiscounts" runat="server" /></div>
		<div class="Total"><asp:Label ID="lTotal" runat="server" /></div>
		<div class="Stock"><asp:Label ID="lStock" runat="server" /></div>
		<div class="DeliveryOptions"><asp:Label ID="lDeliveryOptions" runat="server" /></div>
		<div class="Buttons">
			<div class="AddToCart">
				<asp:Button ID="bAddToCart" runat="server" Text="Add to Cart" />
			</div>
			<div class="AddToWishlist">
				<asp:Button ID="bAddToWishlist" runat="server" Text="Add to Wishlist" />	
			</div>
			<div class="EmailThisPage">
				<asp:Button ID="bEmailThisPage" runat="server" Text="Email this Page" />
			</div>
			<div class="PrintThisPage">
				<asp:Button ID="bPrintThisPage" runat="server" Text="Print this Page" />
			</div>
			<div class="PriceAlert">
				<asp:Button ID="bPriceAlert" runat="server" Text="Price Alert" />
			</div>
		</div>
	</div>
</div>