using Microsoft.VisualStudio.TestTools.UnitTesting;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Test
{  
	[TestClass]
	public class ProviderManagerTest
	{
		/// <summary>
		/// Gets or sets the test context which provides information about and functionality for the current test run.
		/// </summary>
		public TestContext TestContext { get; set; }

		[TestMethod]
		public void InitializationTest()
		{
			var provider = ProviderManager<TestProvider>.Provider;
			var helloWorld = provider.HelloWorld();
			Assert.IsNotNull(provider);
			Assert.AreEqual("Hello World!", helloWorld);
		}
	}
}