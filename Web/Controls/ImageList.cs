/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 5/21/2008 3:13:16 PM
 */

using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Web.Controls
{
	public class ImageList : WebControl
	{
		public List<Media> Images
		{
			get { return m_Images; }
			set { m_Images = value; }
		}
		List<Media> m_Images = new List<Media>();

		public string ImageCssClass { get; set; }
		public string PreviewImageControlId { get; set; }
		public ImageSize ImageSize 
		{
			get { return m_ImageSize; }
			set { m_ImageSize = value; }
		}
		ImageSize m_ImageSize = ImageSize.Original;

		protected override void CreateChildControls()
		{
			Controls.Clear();

			foreach (Media media in Images)
			{
				if (media.Type == MediaType.Image)
				{
					Image image = new Image
					{
						ID = this.ID + "_Image_" + media.MediaId,
						CssClass = ImageCssClass,
						ToolTip = media.Name,
						ImageUrl = string.Format(
							"~/Include/ImageHandler.ashx?id={0}&size={1}",
							media.MediaId, (int)ImageSize)
					};
					Controls.Add(image);
				}
			}
		}

		protected override void RenderChildren( HtmlTextWriter writer )
		{
			foreach (Image image in Controls.OfType<Image>())
			{
				image.RenderControl(writer);
			}
		}
	}
}