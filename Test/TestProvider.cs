using System.Configuration.Provider;

namespace YatesMorrison.SiteSmith.Test
{
	public class TestProvider : ProviderBase
	{
		public string HelloWorld() { return "Hello World!"; }
	}
}