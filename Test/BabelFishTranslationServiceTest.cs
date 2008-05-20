using System.Diagnostics;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Test
{
    /// <summary>
    ///This is a test class for BabelFishTranslationServiceTest and is intended
    ///to contain all BabelFishTranslationServiceTest Unit Tests
    ///</summary>
	[TestClass()]
	public class BabelFishTranslationServiceTest
	{
		/// <summary>
		/// Gets or sets the test context which provides information about and functionality for the current test run.
		/// </summary>
		public TestContext TestContext { get; set; }

		/// <summary>
		///A test for Translate
		///</summary>
		[TestMethod()]
		public void TranslateTest()
		{
			BabelFishTranslationService target = new BabelFishTranslationService();
			string text = "The quick brown fox jumps over the lazy dog.";
			string expected = "El zorro marrón rápido salta sobre el perro perezoso.";
			string actual = target.Translate(TranslationMode.en_es, text);
			
			Trace.WriteLine("Text:\t\t" + text);
			Trace.WriteLine("Expected:\t" + expected);
			Trace.WriteLine("Actual:\t\t" + actual);
			
			Assert.AreEqual(expected, actual);
		}
	}
}