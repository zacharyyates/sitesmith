/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/22/2008 1:36:16 PM
 */

using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web.Admin.Products
{
	public partial class Edit : BasePage
	{
		protected void Page_DataBinding( object sender, EventArgs e )
		{
			if( ItemId != null )
			{
				using( SiteSmithDataContext context = new SiteSmithDataContext() )
				{
					Product product = context.Products.FirstOrDefault(p =>
						p.ProductId == ItemId);

					if( product != null )
					{
						tbName.Text = product.Name;
						tbDescription.Text = product.Description;

						ddlManufacturer.DataSource = context.Manufacturers;
						ddlManufacturer.DataTextField = "Name";
						ddlManufacturer.DataValueField = "ManufacturerId";
						ddlManufacturer.DataBind();

						if( product.ManufacturerIdFk.HasValue )
						{
							ddlManufacturer.SelectedValue = product.ManufacturerIdFk.ToString();
						}

						gvTags.DataSource = from t in product.ProductTags
											select t.Tag;
						gvTags.DataBind();
					}
				}
			}
		}

		protected void bSave_Click( object sender, EventArgs e )
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Product product = context.Products.FirstOrDefault(p =>
						p.ProductId == ItemId);

				if (product != null)
				{
					product.Name = tbName.Text;
					product.Description = tbDescription.Text;

					if (!string.IsNullOrEmpty(ddlManufacturer.SelectedValue))
					{
						product.ManufacturerIdFk = new Guid(ddlManufacturer.SelectedValue);
					}

					context.SubmitChanges();
					DataBind(true);
				}
			}
		}

		protected void bAddTag_Click( object sender, EventArgs e )
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Product product = context.Products.FirstOrDefault(p =>
						p.ProductId == ItemId);

				if (product != null)
				{
					if (!string.IsNullOrEmpty(tbTag.Text))
					{
						Guid tagId = context.SingletonInsert<Tag>(new Tag { Name = tbTag.Text });

						ProductTag productTag = new ProductTag
						{
							ProductIdFk = product.ProductId,
							TagIdFk = tagId
						};
						context.ProductTags.InsertOnSubmit(productTag);
						try
						{
							context.SubmitChanges();
							DataBind(true);
						}
						catch (SqlException ex)
						{
							// most likely this is already inserted
							Trace.Write("Low", "Tried to insert tag: " + tbTag.Text, ex);
						}
					}
				}
			}
		}

		protected void gvTags_RowCommand( object sender, GridViewCommandEventArgs e )
		{
			if (e.CommandName == "DeleteTag")
			{
				using (SiteSmithDataContext context = new SiteSmithDataContext())
				{
					Product product = context.Products.FirstOrDefault(p =>
								p.ProductId == ItemId);

					if (product != null)
					{
						ProductTag productTag = context.ProductTags.FirstOrDefault(t =>
							t.TagIdFk == new Guid(e.CommandArgument.ToString()) &&
								t.ProductIdFk == product.ProductId);

						if (productTag != null)
						{
							context.ProductTags.DeleteOnSubmit(productTag);
							context.SubmitChanges();
							DataBind(true);
						}
					}
				}
			}
		}
	}
}