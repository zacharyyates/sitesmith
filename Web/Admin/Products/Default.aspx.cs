using System;
using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web.Admin.Products
{
	public partial class Default : BasePage
	{
		protected void Page_Load( object sender, EventArgs e )
		{

		}

		protected void bNew_Click( object sender, EventArgs e )
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Product product = new Product
				{
					ProductId = Guid.NewGuid(),
					Name = "New Product",
					Created = DateTime.UtcNow,
					Modified = DateTime.UtcNow
				};

				context.Products.InsertOnSubmit(product);
				context.SubmitChanges();

				Response.Redirect("Edit.aspx?id=" + product.ProductId);
			}
		}
	}
}
