using System;
using System.Web.UI;

namespace YatesMorrison.SiteSmith.Web
{
	public partial class FCF : MasterPage
	{
        protected string[] departments = { "Firearms", "Ammunition", "Airsoft", "Paintball", "Tactical Gear" };

		protected void Page_Load(object sender, EventArgs e)
		{
            lContactInformation.Text = @"Phone 540.678.9110 <br />
                                        Fax 540.678.9115 <br />
                                        31E Jubal Early Drive <br />
                                        Winchester, VA 22601";
            lCurrentFeature.Text = "Advanced Training Session, come in this Friday between 11am and 2pm for a live advanced training event.";
            lTopBlurb.Text = "Frederick County Firearms is Northern Virginia's premium firearms store. We offer a large variety of firearms, ammunition and tactical gear.";
            lNewsletterText.Text = "Sign up below and receive updates on events and special offers from FCF.";
		}
	}
}