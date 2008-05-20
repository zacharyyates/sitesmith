using YatesMorrison.SiteSmith.Service;
using Microsoft.VisualStudio.TestTools.UnitTesting;
namespace YatesMorrison.SiteSmith.Test
{
    /// <summary>
    /// This is a test class for SettingServiceTest and is intended to contain all SettingServiceTest Unit Tests
    ///</summary>
	[TestClass()]
	public class SettingServiceTest
	{
		/// <summary>
		///Gets or sets the test context which provides information about and functionality for the current test run.
		///</summary>
		public TestContext TestContext { get; set; }

		/// <summary>
		/// A test for GetSetting
		/// </summary>
		[TestMethod()]
		public void GetSettingTest()
		{
			string name = string.Empty; // TODO: Initialize to an appropriate value
			string expected = string.Empty; // TODO: Initialize to an appropriate value
			string actual;
			actual = SettingService.GetSetting(name, "en-US");
			Assert.AreEqual(expected, actual);
			Assert.Inconclusive("Verify the correctness of this test method.");
		}
	}
}