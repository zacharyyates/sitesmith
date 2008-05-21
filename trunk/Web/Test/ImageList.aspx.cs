using System;
using System.Web.UI;
using System.Linq;
using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web.Test
{
	public partial class ImageList : Page
	{
		protected void Page_Load( object sender, EventArgs e )
		{
			if (!IsPostBack) { BindData(); }
		}

		void BindData()
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				ilTest.Images = context.Medias.Where(i => 
					i.Type == MediaType.Image).ToList();
			}
		}
	}
}
