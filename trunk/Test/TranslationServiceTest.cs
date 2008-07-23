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
	public class TranslationServiceTest
	{
		/// <summary>
		/// Gets or sets the test context which provides information about and functionality for the current test run.
		/// </summary>
		public TestContext TestContext { get; set; }

		/// <summary>
		/// A test for Translate
		/// </summary>
		[TestMethod()]
		public void TranslateTest()
		{
			string text = "The quick brown fox jumps over the lazy dog.";
			
			ITranslationService target = new BabelFishTranslationService();
			string expected = "El zorro marrón rápido salta sobre el perro perezoso.";
			string actual = target.Translate(new TranslationMode("en", "es"), text);

			Trace.WriteLine("Text (BabelFish):\t\t" + text);
			Trace.WriteLine("Expected (BabelFish):\t" + expected);
			Trace.WriteLine("Actual (BabelFish):\t\t" + actual);
			
			Assert.AreEqual(expected, actual);

			target = new GoogleTranslationService();
			expected = "El rápido zorro marrón salta sobre el perezoso perro.";
			actual = target.Translate(new TranslationMode("en", "es"), text);

			Trace.WriteLine("Text (Google):\t\t" + text);
			Trace.WriteLine("Expected (Google):\t\t" + expected);
			Trace.WriteLine("Actual (Google):\t\t" + actual);

			Assert.AreEqual(expected, actual);
		}
	}
}