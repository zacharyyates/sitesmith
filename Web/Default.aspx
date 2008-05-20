<%@ Page Language="C#" MasterPageFile="~/FCF.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="YatesMorrison.SiteSmith.Web.Default" Title="Frederick County Firearms: Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContentCenter" runat="server">
    <asp:GridView ID="gvArticles" runat="server" AutoGenerateColumns="false" GridLines="None">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <div class="article_wrapper">
                    <h2><!--Title--></h2>
                    <p><!--Body--></p>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContentRight" runat="server">
    <asp:GridView ID="gvFeaturedProducts" runat="server" AutoGenerateColumns="false" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="rightbox_wrapper">                        
                        <div class="rightbox">
                            <!--Product Image <img src='' class='product_image' alt=''/>-->
                            <div class="product_wrapper">
                                <!--Product Description-->
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
