using System.Collections.Generic;
using System.Linq;

using Microsoft.VisualStudio.TestTools.UnitTesting;
using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Test
{
	/// <summary>
	/// Summary description for MediaTest
	/// </summary>
	[TestClass]
	public class MediaTest
	{
		/// <summary>
		/// Gets or sets the test context which provides information about and functionality for the current test run.
		/// </summary>
		public TestContext TestContext { get; set; }

		[TestMethod]
		public void TestDbQuery()
		{
			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				List<Media> medias = context.Medias.ToList();
			}
		}
	}
}
