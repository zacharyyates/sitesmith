using System;
using System.Web.UI;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web.Controls
{
	public partial class BlockProductControl : BaseUserControl<Product>
	{
		public bool ShowName { get; set; }
		public bool ShowTags { get; set; }

		protected override void OnDataBinding( EventArgs e )
		{
			if( DataItem != null )
			{
				lName.Text = ShowName ? DataItem.Name : string.Empty;
				lPrice.Text = DataItem.ProductPermutations[0].MSRP.ToString(); // HACK: Set this correctly
				psMain.DataItem = DataItem;
				psMain.DataBind();
			}

			base.OnDataBinding(e);
		}
	}
}