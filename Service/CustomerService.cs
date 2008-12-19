/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/4/2008 3:45:16 PM
 */

using System;
using System.Linq;

using YatesMorrison.SiteSmith.Data;
using YatesMorrison.Security.Authorization;
using YatesMorrison.Security.Authentication;

namespace YatesMorrison.SiteSmith.Service
{
	public class CustomerService
	{
		public Customer Register(string emailAddress, string password)
		{
			// Create the record
			Customer customer = null;
			using (SiteSmithDataContext siteSmithContext = new SiteSmithDataContext())
			using (AuthorizationDataContext authorizationContext = new AuthorizationDataContext())
			using (AuthenticationDataContext authenticationContext = new AuthenticationDataContext())
			{
				Guid customerId = Guid.NewGuid();
				customer = new Customer
				{
					Id = customerId,
					IsEnabled = true,
					UserName = emailAddress,
					Account = new Account
					{
						Id = Guid.NewGuid(),
						Name = emailAddress,
						Created = DateTime.UtcNow,
						Modified = DateTime.UtcNow,
						IsEnabled = true
						// TODO: Add the restriction field
					},
					Contact = new Contact
					{
						Id = customerId,
						EmailAddress = emailAddress
					}
				};
				siteSmithContext.Customers.InsertOnSubmit(customer);
				siteSmithContext.SubmitChanges();

				// Create the authorization objects
				Securable acctSecurable = new Securable
				{
					SecurableId = customer.Account.Id,
					Name = emailAddress
				};
				authorizationContext.Securables.InsertOnSubmit(acctSecurable);

				Securable custSecurable = new Securable
				{
					SecurableId = customer.Id,
					Name = emailAddress
				};
				authorizationContext.Securables.InsertOnSubmit(custSecurable);

				Actor custActor = new Actor
				{
					ActorId = customerId,
					UserIdentifier = emailAddress
				};
				authorizationContext.Actors.InsertOnSubmit(custActor);
				authorizationContext.SubmitChanges();

				// Create the authentication object
				User user = new User
				{
					UserName = emailAddress,
					UserId = customerId,
					Created = DateTime.UtcNow,
					Modified = DateTime.UtcNow,
					Password = password
					// TODO: Add the state enum
				};
				authenticationContext.Users.InsertOnSubmit(user);
				authenticationContext.SubmitChanges();
			}

			return customer;
		}

		public bool VerifyUserName(string emailAddress)
		{
			using (AuthenticationDataContext context = new AuthenticationDataContext())
			{
				int count = (from u in context.Users
							 where u.UserName == emailAddress
							 select u).Count();
				return count > 0;
			}
		}

		public bool VerifyPassword(string emailAddress, string password)
		{
			using (AuthenticationDataContext context = new AuthenticationDataContext())
			{
				var user = context.Users.Single(u => u.UserName == emailAddress);

				// TODO: Add password hash stuff
				return (user.Password == password);
			}
		}
	}
}