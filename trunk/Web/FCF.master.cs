using System;
using System.Linq;

using YatesMorrison.SiteSmith.Data;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Web
{
	public partial class FCF : BaseMasterPage
	{
		protected void Page_DataBinding( object sender, EventArgs e )
		{
			using( SiteSmithDataContext context = new SiteSmithDataContext() )
			{
				lvDepartments.DataSource = context.Departments.ToList();
				lvDepartments.DataBind();

				lContactInformation.Text = SettingService.GetSetting("ContactInformation");
				lCurrentFeature.Text = SettingService.GetSetting("CurrentFeature");
				lTopBlurb.Text = SettingService.GetSetting("TopBlurb");
				lNewsletterText.Text = SettingService.GetSetting("NewsletterText");
			}
		}
	}
}