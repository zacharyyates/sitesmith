using System;
using System.Web.UI;
using System.Linq;

using YatesMorrison.SiteSmith.Data;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Web
{
	public partial class FCF : BaseMasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				BindData();
			}
		}

		void BindData()
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
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