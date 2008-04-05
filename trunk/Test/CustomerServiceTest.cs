/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/5/2008 10:55:16 AM
 */

using System.Diagnostics;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using YatesMorrison.SiteSmith.Data;
using YatesMorrison.SiteSmith.Service;

namespace YatesMorrison.SiteSmith.Test
{
	/// <summary>
	/// Tests the CustomerService
	/// </summary>
	[TestClass]
	public class CustomerServiceTest
	{
		public TestContext TestContext { get; set; }

		[TestMethod]
		public void Register()
		{
			CustomerService service = new CustomerService();
			Customer customer1 = service.Register("zachary.yates@gmail.com", "password");

			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Customer customer2 = context.Customers.Single(c => c.CustomerId == customer1.CustomerId);
				Assert.IsNotNull(customer2);
				Trace.TraceInformation(customer2.CustomerId.ToString());

				context.Customers.DeleteOnSubmit(customer2);
				context.SubmitChanges();
			}
		}
	}
}
